# Use Node.js 14 as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /bezkoder-app

# Copy package.json and package-lock.json (if exists) for better caching of dependencies
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Expose the port that the app will run on
EXPOSE 5000 

# Start the Node.js application
CMD ["npm", "start"]
