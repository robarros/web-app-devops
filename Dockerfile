FROM node:12-alpine AS builder

WORKDIR /app

COPY package*.json ./

COPY ./src ./src

RUN npm install

# RUN npm run build

RUN npm prune --production # Remove dev dependencies

# ---------- Release ----------

FROM node:12-alpine

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules

COPY --from=builder /app/src ./src

USER node

EXPOSE 3000

CMD ["node", "./src/server.js"]
