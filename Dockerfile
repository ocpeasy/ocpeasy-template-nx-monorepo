FROM node:15.1.0-buster-slim
WORKDIR /var/app
ENV PATH /var/app/node_modules/.bin:$PATH
COPY package.json ./
RUN yarn
COPY . ./
RUN mkdir /.yarn
RUN mkdir /.cache
RUN mkdir /.cache/yarn

RUN chmod -R 777 /.yarn
RUN chmod -R 777 /.cache
RUN chmod -R 777 /var/app/node_modules
RUN chmod -R 777 /var/app/dist

ENTRYPOINT ["yarn", "start"]
