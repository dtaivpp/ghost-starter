# Ghost Starter

This project contains the code I use to deploy my website using [Ghost](https://ghost.org/) and [Cloudflared](https://github.com/cloudflare/cloudflared). This can serve as a foundation for you to deploy your very own site! Ghost is a content management system (CMS) for hosting dynamic websites. It uses a Javascript templating library along with MySQL on the backend to serve content. We'll only be covering deploying here but there will be a companion blog that covers in more detail. 

To run a site on your own you can fork this repo and deploy it using the instructions below. 

## Pre-requisites
First and foremost I would strongly recommend using a hosting provider such as AWS or Digital Ocean. Hosting this within your home is possible but it does open your home network up to potential hackers. 

- [Docker Engine](https://docs.docker.com/engine/install/ubuntu/) is what we will be using to deploy our containers. 
- [Cloudflare Tunnels](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/) are how our containers will be exposed to the internet. You will need a domain name and access to Cloudflare Zero Trust dashbaord. 
- [Mailgun](https://www.mailgun.com/) is what we will use to do signups and send newsletters.


## Configuring

After forking and cloning the repo you will need to run the below script. This will create the files needed to hold our passwords and secrets.

```bash
sudo chmod +x bootstrap.sh
./bootstrap.sh
```

You will find a few files were created in the `/secrets/` directory. In these files we will need to first open the `CLOUDFLARE_TOKEN.txt` file and put the token that you've generated from the cloudflare zero trust dashboard. Next you will need to open the `SMTP_PASS.txt` file and put in the password you recieved from the SMTP provider. Finally, we will need to fill out the `.env` file. This will look different depending on whether you are doing development or produciton. Below is a sample for each.

### Local development .env
```
# Change the domain to your website or localhost if testing.
URL=http://localhost:2368

# Could be any user youd like
MYSQL_USER=testdb

# SMTP - Mail from is an address you have permissions to mail from. Below is just a demo. 
# SMTP User - Username provided by your SMTP service
MAIL_FROM=noreply@mail.yourdomain.com
SMTP_USER=testuser

# Set between production and development
DEPLOYMENT=development
```

### Production .env
```
# Change the domain to your website or localhost if testing.
URL=https://yourdomain.com

# Could be any user youd like
MYSQL_USER=ghostdb

# SMTP - Mail from is an address you have permissions to mail from. Below is just a demo. 
# SMTP User - Username provided by your SMTP service
MAIL_FROM=noreply@mail.yourdomain.com
SMTP_USER=smtpuser

# Set between production and development
DEPLOYMENT=production
```


## Deploying

To deploy the site you can do `docker compose up -d`. This will pull the containers down and run them locally with the environment variables in the .env file. The .env file will automatically be pulled in and utilized. Then you will need go into cloudflare to configure your tunnel. 

From the Cloudflare dashboard you will need to go to Zero Trust -> Networks -> Tunnels to configure the tunnel. From there you will need to set the domain name to the same one from your config file above. In the `service` field you will need to set it to `http://ghost:2368`. This is because the cloudflared container is in the docker compose environment and will be accessing the ghost container by it's hostname. 

Finally, once your cluster is live you will want to go to the admin page and claim your page. This is to make a user account for your cluster that will allow you to view the admin dashboard. The admin page is at `https://<yoursite.com>/ghost`

With that enjoy your website and stick around for more content! 