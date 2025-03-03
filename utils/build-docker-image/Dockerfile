FROM meteor/node:14.21.4

# Use /bin/bash as a shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install meteor
RUN curl https://install.meteor.com/\?release\=2.16 | sh

WORKDIR /app 
COPY ./output /app

EXPOSE 3000 3001 4000

CMD cd /app && METEOR_ALLOW_SUPERUSER="true" ./justdo run