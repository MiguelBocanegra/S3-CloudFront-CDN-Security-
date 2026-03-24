#  AWS Static Website with S3 + CloudFront (CLI Project)

## Project Overview
This project demonstrates how to deploy a static website on AWS using the AWS CLI, including IAM user creation, CLI configuration, S3 bucket setup, and CloudFront distribution. The implementation was performed manually using scripts to simulate a real-world environment and automation workflow.

## Tech Stack
- Amazon S3
- Amazon CloudFront
- AWS IAM
- AWS CLI
- Bash scripting

## Architecture
User (Browser) → HTTPS Request → CloudFront Distribution (CDN) → Amazon S3 Bucket (Static Website)

## Implementation Steps
1. Log in to the AWS Management Console and open CloudShell.  
2. Create an IAM user using: aws iam create-user --user-name <user_name>  
3. Attach permissions using: aws iam attach-user-policy --user-name <user_name> --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess  
4. Attach CloudFront permissions using: aws iam attach-user-policy --user-name <user_name> --policy-arn arn:aws:iam::aws:policy/CloudFrontFullAccess  
5. Validate permissions using: aws iam list-attached-user-policies --user-name <user_name>  
6. Create access keys using: aws iam create-access-key --user-name <user_name> and store them securely.  
7. Prepare CLI installation script by removing hidden characters with: sed -i 's/\r$//' cli.sh, then run chmod +x cli.sh and sudo ./cli.sh. This script updates the system, installs curl and unzip, downloads AWS CLI, installs it, and verifies installation using aws --version.  
8. Configure AWS CLI using: sed -i 's/\r$//' awsversion.sh, chmod +x awsversion.sh, and sudo ./awsversion.sh. This script requests Access Key, Secret Key, region, and output format, then configures AWS CLI and validates with aws sts get-caller-identity.  
9. Create and configure the S3 bucket using: sed -i 's/\r$//' awss3buc.sh, chmod +x awss3buc.sh, and sudo ./awss3buc.sh. This script creates the bucket with aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION, blocks public access using aws s3api put-public-access-block, uploads files with aws s3 sync $WEB_DIR s3://$BUCKET_NAME/, and validates with aws s3 ls s3://$BUCKET_NAME.  
10. Create a CloudFront distribution using: aws cloudfront create-distribution --origin-domain-name your-bucket-name.s3.amazonaws.com.  
11. Create a policy.json file with permissions to allow public read access to S3 objects.  
12. Temporarily enable public access using: aws s3api put-public-access-block --bucket <bucket_name> --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false.  
13. Apply the bucket policy using: aws s3api put-bucket-policy --bucket your-bucket-name --policy file://policy.json.  
14. Re-enable security restrictions using: aws s3api put-public-access-block --bucket <your-bucket-name> --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true.  
15. Retrieve the CloudFront domain using: aws cloudfront list-distributions and open https://<distribution-domain>/index.html in a browser.  

## Challenges Faced
- Managing public access restrictions in S3  
- Understanding CloudFront configuration  
- Handling hidden characters in scripts  

## Solutions Implemented
- Removed hidden characters using sed  
- Applied correct bucket policies  
- Configured public access step-by-step  

## What I Learned
- How to deploy a static website using AWS CLI  
- How to configure IAM users and permissions  
- How S3 security works (public vs private)  
- How CloudFront integrates with S3  
- Importance of automation using scripts  

## Future Improvements
- Add HTTPS using AWS Certificate Manager  
- Automate deployment with CI/CD  
- Use Infrastructure as Code (Terraform)  

## Author
Miguel Bocanegra  

