---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---
# Lab 14: Natural Language Processing

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Reinforcement learning at Wikipedia](https://en.wikipedia.org/wiki/Reinforcement_learning)
```

Natural Language Processing (NLP) is a field of artificial intelligence (AI) and computational linguistics that focuses on the interaction between computers and humans through natural language. Its primary goal is to enable computers to understand, interpret, and generate human language in a manner that is both meaningful and useful.

1. Tokenization: Breaking down text into individual words or tokens.
Part-of-speech tagging: Assigning grammatical categories (e.g., noun, verb, adjective) to words in a sentence.
2. Named entity recognition (NER): Identifying and classifying named entities (e.g., persons, organizations, locations) mentioned in text.
3. Parsing: Analyzing the grammatical structure of sentences.
4. Sentiment analysis: Determining the sentiment or opinion expressed in a piece of text.
5. Topic modeling: Identifying topics or themes present in a collection of documents.
6. Word embeddings: Representing words as dense vectors in a continuous vector space, capturing semantic relationships between words.
7. Machine translation: Translating text from one language to another.
8. Text summarization: Generating concise summaries of longer texts.
Question answering: Automatically answering questions posed in natural language based on a given text.


## Tolenization
Make sure you have NLTK installed (pip install nltk). Additionally, you may need to download the NLTK data by running:

```{code} python
import nltk
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
```

An example of Python code using the Natural Language Toolkit (NLTK) library for natural language processing (NLP). This code tokenizes a sentence and performs part-of-speech tagging.

```{code-cell}
import nltk
from nltk.tokenize import word_tokenize
from nltk.tag import pos_tag

# Sample sentence
sentence = "Natural language processing is a fascinating field of study."

# Tokenize the sentence
tokens = word_tokenize(sentence)

# Perform part-of-speech tagging
tagged_tokens = pos_tag(tokens)

# Print the tagged tokens
print(tagged_tokens)
```

Chinese text segmentation
```{code-cell}
import jieba
import jieba.analyse

jieba.enable_paddle() # 启动paddle模式。 0.40版之后开始支持，早期版本不支持
strs=["我来到北京清华大学","乒乓球拍卖完了","中国科学技术大学"]
for str in strs:
    seg_list = jieba.cut(str,use_paddle=True) # 使用paddle模式
    print("Paddle Mode: " + '/'.join(list(seg_list)))

seg_list = jieba.cut("我来到北京清华大学", cut_all=True)
print("Full Mode: " + "/ ".join(seg_list))  # 全模式

seg_list = jieba.cut("我来到北京清华大学", cut_all=False)
print("Default Mode: " + "/ ".join(seg_list))  # 精确模式

seg_list = jieba.cut("他来到了网易杭研大厦")  # 默认是精确模式
print(", ".join(seg_list))

seg_list = jieba.cut_for_search("小明硕士毕业于中国科学院计算所，后在日本京都大学深造")  # 搜索引擎模式
print(", ".join(seg_list))

#key words
jieba.analyse.extract_tags("小明硕士毕业于中国科学院计算所，后在日本京都大学深造", topK=20, withWeight=False, allowPOS=())

#word type
import jieba.posseg as pseg
words = pseg.cut("我爱北京天安门") #jieba默认模式
jieba.enable_paddle() #启动paddle模式。 0.40版之后开始支持，早期版本不支持
words = pseg.cut("我爱北京天安门",use_paddle=True) #paddle模式
for word, flag in words:
    print('%s %s' % (word, flag))
```

## Named entity recognition

```{code-cell}
import nltk
from nltk import word_tokenize, pos_tag, ne_chunk
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
nltk.download('maxent_ne_chunker')
nltk.download('words')

# Sample text
text = "Barack Obama was born in Hawaii. He served as the 44th President of the United States."

# Tokenize the text
tokens = word_tokenize(text)

# Perform part-of-speech tagging
tagged_tokens = pos_tag(tokens)

# Perform named entity recognition
named_entities = ne_chunk(tagged_tokens)

# Print the named entities
for entity in named_entities:
    if hasattr(entity, 'label'):
        print(entity.label(), ' '.join(word for word, tag in entity.leaves()))
```

## Analyzing the grammatical structure of sentences

We use NLTK to perform parsing and display the parse tree for the grammatical structure of the sentence and to provide output indicating the dependencies between words in the sentence.

```{code-cell}
import nltk
from nltk.tokenize import word_tokenize
from nltk.parse import CoreNLPParser

#download stanform model
nltk.download('stanford')

# Sample sentence
sentence = "The quick brown fox jumps over the lazy dog."

# Tokenize the sentence
tokens = word_tokenize(sentence)

# Initialize Stanford CoreNLP Parser (Ensure you have Stanford CoreNLP server running)
# parser = CoreNLPParser(url='http://localhost:9000')

# Parse the sentence
#parse_tree = next(parser.raw_parse(sentence))

# Display the parse tree
#print(parse_tree)
```

## Determining the sentiment or opinion expressed in a piece of text
```{code-cell}
import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer

nltk.download('vader_lexicon')

# Initialize VADER sentiment analyzer
sid = SentimentIntensityAnalyzer()

# Sample text
text = "I love this product! It's amazing."

# Analyze sentiment
sentiment_scores = sid.polarity_scores(text)

# Print sentiment scores
print(sentiment_scores)
```

## Word embedding
To generate word embeddings in Python, you can use libraries like Word2Vec, GloVe, or FastText. Here's an example using Gensim, a popular Python library for topic modeling, document indexing, and similarity retrieval with large corpora:

First, you need to install Gensim (pip install gensim). Then, you can use it to train your Word2Vec model or load a pre-trained one.

Here's how you can train a Word2Vec model using a sample corpus:

```{code-cell}
from gensim.models import Word2Vec
from nltk.tokenize import word_tokenize

# Sample corpus
corpus = [
    "This is a sample sentence.",
    "Another example sentence.",
    "Yet another sentence for demonstration."
]

# Tokenize the corpus
tokenized_corpus = [word_tokenize(sentence.lower()) for sentence in corpus]

# Train Word2Vec model
model = Word2Vec(sentences=tokenized_corpus, vector_size=100, window=5, min_count=1, workers=4)

# Save the model
model.save("word2vec.model")
```

You can then load the trained model and obtain word embeddings:

```{code-cell}
# Load the saved model
model = Word2Vec.load("word2vec.model")

# Get the embedding for a word
embedding = model.wv["sample"]
print("Embedding for 'sample':", embedding)

```

Alternatively, you can use a pre-trained Word2Vec model, such as Google's pre-trained Word2Vec model available through gensim.downloader. Here's how you can load and use it:

```{code}
import gensim.downloader as api

# Load pre-trained Word2Vec model
word2vec_model = api.load("word2vec-google-news-300")

# Get the embedding for a word
embedding = word2vec_model["sample"]
print("Embedding for 'sample':", embedding)
```

## Machine translation

## Text summarization


```{code-cell}
# importing libraries 
import nltk 
from nltk.corpus import stopwords 
from nltk.tokenize import word_tokenize, sent_tokenize 

#nltk.download('stopwords')

# Input text - to summarize 
text = """
There are many techniques available to generate extractive summarization to keep it simple, I will be using an unsupervised learning approach to find the sentences similarity and rank them. Summarization can be defined as a task of producing a concise and fluent summary while preserving key information and overall meaning. One benefit of this will be, you don’t need to train and build a model prior start using it for your project. It’s good to understand Cosine similarity to make the best use of the code you are going to see. Cosine similarity is a measure of similarity between two non-zero vectors of an inner product space that measures the cosine of the angle between them. Its measures cosine of the angle between vectors. The angle will be 0 if sentences are similar.
"""
   
# Tokenizing the text 
stopWords = set(stopwords.words("english")) 
words = word_tokenize(text) 
   
# Creating a frequency table to keep the  
# score of each word 
   
freqTable = dict() 
for word in words: 
    word = word.lower() 
    if word in stopWords: 
        continue
    if word in freqTable: 
        freqTable[word] += 1
    else: 
        freqTable[word] = 1
   
# Creating a dictionary to keep the score 
# of each sentence 
sentences = sent_tokenize(text) 
sentenceValue = dict() 
   
for sentence in sentences: 
    for word, freq in freqTable.items(): 
        if word in sentence.lower(): 
            if sentence in sentenceValue: 
                sentenceValue[sentence] += freq 
            else: 
                sentenceValue[sentence] = freq 
      
sumValues = 0
for sentence in sentenceValue: 
    sumValues += sentenceValue[sentence] 
   
# Average value of a sentence from the original text 
   
average = int(sumValues / len(sentenceValue)) 
   
# Storing sentences into our summary. 
summary = '' 
for sentence in sentences: 
    if (sentence in sentenceValue) and (sentenceValue[sentence] > (1.2 * average)): 
        summary += " " + sentence 
print(summary) 
```

```{code-cell}
from transformers import pipeline

summarizer = pipeline("summarization", model="facebook/bart-large-cnn")

article = """New York (CNN)When Liana Barrientos was 23 years old, she got married in Westchester County, New York.
A year later, she got married again in Westchester County, but to a different man and without divorcing her first husband.
Only 18 days after that marriage, she got hitched yet again. Then, Barrientos declared "I do" five more times, sometimes only within two weeks of each other.
In 2010, she married once more, this time in the Bronx. In an application for a marriage license, she stated it was her "first and only" marriage.
Barrientos, now 39, is facing two criminal counts of "offering a false instrument for filing in the first degree," referring to her false statements on the
2010 marriage license application, according to court documents.
Prosecutors said the marriages were part of an immigration scam.
On Friday, she pleaded not guilty at State Supreme Court in the Bronx, according to her attorney, Christopher Wright, who declined to comment further.
After leaving court, Barrientos was arrested and charged with theft of service and criminal trespass for allegedly sneaking into the New York subway through an emergency exit, said Detective
Annette Markowski, a police spokeswoman. In total, Barrientos has been married 10 times, with nine of her marriages occurring between 1999 and 2002.
All occurred either in Westchester County, Long Island, New Jersey or the Bronx. She is believed to still be married to four men, and at one time, she was married to eight men at once, prosecutors say.
Prosecutors said the immigration scam involved some of her husbands, who filed for permanent residence status shortly after the marriages.
Any divorces happened only after such filings were approved. It was unclear whether any of the men will be prosecuted.
The case was referred to the Bronx District Attorney\'s Office by Immigration and Customs Enforcement and the Department of Homeland Security\'s
Investigation Division. Seven of the men are from so-called "red-flagged" countries, including Egypt, Turkey, Georgia, Pakistan and Mali.
Her eighth husband, Rashid Rajput, was deported in 2006 to his native Pakistan after an investigation by the Joint Terrorism Task Force.
If convicted, Barrientos faces up to four years in prison.  Her next court appearance is scheduled for May 18."""

summary = summarizer(article, max_length=130, min_length=30)
print(summary)
```

```{code-cell}
from newspaper import Article
import spacy
from spacy.lang.en.stop_words import STOP_WORDS
from string import punctuation
from heapq import nlargest

url = 'http://fox13now.com/2013/12/30/new-year-new-laws-obamacare-pot-guns-and-drones/'
article = Article(url)
article.download()
article.parse()
article.text

def summarize(text, per):
    nlp = spacy.load('en_core_web_sm')
    doc= nlp(text)
    tokens=[token.text for token in doc]
    word_frequencies={}
    for word in doc:
        if word.text.lower() not in list(STOP_WORDS):
            if word.text.lower() not in punctuation:
                if word.text not in word_frequencies.keys():
                    word_frequencies[word.text] = 1
                else:
                    word_frequencies[word.text] += 1
    max_frequency=max(word_frequencies.values())
    for word in word_frequencies.keys():
        word_frequencies[word]=word_frequencies[word]/max_frequency
    sentence_tokens= [sent for sent in doc.sents]
    sentence_scores = {}
    for sent in sentence_tokens:
        for word in sent:
            if word.text.lower() in word_frequencies.keys():
                if sent not in sentence_scores.keys():                            
                    sentence_scores[sent]=word_frequencies[word.text.lower()]
                else:
                    sentence_scores[sent]+=word_frequencies[word.text.lower()]
    select_length=int(len(sentence_tokens)*per)
    summary=nlargest(select_length, sentence_scores,key=sentence_scores.get)
    final_summary=[word.text for word in summary]
    summary=''.join(final_summary)
    return summary

summarize(article.text, 0.05)
```

## Question answering

```{code-cell}
from transformers import pipeline

# Load the pre-trained question answering model
qa_pipeline = pipeline("question-answering")

# Context text
context = """
The quick brown fox jumps over the lazy dog. This is a simple example sentence used for demonstration purposes.
"""

# Ask a question related to the context
question = "What jumps over the lazy dog?"

# Perform question answering
answer = qa_pipeline(question=question, context=context)

# Print the answer
print("Answer:", answer['answer'])
```

