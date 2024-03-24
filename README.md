# Cloudflare DNS updater

Simple CLI script to update Cloudflare DNS records.

## Usage

Copy and edit `.env.example`: `cp .env.example .env`.
- `CLOUDFLARE_API_TOKEN`: Create a token with the correct permissions on [https://dash.cloudflare.com/profile/api-tokens](Your dashboard)
- `ZONE_ID`: [https://dash.cloudflare.com/profile/api-tokens] > Your domain > "ZONE ID" under API section
- `DNS_RECORD_ID`: Edit the DNS record manually, then > [https://dash.cloudflare.com/profile/api-tokens](Your dashboard) > Manage Account (left menu) > Audit Log > Find the update entry where you manually edited the record > "Resource ID" field
- `RECORD`: Your domain name