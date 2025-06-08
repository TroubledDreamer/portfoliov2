FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /app

COPY frontend/package*.json ./

RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY frontend/. ./

# build app for production with minification
RUN npm run build

EXPOSE 5172
CMD [ "http-server", "dist" ]