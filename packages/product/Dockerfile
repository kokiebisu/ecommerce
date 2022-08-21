FROM python:3.9

WORKDIR /code

COPY requirements.txt /code/requirements.txt
COPY ./src ./src

RUN pip install --no-cache-dir --upgrade -r requirements.txt
EXPOSE 80

WORKDIR /code

ENV PYTHONPATH="./src"
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]