# Full Stack App: Next.js 14, Go, Postgres, Docker
YT:
https://www.youtube.com/watch?v=XDHDTGoZ_68&list=PLfJPWXrs22BnEQPKxcEr_7uCOV-9sOBQu&index=3

### Local
/Users/mpamdev03/projects/go/

### Github:
https://github.com/yuttana76/go-fullstack-app.git


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

### AWS 
>ssh -i "go-api-key.pem" ec2-user@43.209.178.219

### Install git
>sudo dnf install git -y