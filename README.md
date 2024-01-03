<div id="header" align="center">
  <img src="https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbjN6dG1jZmRhdzd0ajNoeTRkcWcycjM4YzBpb3RoNm9iMTVwN3dtMiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3o85fTbmA8BbUhJvri/giphy.gif" width="100"/>
</div>

# Tor Proxy Setup Script

This bash script automates the setup of a SOCKS proxy using Tor on macOS, utilizing Homebrew.

## Prerequisites

- macOS
- [Homebrew](https://brew.sh/) 
- [Tor](https://www.torproject.org/) 
all requirment installed automatically if not present

## Installation

1. Open a terminal window.

2. Run the following command to download and execute the script:

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mar0ls/tor_proxy_mac/main/tor-proxy.sh)"
    ```

3. Follow the on-screen instructions to install Homebrew, Tor, and configure the SOCKS proxy.

## Usage

1. Run the script:

    ```bash
    ./tor-proxy.sh
    ```

2. Follow the prompts to install Homebrew, Tor, and configure the SOCKS proxy.

3. Choose your network interface when prompted (Wi-Fi or Ethernet).

4. The script will enable a SOCKS proxy on `127.0.0.1:9050` using the selected network interface.

## Disabling the Proxy

To disable the SOCKS proxy, press `Ctrl+C` in the terminal where the script is running.

## Configuration Options

You can customize the script by modifying the following parameters:

- `INTERFACE`: The network interface to use for the proxy (default: Wi-Fi or Ethernet).

Edit these variables directly in the script to suit your preferences.

<div id="header" align="center">
  <img src="https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExbDJ1ZGowd2x3ZXJydWR1ZzI5NDlnZTFpeHczazExNnZ2eXc3Ym9oZiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT0GqDPIB9xhFg9IVG/giphy.gif" width="200"/>
</div>
