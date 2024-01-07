#!/bin/bash

# read ~/.env and export any key/value pairs

for line in `cat ~/.env`
do
  export $line
done
# Update the system
sudo apt-get update

# Install necessary software
sudo apt-get install -y apt-transport-https curl

# Add the Tailscale's GPG key
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add -

# Add the Tailscale's repository
echo "deb https://pkgs.tailscale.com/stable/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/tailscale.list

# Update the package list and install Tailscale
sudo apt-get update
sudo apt-get install -y tailscale

if [ -z $TAILSCALE_TOKEN ]; then 
# Ask the user for the Tailscale token
echo "Please enter your Tailscale token:"
read -s TAILSCALE_TOKEN
fi

# Authenticate and connect to Tailscale
sudo tailscale up --authkey=$TAILSCALE_TOKEN --advertise-routes=172.18.0.0/16 --hostname=$HOSTNAME

# Enable the Tailscale service to start on boot
sudo systemctl enable --now tailscaled

