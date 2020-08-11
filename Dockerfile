FROM skitzo2000/python3.7base
ARG CACHEBUST=1
ENV ESPHOME_DASHBOARD_USE_PING="true"
RUN apt-get update
RUN apt-get -y install iputils-ping && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip3 install impacket --upgrade --user
RUN pip3 install esphome
RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"
RUN ln -s ~/.platformio/penv/bin/platformio /usr/local/bin/platformio
RUN ln -s ~/.platformio/penv/bin/pio /usr/local/bin/pio
RUN ln -s ~/.platformio/penv/bin/piodebuggdb /usr/local/bin/piodebuggdb
CMD esphome /config dashboard --password $password