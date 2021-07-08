ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY * /
# Install requirements for add-on
RUN apk update && apk upgrade
RUN apk add --no-cache python3=3.6.8-r0 py-pip --repository=http://dl-cdn.alpinelinux.org/alpine/v3.6/main
RUN pip3 install six
RUN pip3 install pynacl

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
