FROM ubuntu:22.04

RUN apt update && apt install --assume-yes python3-pip
RUN mkdir /flask/

RUN useradd -ms /bin/bash devops_guru
USER devops_guru


COPY requirements.txt /flask/requirements.txt
RUN pip install -r /flask/requirements.txt

COPY /app /flask/
WORKDIR /flask/

EXPOSE 5000

CMD ["python3","app.py"]