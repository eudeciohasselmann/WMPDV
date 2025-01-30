FROM python:3.12

WORKDIR /app

COPY ./app ./app
COPY requirements.txt requirements.txt
RUN python3 -m venv venv && . venv/bin/activate
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

ENV VIRTUAL_ENV /venv
ENV PATH /venv/bin:$PATH

EXPOSE 8000

CMD uvicorn app.main:app --host 0.0.0.0 --port 8000