dev:
	npx concurrently "make start-frontend" "make start-backend"

start-frontend:
	npx webpack --watch --progress

start-backend:
	npm start -- --watch --verbose-watch --ignore-watch='node_modules .git .sqlite'

ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app --build