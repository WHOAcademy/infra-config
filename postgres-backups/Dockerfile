FROM registry.redhat.io/rhscl/postgresql-10-rhel7:latest
USER root
RUN \
  yum update -y && \
  yum install python27-python-pip.noarch openssl -y && \
  python /opt/rh/python27/root/usr/lib/python2.7/site-packages/pip install azure-storage-blob
