#!/bin/bash

REGION="us-east-1"
read -p "Introduce nombre del Bucket: " BUCKET_NAME
read -p "Introduce nombre la Ruta de la carpeta: " WEB_DIR

aws s3api create-bucket \
--bucket $BUCKET_NAME \
--region $REGION

aws s3api put-public-access-block \
--bucket $BUCKET_NAME \
--public-access-block-configuration \
BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

aws s3 sync $WEB_DIR s3://$BUCKET_NAME/

aws s3 ls s3://$BUCKET_NAME/