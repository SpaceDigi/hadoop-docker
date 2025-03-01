FROM openjdk:8-jdk-slim

WORKDIR /opt

# Встановлюємо необхідні пакети
RUN apt-get update && \
    apt-get install -y curl wget ssh rsync

# Скачуємо Hadoop
ENV HADOOP_VERSION 3.2.1
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xzf hadoop-${HADOOP_VERSION}.tar.gz && \
    mv hadoop-${HADOOP_VERSION} hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

# Налаштовуємо змінні середовища
ENV HADOOP_HOME /opt/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop

# Налаштовуємо HDFS
RUN mkdir -p /data/hdfs/namenode && \
    mkdir -p /data/hdfs/datanode

# Копіюємо конфігураційні файли
COPY ../config/core-site.xml $HADOOP_HOME/etc/hadoop/
COPY ../config/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY ../config/mapred-site.xml $HADOOP_HOME/etc/hadoop/
COPY ../config/yarn-site.xml $HADOOP_HOME/etc/hadoop/

# Копіюємо скрипт запуску
COPY start-hadoop.sh /opt/
RUN chmod +x /opt/start-hadoop.sh

# Порти
EXPOSE 9870 9000 9864 8088 8042 8032 8030 8031 8033 8040 8188

CMD ["/opt/start-hadoop.sh"]