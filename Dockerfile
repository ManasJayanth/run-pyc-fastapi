FROM python:3 as builder

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY main.py .
RUN python -m compileall 

FROM python:3
COPY --from=builder __pycache__ __pycache__
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apt install bash

CMD python __pycache__/main.cpython-*.pyc

