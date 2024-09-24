# Specify Base Image
FROM docker.io/node:18-alpine

# Work Directory
WORKDIR /usr/app

#Copy the package
COPY package.json ./

# Install the required tools
RUN npm install

#COPY the files in to the container
COPY ./ ./


# Startup Command
CMD ["npm", "start"]