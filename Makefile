start-deps:
	cd packages && docker-compose down && docker-compose up --build --force-recreate --no-deps

stop-deps:
	cd packages && docker-compose down