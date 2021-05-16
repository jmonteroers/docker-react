FROM node:alpine as builder
WORKDIR /usr/app

COPY ./package.json ./
RUN npm install
COPY ./ ./
# now we run stuff, not CMD
RUN npm run build

# just putting a second FROM statement starts a new Phase/Block
FROM nginx
# note the from tag
COPY --from=builder usr/app/build usr/share/nginx/html
