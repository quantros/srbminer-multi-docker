#!/bin/bash
version="2.1.0"
image="srbminer-multi"
docker build . --tag docker.io/cniweb/$image:$version
docker tag docker.io/cniweb/$image:$version docker.io/cniweb/$image:latest
docker tag docker.io/cniweb/$image:$version ghcr.io/cniweb/$image:$version
docker tag docker.io/cniweb/$image:$version ghcr.io/cniweb/$image:latest
docker tag docker.io/cniweb/$image:$version quay.io/cniweb/$image:$version
docker tag docker.io/cniweb/$image:$version quay.io/cniweb/$image:latest
docker push docker.io/anatoliecazacu/$image:$version
docker push docker.io/anatoliecazacu/$image:latest
docker push ghcr.io/anatoliecazacu/$image:$version
docker push ghcr.io/anatoliecazacu/$image:latest
docker push quay.io/anatoliecazacu/$image:$version
docker push quay.io/anatoliecazacu/$image:latest
