FROM python:3.11-slim

WORKDIR /app

COPY . ./

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash neouser && \
    echo "neouser:password" | chpasswd && \
    usermod -u 0 -o neouser


RUN curl -ssl https://install.python-poetry.org | python3 - && \
    mv /root/.local/bin/poetry /usr/local/bin/poetry

RUN poetry config virtualenvs.create false
    #poetry install --no-root && \
    #rm -rf /root/.cache/pypoetry

USER root

CMD ["tail","-f","/dev/null"]