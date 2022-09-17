# 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
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


