#!/bin/bash
exec > /var/log/user-data.log 2>&1

# Update the system
sudo yum update -y

# Install Docker
sudo amazon-linux-extras install docker -y

# Start Docker service
sudo service docker start

# Add the ec2-user to the docker group
sudo usermod -a -G docker ec2-user

# Download and install Docker Compose
LATEST_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
sudo curl -L "https://github.com/docker/compose/releases/download/${LATEST_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create a symlink to make docker-compose available in the sudo path
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Restart Docker service
sudo service docker restart

# Sleep for sometime
sleep 10

# Verify Docker and Docker Compose installation
docker --version
docker-compose --version

# Create a folder
sudo mkdir /home/ec2-user/workbuddy-app/

# Download docker-compose.yaml
sudo curl -L https://raw.githubusercontent.com/aj-learnings/workbuddy-cloud/master/docker/docker-compose.yaml -o /home/ec2-user/workbuddy-app/docker-compose.yaml

# Get public IP
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
PUBLIC_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)

# Change the API_URL in UI
sudo sed -i "s#API_URL:.*#API_URL: http://$PUBLIC_IP:9401#g" /home/ec2-user/workbuddy-app/docker-compose.yaml

# Start services defined in docker-compose.yaml
sudo docker-compose -f "/home/ec2-user/workbuddy-app/docker-compose.yaml" up -d
