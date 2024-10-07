FROM node:20.16

WORKDIR /app

COPY . .

RUN yarn install

RUN yarn build

ENTRYPOINT ["yarn", "dev"]
