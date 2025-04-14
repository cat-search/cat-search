# cat-search

Черновик решения задачи VK HR Tek Информационный поиск.

# Описание решения

Мы решили реализовать RAG со следующими компонентами:
- Векторная БД: weaviate.
- LLM: Ollama сервер с моделью 7b-instruct-v0.3-q4_0.
- Бэкенд FastAPI.
- БД Postgresql.
- Фронтенд Web UI: еще не реализован.
- Спайдер - загрузчик и парсер данных из Postgresql и файлового хранилища.

Решение выложено в виде 3-х репозиториев:
- 1: https://github.com/cat-search/cat-search

    Описание и docker-compose.yaml для запуска всего проекта.

- 2: https://github.com/cat-search/cat-backend

    Бэкенд FastAPI.

- 3: https://github.com/cat-search/cat-spider

    Спайдер: парсер и загрузчик данных из БД Postgresql в векторную БД.     


# Установка

1. Сборка образа cat-spider

```shell
# Склонируйте код
git clone https://github.com/cat-search/cat-spider.git

# Перейдите в корень кода cat-spider
cd cat-spider

# Соберите докер образ с тегом cat-spider
docker build -t cat-spider .

# Выход обратно в родительский каталог
cd ..
```

2. Сборка образа cat-backend

```shell
# Склонируйте код
git clone https://github.com/cat-search/cat-backend.git

# Перейдите в корень кода cat-backend
cd cat-backend

# Соберите докер образ с тегом cat-spider
docker build -t cat-backend .

# Выход обратно в родительский каталог
cd ..
```

3. Запуск всего проекта

```shell
# Склонируйте код
git clone https://github.com/cat-search/cat-search.git

# Перейдите в корень кода cat-search
cd cat-search

# Запустите проект
docker compose up -d
```

# Архитектура

