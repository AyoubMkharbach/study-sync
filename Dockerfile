# we'll use 16
FROM node:16
# where our app will be located in the image
RUN mkdir -p /app
WORKDIR /app
# move all source code
COPY . .
RUN npm install
CMD [ "npm", "start" ]
EXPOSE 8080