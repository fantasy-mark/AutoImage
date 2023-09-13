# linux_rk3399_dev
FROM ubuntu:latest

WORKDIR /project

RUN apt-get install build-essential pkg-config zlib1g-dev libglib2.0-0 libglib2.0-dev  libsdl1.2-dev libpixman-1-dev libfdt-dev libssl-dev autoconf automake libtool librbd-dev libaio-dev flex bison -y
RUN apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf 
RUN apt-get install qemu-system

EXPOSE 8888

CMD ["bash"]