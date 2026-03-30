FROM node:20.12.2

WORKDIR /app

# Копируем только файлы зависимостей
COPY app/package.json app/package-lock.json ./

# Устанавливаем их
RUN npm install