#!/bin/sh

GHOST_PATH=/usr/local/share/ghost

# Install node packages
npm -g install ghost-cli

# Use ghost cli to install source
lsmkdir -p ${GHOST_PATH}
cd ${GHOST_PATH}

# create config file
ghost install --db sqlite3 --no-prompt --no-stack --no-setup
ghost config --ip 0.0.0.0 --port 2368 --no-prompt --db sqlite3 --url http://localhost:2368

# install sqlite3 manually
npm install sqlite3 --sqlite=/usr/local
find ./ ! -path "./versions/*" -type f -exec chmod 664 {} \;

# Configure
sysrc ghost_enable=yes

# Start service
service ghost start

# Cleanup
npm cache clean --force
