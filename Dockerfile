FROM ubuntu:22.04

RUN apt update && apt install --assume-yes python3-pip
RUN mkdir /flask/

RUN useradd -ms /bin/bash devops_guru
USER devops_guru

COPY /app /flask/
COPY requirements.txt /flask/requirements.txt

WORKDIR /flask/
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python3","web.py"]