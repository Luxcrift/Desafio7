  GNU nano 6.2                                               nginx.sh *
#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx

sudo cd /etc/nginx/sites-available/
sudo truncate -s0 default
sudo nano default

server  {
        listen 80 default_server;
        listen [::]:80 default_server;

        server_name _;

        location / {
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $host;
                proxy_http_version 1.1;
                proxy_pass http://backend;
        }
}

upstream backend {
        server 127.0.0.1:3000;
        server 127.0.0.1:3001;
        server 127.0.0.1:3002;
        server 127.0.0.1:3003;
}

cd
sudo nginx -t

sudo systemctl restart nginx


sudo apt install certbot python3-certbot-nginx -y


sudo certbot --non-interactive --nginx -d 34.205.203.39.sslip.io -d www.34.205.203.39.sslip.io -m augusto.valls@gmail.com --a>

echo "finishhhhhh"

