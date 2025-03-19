# Use Node.js Alpine base image
FROM node:alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker caching
COPY package.json package-lock.json ./

# Clear npm cache (optional but useful)
RUN npm cache clean --force

# Install dependencies
RUN npm install --production

# Copy the entire codebase to the working directory
COPY . .

# Expose the port your app runs on (typically 3000 for React or Express)
EXPOSE 3000

# Define the command to start your application
CMD ["npm", "start"]
