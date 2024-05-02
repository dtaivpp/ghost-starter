#! /bin/bash -
if [[ ! -e ./secrets/MYSQL_ROOT_PASSWORD.txt ]]; then
    mkdir -p secrets
    openssl rand -base64 20 >> ./secrets/MYSQL_ROOT_PASSWORD.txt
fi

if [[ ! -e ./secrets/MYSQL_PASSWORD.txt ]]; then
    openssl rand -base64 20 >> ./secrets/MYSQL_PASSWORD.txt
fi

if [[ ! -e ./secrets/CLOUDFLARE_TOKEN.txt ]]; then
    touch ./secrets/CLOUDFLARE_TOKEN.txt
fi

if [[ ! -e ./secrets/SMTP_PASS.txt ]]; then
    touch ./secrets/SMTP_PASS.txt
fi

if [[ ! -e .env ]]; then
  echo """
# Change the domain to your website or localhost if testing.
URL=<https://yourdomain.com>

# Could be any user youd like
MYSQL_USER=ghostdb
  
# If using cloudflare for access
CLOUDFLARE_TOKEN=

# SMTP - Mail from is an address you have permissions to mail from. Below is just a demo. 
# SMTP User - Username provided by your SMTP service
MAIL_FROM=noreply@<mail.yourdomain.com>
SMTP_USER=
  """ >> .env
fi