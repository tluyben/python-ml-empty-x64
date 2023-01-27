# Dockerfile
FROM debian:latest
RUN apt-get update
RUN apt-get install -y wget gpg vim python3 pip procps libmariadb-dev-compat libmariadb-dev
WORKDIR /tmp
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py310_22.11.1-1-Linux-x86_64.sh
RUN bash Miniconda3-py310_22.11.1-1-Linux-x86_64.sh -b -p $HOME/miniconda
COPY requirements.txt . 
COPY .env /root/
RUN pip install -r requirements.txt
WORKDIR /app
CMD ["sleep", "10000"]

