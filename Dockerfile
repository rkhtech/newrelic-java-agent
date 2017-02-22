FROM busybox:latest
MAINTAINER Randy Hommel
ADD newrelic/ /newrelic
VOLUME ["/newrelic"]
RUN echo 'while :; do  echo `date`;sleep 1h;done;' > /startup.sh
RUN chmod +x /startup.sh
CMD /startup.sh
