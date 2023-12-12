# Use a specific Node.js version as a base image
FROM node:18.13 as builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application code
COPY . .

# Build the application
RUN npm run build

# Use a smaller nginx image for the final image
FROM nginx:alpine

# Copy the built artifacts from the builder stage to the nginx directory
COPY --from=builder /app/dist/jenkins /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80
