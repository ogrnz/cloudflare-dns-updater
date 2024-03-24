# Cloudflare DNS updater

Simple CLI script to update Cloudflare DNS records.

## Usage

Copy and edit `.env.example`: `cp .env.example .env`.
- `CLOUDFLARE_API_TOKEN`: Create a token with the correct permissions on [Your dashboar](https://dash.cloudflare.com/profile/api-tokens)
- `ZONE_ID`: [Your dashboard](https://dash.cloudflare.com) > Your domain > "ZONE ID" under API section
- `DNS_RECORD_ID`: Edit the DNS record manually, then > [Your dashboard](https://dash.cloudflare.com) > Manage Account (left menu) > Audit Log > Find the update entry where you manually edited the record > "Resource ID" field
- `RECORD`: Your domain name

Make the script executable `chmod +x update_dns.sh`.

If you want, you can add it to your cron
```bash
crontab -e

# Add the following line
0 4 * * * /path/to/script/update_dns.sh
```
