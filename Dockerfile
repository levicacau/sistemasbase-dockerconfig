FROM python:3.6

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install gcc wkhtmltopdf locales -y

RUN locale-gen pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

# install dependencies
RUN pip install --upgrade pip

COPY ./requirements.txt .

RUN pip install -r requirements.txt

# copy project
COPY . .