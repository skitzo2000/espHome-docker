FROM ubuntu:bionic
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install git wget mc aptitude nano sudo curl software-properties-common build-essential apt-utils locales python3-dev python3-pip iputils-ping && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ARG CACHEBUST=1
ENV ESPHOME_DASHBOARD_USE_PING="true"
RUN pip3 install impacket --upgrade --user
RUN pip3 install esphome
RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"
RUN ln -s ~/.platformio/penv/bin/platformio /usr/local/bin/platformio
RUN ln -s ~/.platformio/penv/bin/pio /usr/local/bin/pio
RUN ln -s ~/.platformio/penv/bin/piodebuggdb /usr/local/bin/piodebuggdb
CMD esphome /config dashboard --password $password