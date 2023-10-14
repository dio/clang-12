FROM quay.io/centos/centos:stream8
RUN yum install -y gcc gcc-c++ xz python3 perl ncurses-compat-libs libatomic unzip cmake git
COPY ./tools/centos-stream8/build.sh /var/local/build.sh
RUN cat /var/local/build.sh | bash
