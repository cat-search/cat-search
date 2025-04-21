# cat-search

Решение задачи VK HR Tek Информационный поиск.

# Описание решения

Мы решили реализовать RAG со следующими компонентами:
- Векторная БД: weaviate.
- Ollama сервер для запуска моделей LLM и эмбеддингов.
- Бэкенд FastAPI, Langchain.
- Фронтенд: Telegram bot.
- Postgresql: БД для хранения информации о запросах.

Все компоненты упакованы в docker. Проект запускается docker compose.

Решение выложено в виде 4-х репозиториев:
- 1: https://github.com/cat-search/cat-search

    Описание и docker-compose.yaml для запуска всего проекта.

- 2: https://github.com/cat-search/cat-backend

    Бэкенд FastAPI.

- 3: https://github.com/cat-search/tg-bot

    Телеграм бот.

- 3: https://github.com/cat-search/cat-spider

    Спайдер: загрузчик данных в векторную БД.     

# Установка

1. Сборка образа cat-spider

```shell
git clone https://github.com/cat-search/cat-spider.git -- \
  && cd cat-spider \
  && docker build -t cat-spider . \
  && cd ..
```

2. Сборка образа cat-backend

```shell
git clone https://github.com/cat-search/cat-backend.git -- \
  && cd cat-backend \
  && docker build -t cat-backend . \
  && cd ..
```

3. Cборка образа tg-bot

```shell
git clone  https://github.com/cat-search/tg-bot.git -- \
  && cd tg-bot \
  && docker build -t tg-bot . \
  && cd ..
```

4. Запуск всего проекта

- Для запуска бота необходимо в файле app.env прописать переменную BOT_TOKEN с 
  ключом: `BOT_TOKEN=7636890069:AAF2yXCS4MdErl1AOekAuQObrGQeg4vzSk8`
- (Опционально) В .env можно указать каталог ФС, в который будут сохраняться данные.
  По-умолчанию данные будут сохраняться в каталог `./catsearch`.

```shell
git clone https://github.com/cat-search/cat-search.git -- \
  && cd cat-search \
  && docker compose up -d
```

# Описание старта сервисов docker compose

- Запустятся `ollama`, `weaviate`, `pg`.
- `pg` выполнит pg_restore, при запуске entrypoint.
- `ollama` будет pull-ить 2 модели: для embeddings и LLM.
- `spider` запустится и будет ожидать готовности `weaviate`, `pg`, `ollama`. 
  Как только пройдет первая успешная вставка в `weaviate`, начнет загрузку 
  текстовых документов из папки ./files, которая монтируется в контейнер.
- Запустится `backend`, он будет ожидать запросы от `tg-bot`. На `backend` 
  доступен swagger.
- В телеграм чате tg-bot будет принимать запросы от пользователя и давать ответы. 


# Проверка работоспособности

## Локальный запуск

При локальном запуске, после старта всех сервисов в docker compose, будут доступны:

- Чат с телеграм ботом: https://t.me/CatSearchVKBot
- Swagger бэкенда: http://localhost/docs
  - Если бот не отвечает, пожалуйста, используйте для запросов метод `/front/query`
    в swagger.

## Демо стенд

Демо стенд запущен в облаке и доступны:
- Чат с телеграм ботом: @CatSearchCrewBot
- Swagger бэкенда: http://cat-vm3.v6.rocks:2013/docs
  - Если бот не отвечает, пожалуйста, используйте для запросов метод `/front/query`
    в swagger.

# Архитектура

- В качестве модели для embeddings выбрана: `jeffh/intfloat-multilingual-e5-large:f16`
  - parameters       558.84M    
  - context length   512        
  - embedding length 1024       
  - quantization     F16
- В качестве модели для вопроса-ответа LLM выбрана: `llama3`
  - parameters     8.0B
  - context length 8192
  - quantization   Q4_0

![Architecture](doc/CatSearch_System_design.jpg)
