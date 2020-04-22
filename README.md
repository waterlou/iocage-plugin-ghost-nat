# Third Party Plugin to install Ghost CMS on FreeNAS easily.

- No Nginx
- Use sqlite3 database
- NAT settings so will be same IP address as FreeNAS Server
- on port 2368 by default, you can change it in NAT forwards

# Installation

On FreeNAS root shell:

    curl -o /tmp/ghost-nat.json https://raw.githubusercontent.com/waterlou/iocage-plugin-ghost-nat/master/ghost-nat.json
    iocage fetch -P /tmp/ghost-nat.json

# Post Installation

By default, the plugin use localhost as the default URL, that will break most links in Ghost.  You should set the url to the FreeNAS.  e.g. http://freenas.local:2368 or http://192.168.1.11:2368

To change this setting, run the following in the jail shell:

    cd /usr/local/share/ghost
    ghost stop
    ghost config --ip 0.0.0.0 --port 2368 --no-prompt --db sqlite3 --url http://freenas.local:2368
    ghost start

TODO:

    Instruction to mount content path

# Settings

Ghost is stored in:

    /usr/local/share/ghost

Content is stored in:

    /usr/local/share/ghost/content

that you can mount to external storage.

# References

<https://linoxide.com/linux-how-to/install-ghost-nginx-freebsd-10-2/>  
<https://www.ixsystems.com/documentation/freenas/11.3-U2/plugins.html#create-a-plugin>
