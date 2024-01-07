# Node management scripts

This repo keeps track of basic scripts and tools that should be installed as a part of a 
golden image or other default install.

## Tools

TailScale: install-tailscale.sh

expects either a .env file:

```
TAILSCALE_TOKEN=xxxxxxxxxxxxxxxxx
```

or you can pass the token from the command line.

Log in to tailscale as an admin:

[TailScale.com](https://login.tailscale.com/)

Generate an Authentication Key:

[Tailscale->Settings->PersonalKeys](https://login.tailscale.com/admin/settings/keys)
