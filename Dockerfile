FROM skitzo2000/python3.7base
ARG CACHEBUST=1
ENV ESPHOME_DASHBOARD_USE_PING="true"
RUN apt-get update
RUN apt-get -y install iputils-ping && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip3 install impacket --upgrade --user
RUN pip3 install git+https://github.com/skitzo2000/esphome.git
RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"
CMD esphome /config dashboard --password $password