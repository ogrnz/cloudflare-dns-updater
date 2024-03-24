#!/bin/bash

# *Absolute* path to .env file (for cron)
ENV_PATH=".env"

# Export vars
export $(grep -v '^#' $ENV_PATH | xargs)

IP=$(curl -s ifconfig.me)
curl -sS --request PUT \
  --url "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID" \
  --header "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{
  \"type\": \"A\",
  \"name\":\"$RECORD\",
  \"content\":\"$IP\",
  \"ttl\": 60,
  \"proxied\": false
}"

# Unset vars
unset $(grep -v '^#' $ENV_PATH | sed -E 's/(.*)=.*/\1/' | xargs)

