FROM node:20.12.2

WORKDIR /app

RUN apt-get update && apt-get install -y make netcat-openbsd

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 8080

ENV NODE_ENV=production

CMD ["npm", "start"]