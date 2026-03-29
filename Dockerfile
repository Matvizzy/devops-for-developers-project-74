FROM node:20.12.2

WORKDIR /app

# Кэш зависимостей
COPY app/package.json package.json
COPY app/package-lock.json package-lock.json

RUN npm ci

# Код
COPY app/. .

# Установка утилиты ожидания БД
RUN apt-get update && apt-get install -y netcat-openbsd

EXPOSE 8080

ENV NODE_ENV=production

RUN make build

CMD ["make", "start"]