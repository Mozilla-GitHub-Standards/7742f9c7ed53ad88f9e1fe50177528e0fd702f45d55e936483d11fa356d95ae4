.PHONY: build shell up tests flake8 ci

help:
	@echo "Welcome to taar_api\n"
	@echo "The list of commands for local development:\n"
	@echo "  build          Builds the docker images for the docker-compose setup"
	@echo "  shell          Opens a Bash shell"
	@echo "  up         	Runs the whole stack, served under http://localhost:8000/"
	@echo "  tests      	Run pytest tests using tox"
	@echo "  flake8     	Run flake8 using tox"
	@echo "  ci         	Run tests and flake8"
	@echo "  freeze     	Update the python dependencies in requirements.txt"

build:
	docker-compose build

shell:
	docker-compose run --publish=8000:8000 web bash 

up:
	docker-compose up

tests:
	docker-compose run web tox -etests

flake8:
	docker-compose run web tox -eflake8

ci:
	docker-compose run web tox

# Updating pip hashes is awful
freeze:
	bin/hashfreeze
