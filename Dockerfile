FROM node:latest as builder

RUN mkdir /app
WORKDIR  /app

COPY . .
 RUN npm install
 RUN npm run build






FROM nginx:latest

COPY --from=builder /app/dist/jenkins /usr/share/nginx/html
EXPOSE 80