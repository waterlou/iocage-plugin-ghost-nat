#!/bin/sh

GHOST_PATH=/usr/local/share/ghost
LOG_PATH=/var/log/ghost

# Install node packages
npm -g install ghost-cli

mkdir -p ${LOG_PATH}
chown www:www ${LOG_PATH}

mkdir -p ${GHOST_PATH}
cd ${GHOST_PATH}

# install and create config file
ghost install --db sqlite3 --no-prompt --no-stack --no-setup
ghost config --ip 0.0.0.0 --port 2368 --no-prompt --db sqlite3 --url http://localhost:2368
ghost config set process local
ghost config set logging.path /var/log/ghost/

# install sqlite3 manually
npm install sqlite3 --sqlite=/usr/local
find ./ ! -path "./versions/*" -type f -exec chmod 664 {} \;

# change owner
chown -R www:www ${GHOST_PATH}

# Configure
sysrc ghost_enable=yes
sysrc ghost_url=http://localhost:2368

# Start service
service ghost start

# Cleanup
npm cache clean --force
