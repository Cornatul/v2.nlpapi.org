FROM python:3.10
RUN apt update
WORKDIR /app/
ADD . /app/
RUN su -c "apt-get update"
RUN su -c "python3 -m pip install --upgrade pip"
RUN su -c "pip install spacy"
RUN su -c "pip install nltk"
RUN su -c "pip install textblob"
RUN su -c "python3 -m nltk.downloader -d /usr/local/share/nltk_data punkt"
RUN su -c "python3 -m nltk.downloader -d /usr/local/share/nltk_data stopwords"
RUN su -c "python3 -m nltk.downloader -d /usr/local/share/nltk_data vader_lexicon"
RUN su -c "python3 -m spacy download en_core_web_md"
RUN su -c "python3 -m textblob.download_corpora"
RUN pip install -r requirements.txt --default-timeout=28000
RUN su -c "python3 download-model.py"
EXPOSE 8000
EXPOSE 7000
CMD ["hypercorn", "main:app", "-b", "0.0.0.0:8000", "--reload"]
CMD ["hypercorn", "download-model:app", "-b", "0.0.0.0:7000", "--reload"]
