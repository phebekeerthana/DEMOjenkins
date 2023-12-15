# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the application code
COPY . .

# Build the Angular app
RUN ng build --prod

# Expose the port the app runs on
EXPOSE 80

# Command to run the application
CMD ["npm", "start"]
