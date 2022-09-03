run:
	./sh/run.sh $(mix_env)
run.prod.docker:
	docker-compose up

debug:
	./sh/run.sh "$(mix_env)" "debug"

setup:
	./sh/setup.sh $(mix_env)

db.reset:
	./sh/db.reset.sh $(mix_env)

db.reset.ecto:
	./sh/db.reset.ecto.sh $(mix_env)

tests:
	./sh/test.sh
	
tests.watch:
	./sh/tests.watch.sh

release:
	./sh/release.sh $(mix_env)

build.docker:
	docker build -t yweri.azurecr.io/core-service .
	
build.docker.push:
	docker push yweri.azurecr.io/core-service
