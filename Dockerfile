FROM node:20

WORKDIR /app

RUN apt-get update && apt-get install -y make netcat-openbsd

COPY app/package.json package.json
COPY app/package-lock.json package-lock.json

RUN npm ci

COPY app/. .

RUN npm run build

RUN npm ci --omit=dev

EXPOSE 8080

ENV NODE_ENV=production

CMD ["npm", "start"]