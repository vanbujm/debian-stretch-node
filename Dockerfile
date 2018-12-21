FROM debian:stretch

MAINTAINER Jon Van Buren <vanbujm@gmail.com>
LABEL Description="A debian stretch container with node and yarn"

# Update package repository
RUN apt-get update

# Install required packages
RUN apt-get install -y --allow-unauthenticated \
    git \
    vim \
    yarn \
    curl \
    gnupg

# Install NodeJs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Clean up after apt
RUN apt-get clean
RUN rm -rf /var/lib/apt

# Setup working directory
RUN mkdir -p /usr/debNode
WORKDIR /usr/debNode

#COPY scripts/* /usr/rpi/


