# Full Stack App: Next.js 14, Go, Postgres, Docker
YT:
https://www.youtube.com/watch?v=XDHDTGoZ_68&list=PLfJPWXrs22BnEQPKxcEr_7uCOV-9sOBQu&index=3

### Local
/Users/mpamdev03/projects/go/

### Github:
https://github.com/yuttana76/go-fullstack-app.git


### AWS 
ssh -i "go-api-key.pem" ec2-user@43.209.235.148
ssh -i "go-api-key.pem" ec2-user@ec2-43-209-235-116.ap-southeast-7.compute.amazonaws.com

## docker command
>docker compose build
>docker compose up -d
>docker compose down

 <!-- Docker remove <none> TAG images -->
>docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

## Make  command
>make <tag>
Eample>
>make up
>make up_build
>make down

## Frontend
http://127.0.0.1:3000/

## API
http://localhost:8000/api/go/users

## Postgrest command
>docker exec -it db psql -U postgres

 <!-- List of databases -->
>\l

 <!-- List of relations -->
>\dt

<!-- Exit cmd shell -->
>exit


##  RabbitMQ
http://localhost:15672/#/queues

https://www.rabbitmq.com/tutorials/tutorial-one-go

## Swagger
>swag init


### Amazon Linux 2023 Command
Follow 
https://www.youtube.com/watch?v=QzwAsLNIl10&t=6s

### Install go lang
>sudo dnf install golang -y

### Install git
>sudo dnf install git -y

### install docker


Update packages	
>sudo dnf update -y




Install Docker	
>sudo dnf install docker -y


```
sudo dnf remove -y docker docker-client docker-common
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo sed -i 's/$releasever/9/g' /etc/yum.repos.d/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
```


Start Docker service
>sudo systemctl start docker

Enable Docker on boot
>sudo systemctl enable docker

Add user to group
>sudo usermod -aG docker ec2-user

relogin terminal 
>docker ps

Install  docker compsse
>sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) -o /usr/libexec/docker/cli-plugins/docker-compose
>sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose


### AWS test 
>curl -v localhost:8080/api/v1/events
>ps aux | grep events-api
>kill <id>

### Cloudflare
>DNS>Records
Add record>Type=A ;Name=go-api;Content=<public ip>

### Check DNS
www.whatsmydns.net
search for =go-api.holidaystudio.club

### Git revert
revert code to previous
>git revert HEAD