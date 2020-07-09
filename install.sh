#!/bin/bash

echo "Installing packages...."
bash package.sh
echo "Installing pip packages...."
pip3 install -r requirements.txt