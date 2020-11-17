FROM node:8.4.0 AS builder

# on package l'application
WORKDIR /app
COPY . ./

RUN npm install
RUN npm run build

FROM franckcussac/rust-webserver:static

# port à exposer pour accéder à l'application
EXPOSE 80

# on récupère le résultat de notre conteneur de build
COPY --from=builder /app/dist/ /public/
