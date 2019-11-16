# mohammaddev/momopoly_api

FROM node:12.8.0-alpine

ENV COMPlus_EnableDiagnostics=0
WORKDIR /usr/share/momopoly_api

RUN apk update && apk upgrade \
    && apk add --no-cache git \
	&& apk --no-cache add --virtual builds-deps build-base python

ENV PORT 6001
EXPOSE 6001

COPY . /usr/share/momopoly_api
RUN cd /usr/share/momopoly_api
RUN yarn

CMD ["yarn", "start"]