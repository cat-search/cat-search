# cat-search

Черновик решения задачи VK HR Tek Информационный поиск.

# Описание решения

Мы решили реализовать RAG со следующими компонентами:
- Векторная БД: weaviate.
- LLM: Ollama сервер с моделью 7b-instruct-v0.3-q4_0.
- Бэкенд FastAPI.
- БД Postgresql для хранения информации о запросах, спайдера и т. п.
- Фронтенд Web UI: еще не реализован.
- Спайдер - загрузчик и парсер данных из Postgresql и файлового хранилища.
- Реранкер: под вопросом.
- Обратный индекс: под вопросом.

Решение выложено в виде 3-х репозиториев:
- 1: https://github.com/cat-search/cat-search

    Описание и docker-compose.yaml для запуска всего проекта.

- 2: https://github.com/cat-search/cat-backend

    Бэкенд FastAPI.

- 3: https://github.com/cat-search/cat-spider

    Спайдер: парсер и загрузчик данных из БД Postgresql в векторную БД.     

# Текущее состояние

- Спайдер и загрузка документов: 
  - Нам удалось распознать все doc и почти все pdf файлы, кроме сканов.
- Векторная БД на weaviate:
  - Распознанный текст нарезаем на чанки и грузим в векторную БД.
  - Получаем выдачу по запросу.
- LLM
  - Запускаем на ollama.
  - К ней же обращается weaviate
- Бэкенд FastAPI
  - Работает swagger, пока отдает только выдачу от векторной БД
  - Вместо фронта пока swagger. 
- Упаковка в docker
  - Только начали

# Установка

1. В .env можно указать каталог ФС, в который будут сохраняться данные.
По-умолчанию данные будут сохраняться в каталог `./catsearch`.

2. Сборка образа cat-spider

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

3. Сборка образа cat-backend

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

4. Запуск всего проекта

```shell
# Склонируйте код
git clone https://github.com/cat-search/cat-search.git

# Перейдите в корень кода cat-search
cd cat-search

# Запустите проект
docker compose up -d
```

# Архитектура

![Architecture](doc/CatSearch_System_design.jpg)
