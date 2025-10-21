import boto3

def lambda_handler(event, context):

    S3FileName = event['S3FileName']

    with open(r(S3FileName)) as file:
        lineWordCount = 0
        for line in file:
            print(line)
            print(len(line.split()))
            currentWordLineCount = len(line.split())
            lineWordCount = lineWordCount + currentWordLineCount
            print(f"The word count in the {file.name} file is {lineWordCount}")