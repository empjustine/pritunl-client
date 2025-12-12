FROM quay.io/fedora/fedora:43

COPY pritunl.repo /etc/yum.repos.d/pritunl.repo
COPY pritunl.gpg /etc/yum.repos.d/pritunl.gpg
RUN rpm --import /etc/yum.repos.d/pritunl.gpg
RUN dnf -y upgrade --minimal --nodocs --noplugins --setopt=install_weak_deps=False && dnf -y install pritunl-client --nodocs --noplugins --setopt=install_weak_deps=False && dnf clean all

# RUN pritunl-client-service -install
CMD ["/bin/bash"]