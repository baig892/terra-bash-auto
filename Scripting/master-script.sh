#!/bin/bash

echo " Step 1: EC2 instance create kar rahe hain..."
INSTANCE_INFO=$(./create-ec2-script)

# Extract Public IP from output
PUBLIC_IP=$(echo "$INSTANCE_INFO" | grep -oP 'EC2 instance ka public IP address: \K[\d.]+')

if [ -z "$PUBLIC_IP" ]; then
    echo "
    Public IP nahi mila. Exit ho rahe hain."
    exit 1
fi

echo " EC2 instance created successfully with IP: $PUBLIC_IP"

# Step 2: Wait for EC2 to be ready
echo " Waiting for EC2 to be ready (30 seconds)..."
sleep 30

# Step 3: Copy index.html to EC2 instance
echo " Copying index.html to EC2..."

# Make sure you replace shell_script.pem with your actual PEM file
scp -i two-tier-app-k8s.pem -o StrictHostKeyChecking=no ./index.html ec2-user@$PUBLIC_IP:/home/ec2-user/

# Step 4: SSH and start Python server
echo " Starting HTTP server on EC2..."
ssh -i shell_script.pem -o StrictHostKeyChecking=no ec2-user@$PUBLIC_IP << EOF
nohup python3 -m http.server 8080 > /dev/null 2>&1 &
EOF

# Step 5: Open URL in browser
echo " Opening in browser: http://$PUBLIC_IP:8080"
xdg-open "http://$PUBLIC_IP:8080" 2>/dev/null || open "http://$PUBLIC_IP:8080" 2>/dev/null || echo " Open this URL manually: http://$PUBLIC_IP:8080"
