FROM node:8.4.0-wheezy AS builder

# on package l'application
WORKDIR /app
COPY . ./

RUN npm install
RUN npm run build

FROM nginx:1.17.5-alpine

# port à exposer pour accéder à l'application
EXPOSE 80

# on récupère le résultat de notre conteneur de build
COPY --from=builder /app/dist/ /usr/share/nginx/html
