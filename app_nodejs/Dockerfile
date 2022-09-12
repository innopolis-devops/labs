FROM node:9-slim
WORKDIR /app
copy package.json ./src/server
RUN yarn
COPY . /app
CMD ["yarn", "serve"]

