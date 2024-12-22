FROM node:18-alpine as build

WORKDIR /app

RUN npm install -g pnpm

COPY package.json .

RUN pnpm install

COPY . .

RUN pnpm run build

FROM node:18-slim 

COPY --from=build /app/dist ./dist/
COPY --from=build /app/node_modules ./node_modules/

CMD [ "node", "dist/index.js" ]