FROM python:2

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install pymorphy2==0.8

RUN python -m nltk.downloader "averaged_perceptron_tagger"; python
RUN python -m nltk.downloader "averaged_perceptron_tagger_ru"; python
RUN python -m nltk.downloader "punkt"; python
RUN python -m nltk.downloader "stopwords"; python
RUN python -m nltk.downloader "wordnet"; python
RUN python -m spacy download en; python
RUN python -m spacy download xx; python
RUN git clone https://github.com/buriy/spacy-ru.git
RUN cp -r ./spacy-ru/ru2/. ./ru2

EXPOSE 8080

COPY . .

CMD ["make","run_docker"]