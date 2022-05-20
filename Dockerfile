FROM node:16.13.0
MAINTAINER Code-Challenge-Developer
WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build
RUN npm install -g http-server
EXPOSE 8080
CMD [ "http-server", "dist" ]