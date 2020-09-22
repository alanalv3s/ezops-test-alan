FROM node:lts-alpine

RUN mkdir -p /home/node/chat-app/node_modules && chown -R node:node /home/node/chat-app

WORKDIR /home/node/chat-app

COPY package.json yarn.* ./

USER node

RUN yarn install --production

COPY --chown=node:node . .

EXPOSE 3000

CMD ["node", "server.js"]
