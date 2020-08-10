FROM siwatinc/python3baseimage
ARG CACHEBUST=1
ENV ESPHOME_DASHBOARD_USE_PING="true"
RUN apt-get -y install iputils-ping
RUN pip3.7 install esphome
RUN pip3.7 install -U platformio
CMD pip3.7 install -U platformio | : && esphome /config dashboard --password $password