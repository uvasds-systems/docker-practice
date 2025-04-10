FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt

RUN pip3 install -r /app/requirements.txt

COPY *.py /app/

EXPOSE 8080

ENTRYPOINT ["streamlit", "run", "geo.py", "--server.port=8080", "--server.address=0.0.0.0"]
