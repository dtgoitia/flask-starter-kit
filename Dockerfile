FROM python:3.10-slim as stage0

# Send Python output straight to the terminal
ENV PYTHONUNBUFFERED 1

FROM stage0 as release

WORKDIR /app

COPY ./requirements/prod.txt /requirements/prod.txt
RUN pip install \
      --no-cache-dir \
      -r /requirements/prod.txt \
    && rm -rf /requirements

COPY . /app

FROM release as dev

COPY ./requirements /requirements
RUN pip install -r /requirements/dev.txt

COPY . /app

FROM release
