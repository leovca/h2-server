FROM java:7

ENV DATA_DIR=/h2-data

RUN curl https://h2database.com/h2-2019-03-13.zip -o h2.zip \
  && unzip h2.zip -d . \
  && rm h2.zip

RUN mkdir ${DATA_DIR}
VOLUME ${DATA_DIR}

WORKDIR /h2/bin

# Expose Ports
# - 8083 H2 Console
# - 5435 H2 Server
EXPOSE 8083 5435

CMD java -cp h2*.jar org.h2.tools.Server \
  -web \
  -ifNotExists \
  -webAllowOthers \
  -tcpAllowOthers \
  -baseDir ${DATA_DIR}