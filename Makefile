up:
	docker compose up -d

down:
	docker compose down

watch:
	docker compose up --watch

logs-api:
	docker container logs -f home-asset-manager-api

logs-db:
	docker container logs -f home-asset-manager-db

psql:
	docker container exec -it home-asset-manager-db psql -U ${POSTGRES_USER}