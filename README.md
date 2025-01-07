# IIS Website Setup

This script provides an interactive way to configure and deploy a website to IIS.

## Features

- Interactive menu for configuration
- Configurable settings via config.ini
- Port auto-detection
- SSL support
- HTTP compression
- Proper permissions setup
- Website removal option

## Usage

1. Right-click `setup-iis.bat` and select "Run as administrator"
2. Use the menu to configure your settings:
   - [1-6] Change individual settings
   - [S] Save settings to config.ini
   - [I] Install website
   - [R] Remove website
   - [X] Exit

## Configuration Options

- Site Name: Name of the IIS website
- Port Range: Range of ports to check for availability
- App Pool: Name of the application pool
- SSL: Enable/disable HTTPS
- Compression: Enable/disable HTTP compression
- Default Document: Default page to serve

## Requirements

- Windows with IIS installed
- Administrator privileges
- Node.js and npm installed
