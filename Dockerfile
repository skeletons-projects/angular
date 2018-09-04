
FROM node:10 as node
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY ./ /app/
RUN npm run build -- --prod

FROM nginx:1.13
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY --from=node /app/dist/Application /usr/share/nginx/html
