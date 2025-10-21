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
AWSTemplateFormatVersion: 2010-09-09
Description: Lab template

# Lab VPC with public subnet and Internet Gateway

Parameters:

  LabVpcCidr:
    Type: String
    Default: 10.0.0.0/20

  PublicSubnetCidr:
    Type: String
    Default: 10.0.0.0/24

  PrivateSubnetCidr:
    Type: String
    Default: 10.0.8.0/24

  AmazonLinuxAMIID:
    Type: AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>
    Default: /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2

  KeyName:
    Type: String
    Description: Keyname for the keypair that you will use to connect to the Web Server EC2 instance
    Default: vockey

Resources:

###########
# VPC with Internet Gateway
###########

  LabVPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: !Ref LabVpcCidr
      EnableDnsSupport: true
      EnableDnsHostnames: true
      Tags:
        - Key: Name
          Value: Lab VPC

  IGW:
    Type: AWS::EC2::InternetGateway
    Properties:
      Tags:
        - Key: Name
          Value: Lab IGW

  VPCtoIGWConnection:
    Type: AWS::EC2::VPCGatewayAttachment
    DependsOn:
      - IGW
      - LabVPC
    Properties:
      InternetGatewayId: !Ref IGW
      VpcId: !Ref LabVPC

###########
# Public Route Table
###########

  PublicRouteTable:
    Type: AWS::EC2::RouteTable
    DependsOn: LabVPC
    Properties:
      VpcId: !Ref LabVPC
      Tags:
        - Key: Name
          Value: Public Route Table

  PublicRoute:
    Type: AWS::EC2::Route
    DependsOn:
      - PublicRouteTable
      - IGW
    Properties:
      DestinationCidrBlock: 0.0.0.0/0
      GatewayId: !Ref IGW
      RouteTableId: !Ref PublicRouteTable

###########
# Public Subnet
###########

  PublicSubnet:
    Type: AWS::EC2::Subnet
    DependsOn: LabVPC
    Properties:
      VpcId: !Ref LabVPC
      MapPublicIpOnLaunch: true
      CidrBlock: !Ref PublicSubnetCidr
      AvailabilityZone: !Select
        - 0
        - !GetAZs
          Ref: AWS::Region
      Tags:
        - Key: Name
          Value: Public Subnet

  PublicRouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    DependsOn:
      - PublicRouteTable
      - PublicSubnet
    Properties:
      RouteTableId: !Ref PublicRouteTable
      SubnetId: !Ref PublicSubnet

###########
# Private Subnet
###########

  PrivateSubnet:
    Type: AWS::EC2::Subnet
    DependsOn: LabVPC
    Properties:
      VpcId: !Ref LabVPC
      MapPublicIpOnLaunch: false
      CidrBlock: !Ref PrivateSubnetCidr
      AvailabilityZone: !Select 
        - 0
        - !GetAZs 
          Ref: AWS::Region
      Tags:
        - Key: Name
          Value: Private Subnet


###########
# EC2 Instance
###########

  WebServerInstance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: !Ref AmazonLinuxAMIID
      KeyName: !Ref KeyName
      InstanceType: t3.micro
      SecurityGroupIds:
        - !Ref WebSecurityGroup
      SubnetId: !Ref PublicSubnet
      Tags:
        - Key: Name
          Value: Web Server
      UserData:
        Fn::Base64: !Sub |
          #!/bin/bash -ex
          hostnamectl set-hostname Web-Server
          yum install -y httpd
          echo '<html><h1>Hello from your web server!</h1></html>' > /var/www/html/index.html
          systemctl enable httpd
          systemctl start httpd
          /opt/aws/bin/cfn-signal -s true '${WaitHandle}'

  WaitHandle:
    Type: AWS::CloudFormation::WaitConditionHandle

  WaitCondition:
    Type: AWS::CloudFormation::WaitCondition
    DependsOn: WebServerInstance
    Properties:
      Handle: !Ref WaitHandle
      Timeout: '60'

###########
# Web Security Group
###########

  WebSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    DependsOn: LabVPC
    Properties:
      GroupName: WebServerSG
      GroupDescription: Enable access to web server
      VpcId: !Ref LabVPC
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: '80'
          ToPort: '80'
          CidrIp: 0.0.0.0/0
        - IpProtocol: tcp
          FromPort: '22'
          ToPort: '22'
          CidrIp: 0.0.0.0/0
      Tags:
        - Key: Name
          Value: WebServerSG

###########
# Outputs
###########

Outputs:

  PublicIP:
    Value: !GetAtt
      - WebServerInstance
      - PublicIp
    """

    # Example parameters for the template
#    sample_parameters = [
#        {'ParameterKey': 'InstanceType', 'ParameterValue': 't3.micro'}
#    ]

    stack_name = "MyChallengeLabPythonStack"
    aws_region = "us-west-2"  # Replace with your desired AWS region

    #create_cloudformation_stack(stack_name, sample_template, sample_parameters, aws_region)
    create_cloudformation_stack(stack_name, sample_template, None, aws_region)