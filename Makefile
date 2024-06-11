#!make

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo build / install
	@echo start / stop / restart
	@echo workspace
	@echo logs
	@echo clean
	@echo ----------------------

_header:
	@echo -------
	@echo Hardhat
	@echo -------

_urls: _header
	${info }
	@echo -------------------------------
	@echo [Hardhat] http://localhost:8545
	@echo -------------------------------

build:
	@docker compose build --pull

install:
	@docker compose run --rm hardhat npm install

_start-command:
	@docker compose up -d

start: _start-command _urls

stop:
	@docker compose stop

restart: stop start

workspace:
	@docker compose run --rm hardhat /bin/bash

logs:
	@docker compose logs hardhat

clean:
	@docker compose down -v --remove-orphans
