setup:
	[ -f .env ] || cp .env.example .env
	docker compose run --rm app make setup

dev:
	docker compose up

dev-build:
	docker compose up --build

test:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from-app

ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app --build

down:
	docker compose down -v

clean:
	docker compose down -v
	docker system prune -f
	rm -rf app/node_modules

wait-for-db:
	@echo "Waiting for database to be ready..."
	@docker compose exec -T db pg_isready -U postgres -h localhost -p 5432