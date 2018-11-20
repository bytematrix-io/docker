# ByteMatrix Viewer
#
# Version 1.0.0

FROM bytematrix/java8
MAINTAINER support@bytematrix.io

ENV DEFAULT_LANG=en
EXPOSE 8080

COPY ./viewer /app/viewer
WORKDIR /app/viewer

ENTRYPOINT java -jar ./BytematrixViewer-0.0.1-SNAPSHOT.war --default.language=$DEFAULT_LANG