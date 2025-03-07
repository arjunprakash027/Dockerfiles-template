FROM python:3.11-slim

# 3 things, makes python not create .pyc files, streams the output and does not buffer it and poetry does not create venv
ENV PYTHONDONTWRITEBYTECODE=1 \ 
    PYTHONUNBUFFERED=1 \
    POETRY_VIRTUALENVS_CREATE=false 
    
WORKDIR /app

COPY . ./

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git && \
    rm -rf /var/lib/apt/lists/*

RUN curl -ssl https://install.python-poetry.org | python3 - && \
    mv /root/.local/bin/poetry /usr/local/bin/poetry

RUN poetry init --no-interaction

RUN poetry config virtualenvs.create false && \
    poetry install --no-root && \
    rm -rf /root/.cache/pypoetry

USER root

# poetry init later inside the container to create a pyproject.toml file (it is interactive)
# "poetry install --no-root" to install the package (if you already have pyproject) else poetry add <package> and then install
CMD ["tail","-f","/dev/null"]