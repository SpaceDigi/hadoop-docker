FROM docker/compose:1.29.2

WORKDIR /app
COPY docker-compose.yaml /app/
COPY hadoop.env /app/

CMD ["docker-compose", "up", "-d", "&&", "tail", "-f", "/dev/null"]