# Use the node:10-alpine image as a base to
# create a directory for the app and its node_modules with node as its owner
# install all packages in package.json
# expose port 8080 and run the app
# the docker lecture will help you complete this file 
# there should be a total of 9-12 lines


# this is the base image for our container
FROM node:10-alpine

# create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

# set the working directory to /home/node/app
WORKDIR /home/node/app

# copy package.json and package-lock.json to /home/node/app
COPY package*.json ./

# change the user to node so that we don't run as root (security)
USER node

# install all packages in package.json
RUN npm install

# Informs Docker that the container listens on port 8080 at runtime.
EXPOSE 8080

# copy the rest of the files to /home/node/app
COPY --chown=node:node . .

# run the app
CMD node app.js