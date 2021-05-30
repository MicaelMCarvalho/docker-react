#Builder
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#/app/build  all the stuff we need

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

#To run docker run -p 8080:80 id (80 is the default por to nginx)