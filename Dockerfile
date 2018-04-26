FROM sonm/opencl

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
   apt-get install -qy curl libcurl3 && \
   apt-get -yqq clean && \
   rm -rf /var/lib/apt/lists/*

WORKDIR /home/claymore

COPY gget.sh .

ENV GDRIVE_ID 1V1SBbYntsRz6-OOjJ0T9uMK27YMjDV8F

RUN ./gget.sh $GDRIVE_ID claymore.tar.gz && \
    tar -xz --strip-components=1 -f claymore.tar.gz && \
    rm claymore.tar.gz

ENV WALLET -
ENV WORKER x

CMD ./ethdcrminer64 -mode 1 -epool eth-eu1.nanopool.org:9999 -ewal "$WALLET.$WORKER" -epsw x
