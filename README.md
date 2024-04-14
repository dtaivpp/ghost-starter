# TippyBits.com

This project contains the code I use to deploy the TippyBits.com Ghost site. 

To run a site on your own you can fork this repo and deploy it yourself. You will need to create a .env file at the root of the repo with the following variables. The first section is the only one required to host a site however the other sections are there if you'd like to have users sign up. 

```
# In .env file at root directory
URL=https://yourdomain.com
MYSQL_ROOT_PASSWORD=
MYSQL_USER=
MYSQL_PASSWORD=

# If using cloudflare for access
CLOUDFLARE_TOKEN=

# SMTP
MAIL_FROM=
SMTP_USER=
SMTP_PASS=
```

After deploying you will need to go into your Cloudflare Dashbaord and configure your domain. For the public hostname you will need to set it to where you want your blog to be accessible. This is likely `https://blog.yoursite.com` or `https://yoursite.com`. Once you've set that you will set the service URL to `http://ghost:2368`. This is the address of the docker container that the cloudflard worker will access the site at. 