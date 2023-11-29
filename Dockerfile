# Use the official Tomcat base image
FROM tomcat:latest

# Copy the WAR file from the local filesystem into the webapps directory of Tomcat
COPY target/hello-world-maven.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8081

# Start Tomcat using catalina.sh run command when the container starts
CMD ["catalina.sh", "run"]

