BANKEND_BINARY=backendApp
LISTENER_BINARY=listenerApp

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker compose up -d
	@echo "Docker images started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker compose down
	@echo "Done!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_backend build_listener
	@echo "Stopping docker images (if running...)"
	docker compose down

	@echo "Building (when required) and starting docker images..."
	docker compose up --build -d
	@echo "Docker images built and started!"

## build_listener: builds the listener binary as a linux executable
build_backend:
	@echo "Building backend binary..."
	cd ./backend && env GOOS=linux CGO_ENABLED=0 go build -o ./build_app/${BANKEND_BINARY} .
	@echo "backend Done!"

## build_listener: builds the listener binary as a linux executable
build_listener:
	@echo "Building listener binary..."
	cd ./listener-service && env GOOS=linux CGO_ENABLED=0 go build -o ./build_app/${LISTENER_BINARY} .
	@echo "listener Done!"
