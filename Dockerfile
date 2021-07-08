ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY * /
# Install requirements for add-on
RUN apk add --no-cache python3=3.5.1-r0

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
