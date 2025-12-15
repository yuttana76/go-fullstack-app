# Full Stack App: Next.js 14, Go, Postgres, Docker
YT:
https://www.youtube.com/watch?v=XDHDTGoZ_68&list=PLfJPWXrs22BnEQPKxcEr_7uCOV-9sOBQu&index=3

github:
https://github.com/FrancescoXX/go-fullstack-app/tree/main

## docker command
>docker compose build
>docker compose up -d
>docker compose down

## Docker remove <none> TAG images
>docker rmi $(docker images --filter "dangling=true" -q --no-trunc)


## API
http://localhost:8000/api/go/users

## Postgrest command
>docker exec -it db psql -U postgres

### List of databases
>\l

### List of relations
>\dt

>exit

## Make   file
>make <tag>
Eample>
>make up
>make up_build
>make down

##  RabbitMQ
http://localhost:15672/#/queues

https://www.rabbitmq.com/tutorials/tutorial-one-go