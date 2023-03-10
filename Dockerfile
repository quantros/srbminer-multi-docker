FROM debian:stable-slim
RUN apt-get update && apt-get -y install wget xz-utils && \
    cd /opt && wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.2.0/SRBMiner-Multi-2-2-0-Linux.tar.xz && \
	tar xf SRBMiner-Multi-2-2-0-Linux.tar.xz && rm -rf /opt/SRBMiner-Multi-2-2-0-Linux.tar.xz && \
	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*
ENV ALGO="blake3_ironfish"
ENV POOL_ADDRESS="36.189.234.195:60006"
ENV WALLET_USER="5285b1ca4fead5779b92fd9794ebc956383a0e39b627b1f27f6d902900ca5482"
ENV PASSWORD="c=LTC,ID=docker"
ENV EXTRAS="--api-enable --api-port 80 --disable-gpu --disable-auto-affinity --cpu-threads 0"
EXPOSE 80
COPY start_zergpool.sh /opt/SRBMiner-Multi-2-1-0/
RUN chmod +x /opt/SRBMiner-Multi-2-1-0/start_zergpool.sh
WORKDIR "/opt/SRBMiner-Multi-2-1-0"
ENTRYPOINT ["./start_zergpool.sh"]
