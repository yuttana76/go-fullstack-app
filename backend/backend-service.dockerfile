
FROM alpine:latest

RUN mkdir /app

COPY ./build_app/backendApp /app

CMD [ "/app/backendApp" ]