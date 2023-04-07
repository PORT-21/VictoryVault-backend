FROM python:3.10.11-slim-bullseye
EXPOSE 14431

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /app

RUN apt-get update && \
    apt-get install -y build-essential libpq-dev gettext libmagic-dev libjpeg-dev zlib1g-dev git && \
    apt-get purge -y --auto-remove -o APT:AutoRemove:RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /app

RUN pip install -r /apprequirements.txt

COPY /home/hackaton/project /app
 
CMD ["gunicorn", "--bind", ":14431", "--workers", "4", "main:app", "-k", "uvicorn.workers.UvicornWorker"]

