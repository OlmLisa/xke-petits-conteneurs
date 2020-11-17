FROM nginx:1.17.5-alpine

EXPOSE 80t à exposer pour accéder à l'application
???

# on installe les outils nécessaire à la construction et à l'exécution
RUN apk add nodejs npm

# on se place dans un dossier de travail et on y copie tout le code de l'application
WORKDIR /app
COPY . ./

# On construit l'application et on la déplace dans le bon dossier pour nginx
RUN npm install
RUN npm run build
RUN cp -r dist/* /usr/share/nginx/html
