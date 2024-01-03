#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Would you like to install it? (y/n)"
  read -r response
  if [[ $response =~ ^[Yy] ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"; brew install tor
  else
    echo "Aborting. You can install Homebrew manually from https://brew.sh/."
    exit 1
  fi
fi

#Check if tor is installed
if ! command -v tor &>/dev/null; then
  echo "Tor from brew is not installed. Would you like to install it? (y/n)"
  read -r response
  if [[ $response =~ ^[Yy] ]]; then
    brew install tor
  else
    echo "Aborting. You can install Homebrew manually using command: brew install tor"
    exit 1
  fi
fi

# Interface name (e.g., 'Wi-Fi', 'Ethernet')
echo "Choose interface Wi-Fi or Ethernet"
read -r interface_c
if [[ $interface_c =~ ^(Wi-Fi|wifi|WIFI|wi-fi|Wifi)$ ]]; then
   INTERFACE="Wi-Fi"
else
   INTERFACE="Ethernet"
fi
     
# Function to disable the proxy
function disable_proxy() {
  sudo networksetup -setsocksfirewallproxystate "$INTERFACE" off
  echo "$(tput setaf 64)" # green
  echo "SOCKS proxy disabled."
  echo "$(tput sgr0)" # color reset
}
trap disable_proxy INT

# Keep-alive: update existing `sudo` time stamp until finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# Enable the SOCKS proxy
sudo networksetup -setsocksfirewallproxy "$INTERFACE" 127.0.0.1 9050 off
sudo networksetup -setsocksfirewallproxystate "$INTERFACE" on

echo "$(tput setaf 64)" # green
echo "SOCKS proxy 127.0.0.1:9050 enabled."
echo "$(tput setaf 136)" # orange
echo "Starting Tor..."
echo "$(tput sgr0)" # color reset

# Start the Tor service
tor
