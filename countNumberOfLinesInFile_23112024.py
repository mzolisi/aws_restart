import boto3
import codecs

def lambda_handler(event, context):


    s3 = boto3.resource("s3")
    s3_object = s3.Object('lambda-challenge-bucket-mzo', 'SampleTextLambda.txt')   
    line_stream = codecs.getreader("utf-8")

    lineWordCount = 0
    for line in line_stream(s3_object.get()['Body']):
        print(line)
        print(len(line.split()))
        currentWordLineCount = len(line.split())
        lineWordCount = lineWordCount + currentWordLineCount
    print(f"The word count in the 'SampleTextLambda.txt' file is {lineWordCount}")