# TippyBits.com

This project contains the code I use to deploy the TippyBits.com Ghost site. 

To run a site on your own you can fork this repo and deploy it yourself. You will need to create a .env file at the root of the repo with the following variables. 

```
# in .env file at root directory
URL=https://yourdomain.com:2368
MYSQL_ROOT_PASSWORD=
MYSQL_USER=
MYSQL_PASSWORD=
CLOUDFLARE_TOKEN=
```

After deploying you will need to go into your Cloudflare Dashbaord and configure your domain. 