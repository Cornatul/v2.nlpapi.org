FROM python:3.10
RUN apt update
WORKDIR /app/
ADD . /app/
RUN su -c "apt-get update"
RUN su -c "apt-get --assume-yes install pkg-config libhdf5-dev"
RUN su -c "pip3 install --upgrade setuptools wheel"
RUN su -c "python3 -m pip install --upgrade pip"
RUN su -c "curl https://sh.rustup.rs -sSf | sh -s -- -y"
RUN export PATH="$HOME/.cargo/bin:$PATH"
RUN su -c  "source $HOME/.cargo/env"
RUN /bin/bash -c "source $HOME/.cargo/env"

# Other Packages
RUN su -c "pip3 install torch"
RUN su -c "pip3 install transformers"
RUN su -c "pip3 install tokenizers"
RUN su -c "pip3 install h11"
RUN su -c "pip3 install h2"
RUN su -c "pip3 install hpack"
RUN su -c "pip3 install Hypercorn"
RUN su -c "pip3 install hyperframe"
RUN su -c "pip3 install priority"
RUN su -c "pip3 install pydantic"
RUN su -c "pip3 install starlette"
RUN su -c "pip3 install toml"
RUN su -c "pip3 install typing-extensions"
RUN su -c "pip3 install wsproto"
RUN su -c "pip3 install GoogleNews"



RUN su -c "pip3 install nltk"
RUN su -c "pip3 install spacy"
RUN su -c "pip3 install spacy-legacy"
RUN su -c "pip3 install spacy-loggers"
RUN su -c "pip3 install lxml"
RUN su -c "pip3 install textblob"
RUN su -c "pip3 install spacytextblob"
RUN su -c "pip3 install vaderSentiment"
RUN su -c "pip3 install minet"
RUN su -c "pip3 install praw"
RUN su -c "pip3 install prawcore"
RUN su -c "pip3 install tweepy"
RUN su -c "pip3 install pytrends"
RUN su -c "pip3 install absl-py"
RUN su -c "pip3 install astunparse"
RUN su -c "pip3 install cachetools"
RUN su -c "pip3 install certifi"
RUN su -c "pip3 install charset-normalizer"
RUN su -c "pip3 install click"
RUN su -c "pip3 install colorama"
RUN su -c "pip3 install filelock"
RUN su -c "pip3 install Flask"
RUN su -c "pip3 install flatbuffers"
RUN su -c "pip3 install gast"
RUN su -c "pip3 install google-auth"
RUN su -c "pip3 install google-auth-oauthlib"
RUN su -c "pip3 install google-pasta"
RUN su -c "pip3 install newspaper3k"

#Here you need to check
RUN su -c "pip3 install huggingface-hub"
RUN su -c "pip3 install idna"
RUN su -c "pip3 install importlib-metadata"
RUN su -c "pip3 install itsdangerous"
RUN su -c "pip3 install Jinja2"
RUN su -c "pip3 install joblib"
RUN su -c "pip3 install Keras-Preprocessing"
RUN su -c "pip3 install Markdown"
RUN su -c "pip3 install MarkupSafe"
RUN su -c "pip3 install oauthlib"
RUN su -c "pip3 install opt-einsum"
RUN su -c "pip3 install packaging"
RUN su -c "pip3 install protobuf"
RUN su -c "pip3 install pyasn1"
RUN su -c "pip3 install pyasn1-modules"
RUN su -c "pip3 install pyparsing"
RUN su -c "pip3 install PyYAML"
RUN su -c "pip3 install regex"
RUN su -c "pip3 install requests"
RUN su -c "pip3 install requests-oauthlib"
RUN su -c "pip3 install rsa"
RUN su -c "pip3 install sacremoses"
RUN su -c "pip3 install six"
RUN su -c "pip3 install tensorboard"
RUN su -c "pip3 install tensorboard-data-server"
RUN su -c "pip3 install tensorboard-plugin-wit"
RUN su -c "pip3 install https://github.com/mdsimmo/tensorflow-community-wheels/releases/download/1.12.0_cpu_py3_5_amd64/tensorflow-1.12.0-cp35-cp35m-linux_x86_64.whl"
RUN su -c "pip3 install tensorflow-estimator"
RUN su -c "pip3 install termcolor"
RUN su -c "pip3 install tqdm"
RUN su -c "pip3 install typing-extensions"
RUN su -c "pip3 install urllib3"
RUN su -c "pip3 install Werkzeug"
RUN su -c "pip3 install wrapt"
RUN su -c "pip3 install zipp"
RUN su -c "pip3 install fastapi"



RUN su -c "pip3 install numpy"
RUN su -c "pip3 install spacy"
RUN su -c "pip3 install nltk"
RUN su -c "pip3 install textblob"
RUN su -c "python3 -m nltk.downloader -d /usr/local/share/nltk_data punkt"
RUN su -c "python3 -m nltk.downloader -d /usr/local/share/nltk_data stopwords"
RUN su -c "python3 -m nltk.downloader -d /usr/local/share/nltk_data vader_lexicon"
RUN su -c "python3 -m spacy download en_core_web_md"
RUN su -c "python3 -m textblob.download_corpora"
# RUN pip install -r requirements.txt --default-timeout=28000
RUN su -c "python3 download-model.py"
EXPOSE 8000
# EXPOSE 7000
CMD ["hypercorn", "main:app", "-b", "0.0.0.0:8000", "--reload"]
# CMD ["hypercorn", "download-model:app", "-b", "0.0.0.0:7000", "--reload"]
