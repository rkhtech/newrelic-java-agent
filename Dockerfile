FROM busybox:latest
MAINTAINER Randy Hommel
ADD newrelic/ /newrelic
VOLUME ["/newrelic"]
