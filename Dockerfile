FROM node:20.16

WORKDIR /app

COPY . .

RUN npm install -g pnpm@10.18.2 && pnpm install

RUN pnpm build

ENTRYPOINT ["pnpm", "dev"]
