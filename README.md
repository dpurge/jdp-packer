# jdp-packer

```sh
packer init ./src
packer fmt ./src
packer validate ./src
```

## Ubuntu 22.04

```sh
packer build ./src/jdp-wsl-ubuntu.pkr.hcl
```

### Graphical user interface

Comment out and add line in `/etc/xrdp/startwm.sh`:

```sh
# test -x /etc/X11/Xsession && exec /etc/X11/Xsession
# exec /bin/sh /etc/X11/Xsession

startxfce4
```

Start XRDP:

```sh
/etc/init.d/xrdp start
```

Connect in RDP to `localhost:3390`.
