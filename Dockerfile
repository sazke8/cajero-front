# base image
FROM node:latest as node

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY . .
RUN npm install
RUN npm run build --prod
EXPOSE 4200

FROM nginx:alpine
COPY --from=node /app/dist/cajero-front /usr/share/ngnix/html
