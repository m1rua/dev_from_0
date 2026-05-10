docker не понимает, что ему делать, пока не увидит инструкцию, которая всегда называется Dockerfile


FROM - основа образа

FROM ubuntu:22.04
FROM python:3.11-alpine
FROM node:18

всегда первый
указывает базовый образ, от которого строишь свой
формат: FROM имя:тег (если тег не указан, берется latest)


RUN - выполнить команду при сборке

RUN apt-get update && apt-get install -y curl
RUN pip install flask
RUN npm install

Выполняется во время сборки образа (не при запуске контейнера)
каждая RUN создает новый слой в образе
можно объединять команды через &&
ПРИМЕР:

	RUN apt-get update && \

	apt-get install -y \

	python3 \

	python3-pip \

	&& rm -rf /var/lib/apt/lists/*


COPY - скопировать файлы

COPY index.html /var/www/html
COPY app.py /app/

копирует файлы с твоего компьютера в образ
формат COPY <from> <where>


WORKDIR - рабочая директория

WORKDIR /app

устанавливает текущую папку для последующих инструкций
если папки нет - docker создаст ее
удобнее, чем писать полные пути каждый раз


ENV - переменные окружения

ENV NODE_ENV=production
ENV PORT=3000

создает переменные, которые будут доступны в контейнере
можно использовать в других инструкциях: $PORT
ПРИМЕР:
ENV APP_HOME
WORKDIR ${APP_HOME}


EXPOSE - открыть порт

EXPOSE 80
EXPOSE 8080

документирует, какой порт слушает приложение
не открывает порт автоматически (нужен -p при запуске)
просто подсказка для пользователя


CMD - команда по умолчанию

CMD ["python", "app.py"]
CMD ["nginx", "-g", "daemon off;"]

выполняется при запуске контейнера
можно переопределить при запуске: docker run image bysh
только одна CMD в Dockerfile (последняя побеждает)


ENTRYPOINT - главная команда (опционально)
как CMD только не переопределяется на последнюю

ENTRYPOINT ["python"]
CMD ["app.py"]

часто используется вместе с CMD
	ENTRYPOIN - программа
	CMD - аргументы по умолчанию
