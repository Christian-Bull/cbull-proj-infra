#! /bin/bash

bucket_name=cbull-proj-lab-tf-state
aws_profile=cbull-projects

aws-vault exec $aws_profile -- aws s3api create-bucket --bucket $bucket_name --region us-east-1