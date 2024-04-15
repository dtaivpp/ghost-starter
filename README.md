# Ghost Starter

This project contains the code I use to deploy my website using [Ghost](https://ghost.org/) and [Cloudflared](https://github.com/cloudflare/cloudflared). This can serve as a foundation for you to deploy your very own site! Ghost is a content management system (CMS) for hosting dynamic websites. It uses a Javascript templating library along with MySQL on the backend to serve content. We'll only be covering deploying here but there will be a companion blog that covers in more detail. 

To run a site on your own you can fork this repo and deploy it using the instructions below. 

## Pre-requisites
First and foremost I would strongly recommend using a hosting provider such as AWS or Digital Ocean. Hosting this within your home is possible but it does open your home network up to potential hackers. 

- [Docker Engine](https://docs.docker.com/engine/install/ubuntu/) is what we will be using to deploy our containers. 
- [Cloudflare Tunnels](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/) are how our containers will be exposed to the internet. You will need a domain name and access to Cloudflare Zero Trust dashbaord. 
- [Mailgun](https://www.mailgun.com/) is what we will use to do signups and send newsletters.


## Configuring

After forking and cloning the repo you will need to create a .env file at the root of the repo with the following variables. The first section is needed to deploy the Ghost site. The Cloudflare section helps us expose the site to the web. Finally, the SMTP section is needed to allow users to sign up and login. Any SMPT provider can be used here but for the sake of this repo we are using Mailgun. 

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

## Deploying

To deploy the site you can do `docker compose up -d`. This will pull the containers down and run them locally with the environment variables in the .env file. The .env file will automatically be pulled in and utilized. Then you will need go into cloudflare to configure your tunnel. 

From the Cloudflare dashboard you will need to go to Zero Trust -> Networks -> Tunnels to configure the tunnel. From there you will need to set the domain name to the same one from your config file above. In the `service` field you will need to set it to `http://ghost:2368`. This is because the cloudflared container is in the docker compose environment and will be accessing the ghost container by it's hostname. 

Finally, once your cluster is live you will want to go to the admin page and claim your page. This is to make a user account for your cluster that will allow you to view the admin dashboard. The admin page is at `https://<yoursite.com>/ghost`

With that enjoy your website and stick around for more content! 