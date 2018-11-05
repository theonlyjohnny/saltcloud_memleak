FROM python:3.6.6-stretch
RUN wget -O - https://repo.saltstack.com/apt/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/debian/9/amd64/latest stretch main" >> /etc/apt/sources.list.d/saltstack.list
RUN apt update && apt install host salt-cloud python-msgpack -y

RUN python -m venv ./virtualenv

COPY requirements.txt requirements.txt
RUN ./virtualenv/bin/python3 -m pip install -r requirements.txt

COPY leak.py leak.py

ENTRYPOINT ["./virtualenv/bin/python3"]
CMD ["./leak.py"]
