FROM node:16
ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json*", "./"]
RUN yarn --production

COPY . .

CMD [ "./bin/hubot" ]
