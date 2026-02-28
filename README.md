# MTG Proxy — Home Assistant Add-on

MTProto proxy for Telegram based on [9seconds/mtg](https://github.com/9seconds/mtg).

## Installation

1. Go to **Settings → Add-ons → Add-on Store**
2. Click the 3-dot menu (top right) → **Repositories**
3. Add: `https://github.com/YOUR_USERNAME/ha-mtg-addon`
4. Find **MTG Proxy** in the store and install it

## Configuration

Before starting, you need to generate a secret. In the HA terminal run:

```bash
docker run --rm nineseconds/mtg:2 generate-secret bing.com
```

Then open the addon configuration and set:

```yaml
secret: "YOUR_GENERATED_SECRET"
bind_port: 3128
dns: "8.8.8.8"
```

## Connecting Telegram

After starting the addon, use this link to connect:

```
tg://proxy?server=YOUR_EXTERNAL_IP&port=3128&secret=YOUR_SECRET
```

Or open in browser:
```
https://t.me/proxy?server=YOUR_EXTERNAL_IP&port=3128&secret=YOUR_SECRET
```

> Don't forget to forward port 3128 on your router to your Home Assistant IP.

## Notes

- Choose a domain for the secret that isn't blocked in your region
- Share the proxy link only with trusted people
- The proxy is lightweight (~3.5MB image, minimal CPU/RAM usage)
