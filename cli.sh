#!/bin/bash



echo "Updating system..."
sudo apt update -y

echo "Installing dependencies..."
sudo apt install -y unzip curl

echo "Downloading AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "Unzipping package..."
unzip awscliv2.zip

echo "Installing AWS CLI..."
sudo ./aws/install

echo "Verifying installation..."
aws --version