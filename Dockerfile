FROM debian:buster-slim

RUN set -ex \
	&& mkdir -p /usr/local/gcc-ming64

WORKDIR /usr/local/gcc-ming64

RUN set -ex \
	&& apt-get update \
	&& apt-get dist-upgrade -y \
	&& apt-get install -y --no-install-recommends \
		autoconf \
		automake \
		bison \
		build-essential \
		bzip2 \
		ca-certificates \
		curl \
		flex \
		git \
		gzip \
		lzip \
		wget \
		xz-utils \
	&& apt-get clean \
	&& rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*


COPY build.sh .

RUN set -ex \
	&& ./build.sh download

RUN set -ex \
	&& ./build.sh prereq
