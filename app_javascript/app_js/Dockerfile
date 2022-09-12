FROM node:13.12.0-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

COPY package.json ./
COPY package-lock.json ./

USER  root

RUN npm install --silent && npm install react-scripts@3.4.1 -g --silent

USER appuser

COPY . ./

CMD ["npm", "start"]