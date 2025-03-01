FROM docker:20.10

# Встановлюємо docker-compose
RUN apk add --no-cache py-pip && \
    pip install docker-compose

WORKDIR /app
COPY . .

# Робимо скрипт запуску виконуваним
RUN chmod +x start.sh

CMD ["./start.sh"]