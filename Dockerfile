FROM python:3.10
RUN apt update
WORKDIR /app/
ADD requirements.txt /app/
RUN pip install -r requirements.txt --default-timeout=28000
ADD . /app/
RUN python3 download-model.py
RUN sh install.sh
EXPOSE 8000
CMD ["hypercorn", "main:app", "-b", "0.0.0.0:8000", "--reload"]
