FROM node:16

RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

WORKDIR /app
# pnpm fetch does require only lockfile
COPY pnpm-lock.yaml ./

RUN pnpm fetch

ADD . ./
RUN pnpm install -r --offline

CMD ["pnpm", "start"]
