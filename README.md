# Third Party Plugin to install Ghost CMS on FreeNAS easily.

- No Nginx
- Use sqlite3 database
- NAT settings so will be same IP address as FreeNAS Server
- on port 2368 by default, you can change it in NAT forwards

# Installation

On FreeNAS shell:

    curl -o /tmp/ghost-nat.json https://raw.githubusercontent.com/waterlou/iocage-plugin-ghost-nat/master/ghost-nat.json
    sudo iocage fetch -P /tmp/ghost-nat.json

# Settings

Ghost is stored in:

    /usr/local/share/ghost

Content is stored in:

    /usr/local/share/ghost/content

that you can mount to external storage.

# References

<https://linoxide.com/linux-how-to/install-ghost-nginx-freebsd-10-2/>  
<https://www.ixsystems.com/documentation/freenas/11.3-U2/plugins.html#create-a-plugin>
