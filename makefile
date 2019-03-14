REPOSITORY = crime-aki-jbridge

help:
	@echo -B --always-make
	@echo first

.PHONY: first
first:
	rm -rfv .git
	git init
	git add --all
	git commit -m "make this the first and the only commit"
	git remote add origin https://github.com/albraga/${REPOSITORY}
	git push -u --force origin master 

repository:
	curl -u 'albraga' https://api.github.com/user/repos -d '{"name":"${REPOSITORY}"}'


forcepull:
	git fetch --all
	git reset --hard origin/master
	
dependency:
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=org.hsqldb:hsqldb:2.4.1
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=org.hsqldb:sqltool:2.4.1
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=com.google.code.gson:gson:2.8.5
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=org.json:json:20180813
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=commons-logging:commons-logging:1.2
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=org.apache.httpcomponents:fluent-hc:4.5.7
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=org.apache.httpcomponents:httpclient:4.5.7
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=org.apache.httpcomponents:httpcore:4.4.11
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=commons-codec:commons-codec:1.12
	mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get -Dartifact=joda-time:joda-time:2.10.1


java:
	java -classpath `cygpath -wp "./dist:/cygdrive/d/lib/*"` pacote.Jbridge

javac:
	javac -classpath `cygpath -wp ".:/cygdrive/d/lib/*"` src/pacote/jbridge.java -d dist

tofile:
	java -classpath `cygpath -wp "./dist:/cygdrive/d/lib/*"` pacote.Jbridge > result.json
