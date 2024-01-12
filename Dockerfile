FROM node:latest as builder

RUN mkdir /app
WORKDIR  /app

COPY . .
 RUN npm install
 RUN npm run build






FROM ngnix :latest


COPY  /app/dist/jenkins /usr/share/nginx/html/
EXPOSE 80