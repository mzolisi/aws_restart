import boto3
import json

def create_cloudformation_stack(stack_name, template_body, parameters=None, region='us-west-2'):
    """
    Creates an AWS CloudFormation stack.

    Args:
        stack_name (str): The name of the CloudFormation stack to create.
        template_body (str): The CloudFormation template content (YAML or JSON).
        parameters (list, optional): A list of dictionaries for stack parameters.
                                     Each dictionary should have 'ParameterKey' and 'ParameterValue'.
        region (str): The AWS region to create the stack in.
    """
    client = boto3.client('cloudformation', region_name=region)

    try:
        response = client.create_stack(
            StackName=stack_name,
            TemplateBody=template_body,
            Parameters=parameters if parameters else [],
            Capabilities=['CAPABILITY_IAM', 'CAPABILITY_NAMED_IAM'] # Add capabilities if your template creates IAM resources
        )
        print(f"Stack creation initiated for '{stack_name}'. Stack ID: {response['StackId']}")
    except client.exceptions.AlreadyExistsException:
        print(f"Stack '{stack_name}' already exists.")
    except Exception as e:
        print(f"Error creating stack '{stack_name}': {e}")

if __name__ == "__main__":
    # Example CloudFormation template (YAML format)
    sample_template = """
AWSTemplateFormatVersion: '2010-09-09'
Description: A simple EC2 instance template
Parameters:
  InstanceType:
    Type: String
    Default: t3.micro
    Description: EC2 instance type
  LatestAmiId:
    Type: AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>
    Default: /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2
Resources:
  MyEC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: !Ref LatestAmiId
      InstanceType: !Ref InstanceType
      Tags:
        - Key: Name
          Value: MySampleInstance
Outputs:
  InstanceId:
    Description: The ID of the EC2 instance
    Value: !Ref MyEC2Instance
    """

    # Example parameters for the template
    sample_parameters = [
        {'ParameterKey': 'InstanceType', 'ParameterValue': 't3.micro'}
    ]

    stack_name = "MyChallengeLabStack"
    aws_region = "us-west-2"  # Replace with your desired AWS dddregion

    create_cloudformation_stack(stack_name, sample_template, sample_parameters, aws_region)