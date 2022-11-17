FROM debian:stable-slim
ENV NODE_VERSION 14.lts
EXPOSE 22 3000 4000
LABEL author='justypist' email="1003659191@qq.com"
COPY --chown=0:0 ./entrypoint.sh /
COPY --chown=1000:1000 ./.scripts /.scripts
HEALTHCHECK --interval=3s --timeout=1s \
CMD pidof sshd && exit 0 || exit 1
RUN echo build started. \
    # update apt source
    && sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list \
    && apt-get update \
    # basic tools
    && apt-get install -y curl wget openssh-server vim sudo \
    # add a default user
    && useradd -m -d /home/user -G sudo -p user -s /bin/bash user \
    && echo "user:user" | chpasswd \
    && echo "user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers.d/user \
    # end
    && echo build successfully!
ENTRYPOINT /entrypoint.sh
