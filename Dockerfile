FROM alpine:3.5

# Install necessary packages
RUN apk --no-cache add ca-certificates openjdk8 git curl

# Create Ant directory
RUN mkdir -p /opt/ant/

# Download and unpack Apache Ant 1.9.8
RUN curl -Lk http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz -o /opt/ant/apache-ant-1.9.8-bin.tar.gz && \
    tar -xvzf /opt/ant/apache-ant-1.9.8-bin.tar.gz -C /opt/ant/ && \
    rm -f /opt/ant/apache-ant-1.9.8-bin.tar.gz

# Optional: Drop SonarQube lib (uncomment if needed)
# RUN curl -Lk http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-ant-task/2.3/sonar-ant-task-2.3.jar -o /opt/ant/apache-ant-1.9.8/lib/sonar-ant-task-2.3.jar

# Set Ant home and parameters
ENV ANT_HOME=/opt/ant/apache-ant-1.9.8
ENV ANT_OPTS="-Xms256M -Xmx512M"

# Update PATH
ENV PATH="${PATH}:${HOME}/bin:${ANT_HOME}/bin"

