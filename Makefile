.PHONY: all build clean down up restart sleep test_ci test retest

all: build restart sleep test

build down:
	docker compose $@

clean:
	docker image rm -f go-foobar:latest || true

up:
	docker compose up -d

restart: down up

sleep:
	sleep 1

test_ci: test

test:
	# use test .env
	cp .env.example .env
	$(MAKE) restart
	# See how small the go image is
	docker images | grep go-foobar
	# Check endpoint response
	curl -s localhost:7070 | grep foobar

retest: restart sleep test

