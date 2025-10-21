import boto3
import codecs
import json
import os
import io


def lambda_handler(event, context):
    # Retrieve the topic ARN & region where the lambda function is running from environment variables.

    TOPIC_ARN = os.environ['topicARN']
    FUNCTION_REGION = os.environ['AWS_REGION']

    # Extract the topic region from the topic ARN.

    arnParts = TOPIC_ARN.split(':')
    TOPIC_REGION = arnParts[3]
    
    # Create an SNS client, and format and publish a message based on the 'Word' Count result

    snsClient = boto3.client('sns', region_name=TOPIC_REGION)


    s3 = boto3.resource("s3")
    s3BucketName = event['Records'][0]['s3']['bucket']['name']
    s3FileName = event['Records'][0]['s3']['object']['key']

    s3_object = s3.Object(s3BucketName, s3FileName)   
    line_stream = codecs.getreader("utf-8")

    lineWordCount = 0
    for line in line_stream(s3_object.get()['Body']):
        currentWordLineCount = len(line.split())
        lineWordCount = lineWordCount + currentWordLineCount
    print(f"The word count in the {s3FileName} file is {lineWordCount}")

    # Write the header first.
    message = io.StringIO()
    message.write('\n')
    message.write(f"The word count in the {s3FileName} file is {lineWordCount}.".center(80))

    # Publish the message to the topic.

    response_test = snsClient.publish(
        TopicArn = TOPIC_ARN,
        Subject = 'Word Count Result',
        Message = message.getvalue()
    )

    # Return a successful function execution message.

    return {
        'statusCode': 200,
        'body': json.dumps('Lambda Challenge Notification sent.')
    }
    