#!/usr/bin/env bash
set -euo pipefail

ENV_FILE=".env"

# Only create .env if it doesn't already exist
if [[ -e "$ENV_FILE" ]]; then
  echo "✅ $ENV_FILE already exists. No new environment file created."
  echo
  echo "Next steps (if not already done):"
  echo "  - Open $ENV_FILE and verify/update:"
  echo "      - URL"
  echo "      - CLOUDFLARE_TOKEN"
  echo "      - SMTP_USER / SMTP_PASS / MAIL_FROM"
  exit 0
fi

# Generate MySQL passwords
MYSQL_ROOT_PASSWORD="$(openssl rand -base64 20)"
MYSQL_PASSWORD="$(openssl rand -base64 20)"

cat > "$ENV_FILE" <<EOF
# ===========================
# General
# ===========================
# Change this to your website domain or localhost if testing.
URL=https://yourdomain.com

# ===========================
# MySQL Configuration
# ===========================
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
# Could be any user you'd like.
MYSQL_USER=ghostdb
MYSQL_PASSWORD=${MYSQL_PASSWORD}

# ===========================
# Cloudflare
# ===========================
# Replace this with your real API token from the Cloudflare dashboard.
CLOUDFLARE_TOKEN=CHANGE_ME_CLOUDFLARE_API_TOKEN

# ===========================
# SMTP / Email
# ===========================
# MAIL_FROM should be an address you have permission to send from.
MAIL_FROM=noreply@mail.yourdomain.com
# SMTP_USER - Username provided by your SMTP service.
SMTP_USER=CHANGE_ME_SMTP_USERNAME
# SMTP_PASS - Password/API key provided by your SMTP service.
SMTP_PASS=CHANGE_ME_SMTP_PASSWORD

# ===========================
# Deployment
# ===========================
# Set between "production" and "development".
DEPLOYMENT=development
EOF

echo "✅ Created $ENV_FILE with:"
echo "  - Generated MYSQL_ROOT_PASSWORD"
echo "  - Generated MYSQL_PASSWORD"
echo "  - Placeholder values for:"
echo "      - URL"
echo "      - CLOUDFLARE_TOKEN"
echo "      - MAIL_FROM / SMTP_USER / SMTP_PASS"
echo
echo "Next steps:"
echo "  1. Open $ENV_FILE in your editor."
echo "  2. Set URL to your actual domain (or localhost for testing)."
echo "  3. Set CLOUDFLARE_TOKEN to your real Cloudflare API token."
echo "  4. Set MAIL_FROM, SMTP_USER, and SMTP_PASS to valid SMTP credentials."
