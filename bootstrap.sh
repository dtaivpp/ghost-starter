#! /bin/bash -

# Check if root mysql password file exists and if not create and fill it.
if [[ ! -e ./secrets/MYSQL_ROOT_PASSWORD.txt ]]; then
    mkdir -p secrets
    openssl rand -base64 20 >> ./secrets/MYSQL_ROOT_PASSWORD.txt
fi

# Check if user mysql password file exists and if not create and fill it.
if [[ ! -e ./secrets/MYSQL_PASSWORD.txt ]]; then
    openssl rand -base64 20 >> ./secrets/MYSQL_PASSWORD.txt
fi

# Create empty files for Cloudflare and SMTP password. To be filled in by the user 
touch ./secrets/CLOUDFLARE_TOKEN.txt
touch ./secrets/SMTP_PASS.txt


# Create a .env file with all the necessary parameters
if [[ ! -e .env ]]; then
  echo """
# Change the domain to your website or localhost if testing.
URL=<https://yourdomain.com>

# Could be any user youd like
MYSQL_USER=ghostdb

# SMTP - Mail from is an address you have permissions to mail from. Below is just a demo. 
# SMTP User - Username provided by your SMTP service
MAIL_FROM=noreply@<mail.yourdomain.com>
SMTP_USER=

# Set between production and development
DEPLOYMENT=development
  """ >> .env
fi