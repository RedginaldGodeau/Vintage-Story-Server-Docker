![Banner](./docs/banner.png)

# Vintage Story Server Docker

A Docker Compose setup to easily host a Vintage Story server.

## Requirements

- Docker
- Docker Compose
- Make
- Linux server
- Port 42420 open on firewall

### Firewall Configuration

Open port 42420 to allow connections to the server:

**With firewalld:**
```bash
firewall-cmd --permanent --zone=public --add-port=42420/tcp
firewall-cmd --reload
```

**With iptables:**
```bash
iptables -A INPUT -p tcp -m tcp --dport 42420 -j ACCEPT
```

**With ufw:**
```bash
sudo ufw allow 42420/tcp
```

## Installation

1. Clone this repository
2. Install Vintage Story server files:
   ```bash
   ./install-vintage.sh [version]
   ```
   Replace `[version]` with the desired Vintage Story version.

## Usage

### Available Commands

- **Start the server:**
  ```bash
  make start
  ```

- **Restart the server:**
  ```bash
  make restart
  ```

- **Stop the server:**
  ```bash
  make stop
  ```

- **Access server console:**
  ```bash
  make console
  ```

- **Clean server data:**
  ```bash
  make clean-data
  ```

## Configuration

### server-data Directory

The `server-data` directory contains all server configurations and data:
- Server configurations
- Maps/Worlds
- Save data

### Server Configuration

All server configurations are located in the `server-data/serverconfig.json` file.

Edit this file to customize:
- Game parameters
- Server rules
- Network options
- And much more

## Project Structure

```
.
├── docker-compose.yml
├── Makefile
├── install-vintage.sh
├── server-data/
│   ├── serverconfig.json
│   └── ... (other configuration and data files)
└── README.md
```

## Support

For any questions or issues, consult the official Vintage Story documentation or create an issue in this repository.

## Useful Link

[Vintage Story Server on linux](https://wiki.vintagestory.at/Guide:Dedicated_Server#Dedicated_server_on_Linux)

[List of commands](https://wiki.vintagestory.at/List_of_server_commands)

## Important Notes

- Make sure port 42420 is properly opened and accessible
- Regularly backup the `server-data` directory
- Check version compatibility before updating