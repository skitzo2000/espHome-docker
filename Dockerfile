FROM skitzo2000/python3.7base
ARG CACHEBUST=1
ENV ESPHOME_DASHBOARD_USE_PING="true"
RUN apt-get -y install iputils-ping
RUN pip3 install impacket --upgrade --user
RUN pip3 install esphome
RUN pip3 install -U platformio
CMD pip3 install -U platformio | : && esphome /config dashboard --password $password