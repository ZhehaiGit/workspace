FROM openjdk:8

# Install apt repos
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list

# install heroku's release key for package verification
RUN wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -

RUN apt-get update && \
    apt-get -y --no-install-recommends install maven nodejs heroku-toolbelt ruby && \
    rm -rf /var/lib/apt/lists/*

# Install gruntjs
RUN npm install -g grunt-cli

# Keep the container running
CMD tail -f /dev/null