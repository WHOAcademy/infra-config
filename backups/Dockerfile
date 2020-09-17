FROM registry.fedoraproject.org/fedora:32 
USER root
RUN \
  mkdir -p /opt/backup && \
  yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-32-x86_64/pgdg-fedora-repo-latest.noarch.rpm && \
  yum install postgresql10.x86_64 -y && \
  yum update -y && \
  yum clean all
