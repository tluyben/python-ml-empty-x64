# Dockerfile
FROM debian:latest
RUN apt-get update
RUN apt-get install -y wget gpg vim python3 pip procps libmariadb-dev-compat libmariadb-dev git
WORKDIR /tmp
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py310_22.11.1-1-Linux-x86_64.sh
RUN bash Miniconda3-py310_22.11.1-1-Linux-x86_64.sh -b -p $HOME/miniconda
RUN echo "export PATH=$PATH:/root/miniconda/bin" >> /root/.bashrc
COPY requirements.txt . 
RUN pip install -r requirements.txt
RUN mkdir /app
WORKDIR /app
COPY main.py .
COPY .env . 
RUN echo Done, you are free to enter
CMD ["sleep", "10000"]

