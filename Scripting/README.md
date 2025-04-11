# Apache Installation Script with Custom HTML Page

This repository contains a Bash script to install Apache on an Amazon EC2 instance Amazon Linux and configure it to serve a custom HTML page. When the script is executed, it will install Apache, create a directory to store the HTML file, and serve a simple webpage on the EC2 instance's public IP.

## Requirements

- An Amazon EC2 instance (Amazon Linux 2 or compatible).
- An active internet connection to download packages.
- Proper security group settings to allow HTTP traffic (port 80).

## Installation

### Step 1: Clone the Repository

First, clone the repository to your EC2 instance:

```bash
git clone https://github.com/baig892/Scripting.git
cd Scripting




## Step 2: Run the Bash Script
Execute the installation script to install Apache and set up the custom HTML page:

bash
Copy
Edit
chmod +x install_apache_amazon.sh
./install_apache_amazon.sh

This will:

Install Apache (httpd).

Create a custom directory for serving the HTML file.

Move the index.html file to the Apache directory.

Set the correct permissions for the files.

Start the Apache service and enable it to start on boot.

Display the EC2 public IP where the webpage can be accessed.


## Step 3: Access the Webpage
Once the script has completed, open a web browser and go to your EC2 instance’s public IP address:

cpp
Copy
Edit
http://<your-ec2-public-ip>




# EC2 Instance Creation Script (with Auto IP Fetch)

This script automates the creation of an AWS EC2 instance using AWS CLI and retrieves its Public IP address.


efore running this script, make sure you have:

✅ AWS CLI installed and configured (aws configure)

✅ A valid Key Pair created in AWS EC2 Console

✅ A valid Security Group ID

✅ A valid AMI ID for your region (e.g., Amazon Linux 2)

✅ Permissions to create EC2 instances in your AWS account

📄 Script Overview
The script performs the following steps:

Launches an EC2 instance using your provided configuration

Waits for the instance to initialize

Tries up to 5 times (every 10 seconds) to fetch the Public IP address

If found, prints the IP — else shows an error

⚙️ How to Use
Update the script with your own values:

AMI_ID → Your preferred Amazon Machine Image ID

KEY_NAME → Your key pair name (no .pem extension)

SECURITY_GROUP → Your security group ID

REGION → Your desired AWS region

Make the script executable:

bash
Copy
Edit
chmod +x create-ec2.sh
Run the script:

bash
Copy
Edit
./create-ec2.sh
✅ If successful, you’ll see:

typescript
Copy
Edit
EC2 instance ka public IP address: <Your IP Here>
📌 Sample Output
css
Copy
Edit
EC2 instance i-1234567890abcdef0 create ho raha hai...
Public IP address abhi tak available nahi hai. Wait kar rahe hain... (1/5)
Public IP address abhi tak available nahi hai. Wait kar rahe hain... (2/5)
EC2 instance ka public IP address: 3.120.45.89




### master-script.sh Overview


The master-script.sh automates the process of creating an EC2 instance, copying an index.html file to the instance, and starting a local HTTP server to serve the file. The script also opens the instance's public IP in your default browser for easy access to the content.

Workflow:

Create EC2 Instance:

The script calls create-ec2-script.sh to create a new EC2 instance on AWS.

It extracts the instance's public IP address after successful creation.

Wait for EC2 to be Ready:

The script waits for 30 seconds to ensure that the EC2 instance is fully ready to accept connections. You may need to increase this wait time if your instance takes longer to start.

Copy index.html to EC2:

The script copies a predefined index.html file from your local machine to the EC2 instance using scp (secure copy).

The index.html file will be placed in the default directory on the EC2 instance.

Start HTTP Server on EC2:

It then starts a Python HTTP server on port 8080 to serve the index.html file.

The server runs in the background, allowing you to access the file through your browser.

Open URL in Browser:

The script automatically opens the EC2 instance's public IP in your browser: http://<EC2-PUBLIC-IP>:8080, where the index.html file is being served.

Requirements:
Private Key File (.pem):

Ensure you have the correct private key file (shell_script.pem) associated with the EC2 instance.

The private key file must have restricted permissions (chmod 400 shell_script.pem).

AWS CLI installed and configured on your machine.

Security Group Configuration:

The EC2 instance’s security group should allow inbound connections on port 22 (SSH) and port 8080 (HTTP).

Usage:
Make the script executable:

bash

chmod +x master-script.sh

Run the script:

bash run this cmd in ssh:

./master-script.sh

After running the script:

A new EC2 instance will be created.

The index.html file will be uploaded to the instance.

A Python HTTP server will be started on the instance.

The URL http://<EC2-PUBLIC-IP>:8080 will open in your browser, where you can see the contents of the index.html file.







