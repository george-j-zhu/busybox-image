FROM centos:7 as base

USER 0
WORKDIR /
RUN curl -k -O https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-x86_64

RUN cp busybox-x86_64 /usr/local/bin/busybox

RUN chmod +x /usr/local/bin/busybox

RUN mkdir rootfs
WORKDIR /rootfs
COPY create_rootfs.sh /
RUN chmod +x /create_rootfs.sh

RUN /create_rootfs.sh

RUN cp /usr/local/bin/busybox bin/

FROM scratch

COPY --from=base /rootfs /

CMD ["/bin/sh"]