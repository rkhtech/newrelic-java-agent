# Instructions for use

The main purpose of this container is to provide the necessary JAR files nessary for running the 
NewRelic java agent inside an application container running Java without the need to modify the 
application source code.

### Start the container.  (The container does not need to be running)
```
docker run --name newrelic-java-agent rkhtech/newrelic-java-agent
```

## Start another container that maps the newrelic agent jar file
```
docker run --rm -it --volumes-from newrelic-java-agent ubuntu bash
```

## Example running rancher-server with the NewRelic Agent running
```
docker run -d \
	--restart=unless-stopped -p 8080:8080 \
	--name rancher-server \
	--volumes-from newrelic-java-agent \
	-e JAVA_OPTS='-javaagent:/newrelic/newrelic.jar' \
	-e NEW_RELIC_APP_NAME=jenkins-env-vars \
	-e NEW_RELIC_LICENSE_KEY=9999999999999999999999999999999999999999 \
	-e NEW_RELIC_APP_NAME='Rancher-Server-Test-Java-Agent' \
	rancher/server
```


