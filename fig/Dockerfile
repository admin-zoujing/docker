FROM python:2.7
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
ADD . /code
WORKDIR /code
EXPOSE 5000
RUN pip install -r requirements.txt
