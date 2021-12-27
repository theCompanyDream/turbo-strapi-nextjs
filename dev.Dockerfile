FROM node:16-alpine

ENV NODE_ENV development

#add turborepo
RUN yarn global add turbo

#add strapi
RUN yarn global add @strapi/strapi@${STRAPI_VERSION}

ENV NODE_ENV development

# Set working directory
WORKDIR /app

# Install app dependencies
COPY  ["yarn.lock", "package.json", "./"] 

COPY . .

RUN yarn install

EXPOSE 3000 1337

CMD ["yarn", "dev"]