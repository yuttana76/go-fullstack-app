To implement SSL with Certbot for a Dockerized Go and NGINX setup, the most efficient method in 2025 is using the HTTP-01 challenge with shared Docker volumes. This allows NGINX to serve the challenge file while Certbot handles the certificate generation. 
1. Update NGINX Configuration
Update your nginx.conf to include a location block for the Certbot challenge and placeholders for SSL certificates.
nginx
server {
    listen 80;
    server_name yourdomain.com;

    # Certbot challenge location
    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    # Redirect all HTTP traffic to HTTPS
    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    listen 443 ssl;
    server_name yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com;

    location / {
        proxy_pass http://go-app:8080;
        proxy_set_header Host $host;
    }
}


2. Update Docker Compose
Add a Certbot service and shared volumes to your docker-compose.yml so both containers can access the certificates and challenge files. 
yaml
services:
  nginx-proxy:
    image: nginx:latest
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/conf.d/default.conf:ro
      - ./certbot/conf:/etc/letsencrypt:ro
      - ./certbot/www:/var/www/certbot:ro
    ports:
      - "80:80"
      - "443:443"

  certbot:
    image: certbot/certbot:latest
    volumes:
      - ./certbot/conf:/etc/letsencrypt
      - ./certbot/www:/var/www/certbot


3. Generate the SSL Certificate
Because NGINX will fail to start if the certificate files do not yet exist, follow these steps: 
Comment out the listen 443 block in your nginx.conf temporarily.
Start NGINX: Run docker-compose up -d nginx-proxy.
Run Certbot: Execute the following command to request your certificate:

3.1
```
docker-compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d go-api.holidaystudio.club
```
3.2
Remove --dry-run once the test passes to get the actual certificate.
```
docker-compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ -d go-api.holidaystudio.club
```

4. Restore NGINX: Un-comment the listen 443 block and run docker-compose restart nginx-proxy

### Automate Renewal
Certificates from Let's Encrypt expire every 90 days. In 2025, you can automate this by adding a command to your Certbot service in docker-compose.yml to check for renewals every 12 hours: 
yaml
```
certbot:
  # ... other config ...
  entrypoint: "/bin/sh -c 'trap exit TERM; while :; do certbot renew; sleep 12h & wait $${!}; done;'"
```

This tutorial demonstrates how to properly configure volumes and run the Certbot container to secure your NGINX reverse proxy:

https://www.google.com/search?q=how+docker+golang+nginx&rlz=1C5CHFA_enTH1095TH1097&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBCjE4MDMzajBqMTWoAgiwAgE&sourceid=chrome&ie=UTF-8&udm=50&fbs=AIIjpHxU7SXXniUZfeShr2fp4giZud1z6kQpMfoEdCJxnpm_3WBcADgXS0kQ7L92bqYkFCGs4piG0mmPDgZFV1TtUMvZh4b_hOslSO4BbJRk_Rm0e5nkOROTp-nvSsweko3de43Gtt9CMs-9V6V0HY2HqWJFL4M3riFJwQCIBJZhDDvRayRgIHpe0v0RNBYuUU0rLZxxt_NZubttBh4Qq-6PkMs5vG7_FA&ved=2ahUKEwj4pvTpnNiRAxXsXmwGHU83OaUQ0NsOegQIAxAB&aep=10&ntc=1&mtid=selMacqqBbGnseMP7Ybu6AM&mstk=AUtExfDu1zkkfCKw61xLg2bfxTSSWQs-lEUMcoWxHj2ONKW3iwodTgL-IUfkA87fYLSQnznhlff-AsjtO0Tb81XqRrGR1IZkD3KR8-bjhni6GAQXBaZyHzQBb7u0xBdEHtnbKVr5OdtUbboXgEjms8F777VkSRW4DuTcjyRmq0i4ilUrrCZP7Mj7CuwUh9x66DA2X6noGzt-ggnsxVB2Cm-5UduDXyoEY9eYntG6TmNaF4cJU2vHO65ZowzVFRmn_TrsNeATFlyIK4IAddY-PeqBwqAmbKa-lig1He0rXMJhXbXKXjmPxnIwpNt4ja8KM2kc4yhbSsAW3MuurQ&csuir=1#fpstate=ive&vld=cid:bc287a82,vid:J9jKKeV1XVE,st:0