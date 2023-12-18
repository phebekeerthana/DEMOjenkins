FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

RUN npm update -g npm

# Install app dependencies
RUN npm install

# Copy the application code
COPY . .
RUN ls -al
# Build the Angular app
RUN npm run build -- --configuration=production

# Expose the port the app runs on
EXPOSE 80

# Command to run the application
CMD ["npm", "start"]