import boto3
import codecs

def lambda_handler(event, context):
    
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