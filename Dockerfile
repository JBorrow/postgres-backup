FROM postgres:16

COPY backup.sh backup.sh

ENTRYPOINT ["/bin/bash", "/backup.sh"]
CMD []
