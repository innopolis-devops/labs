FROM node:16.16-alpine as builder

# Prepare a directory and enter it
RUN mkdir -p /app/node_modules && chown -R node:node /app
WORKDIR /app

# Copy package.json and package-lock.json
COPY --chown=node:node ./package*.json ./

# Build as a non-root user
USER node

# Install dependencies
RUN npm install

# Copy & chown all the other files
COPY --chown=node:node . .

# Build the project
RUN npm run build


FROM node:16.16-alpine

# Prepare the directory
RUN mkdir -p /app/node_modules && chown -R node:node /app
WORKDIR /app

# Set NODE_ENV variable to denote production mode
ENV NODE_ENV=production

# Copy the app dependencies and settings
COPY --chown=node:node ./package*.json ./
COPY ./.env ./

# Run as a non-root user
USER node

# Install only production dependencies
RUN npm install --omit=dev

# Copy the app itself
COPY --from=builder /app/build ./build

ENTRYPOINT [ "npm", "start" ]