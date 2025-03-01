#!/bin/bash
docker-compose up -d
# Залишаємо контейнер працювати, щоб Railway не завершив його
tail -f /dev/null