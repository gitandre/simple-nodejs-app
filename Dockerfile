# Getting the base image for this simple node application
FROM artifacts.bcp.absa.co.za/bison-cloud/node:12-alpine
# Adding maintainer info. This is optional
MAINTAINER Dewan Ahmed (dewan.ishtiaque@hotmail.com)

# Create app directory and use it as working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Getting the package manager
RUN npm config set proxy http://teraco-jhb.intra.absaafrica:8080
RUN npm config set https-proxy http://teraco-jhb.intra.absaafrica:8080
RUN npm install

# Bundle app source
COPY . /usr/src/app

# Telling docker which file to use to start this application
CMD ["node", "index.js"]

# Opening up this port on the running container
EXPOSE 3000
