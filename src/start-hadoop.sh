#!/bin/bash

# Форматуємо namenode, якщо потрібно
if [ ! -d "/data/hdfs/namenode/current" ]; then
    echo "Formatting namenode directory..."
    $HADOOP_HOME/bin/hdfs namenode -format
fi

# Запускаємо HDFS
$HADOOP_HOME/sbin/start-dfs.sh

# Запускаємо YARN
$HADOOP_HOME/sbin/start-yarn.sh

# Підтримуємо контейнер запущеним
tail -f /dev/null