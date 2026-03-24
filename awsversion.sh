#!/bin/bash


read -p "Introduce tu Access Key ID: " ACCESS_KEY
read -sp "Introduce tu Secret Access Key: " SECRET_KEY
echo " "
read -p "Introduce la Región (ej. us-east-1): " REGION
read -p "Formato de salida (ej. json): " OUTPUT_FORMAT

aws --version

aws configure set aws_access_key_id "$ACCESS_KEY"
aws configure set aws_secret_access_key "$SECRET_KEY"
aws configure set default.region "$REGION"
aws configure set default.output "$OUTPUT_FORMAT"

aws sts get-caller-identity
