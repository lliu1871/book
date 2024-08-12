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

# Lab 15: Natural language processing

## Text to speech

We use google API text-to-speech to convert text to speech. The user must already have a google account and configure the google cloud console => APIs and Services => **Enable API and Services** and **Credentials**.

### Python package - texttospeech
To use google text-to-speech API in python, we need to download and install the [google-cloud-sdk](https://cloud.google.com/sdk/docs/). We also need to install the following python packages. 

- pip install google-api-python-client
- pip install os

We first read the input text file in python.

```{code-cell}
f = open(file="./data/test.txt", encoding= "utf-8")
x = f.read()
print(x)
```

The text is converted to speech and saved in an audio file output.mp3.

```{code-cell}
from google.cloud import texttospeech

# Instantiates a client
client = texttospeech.TextToSpeechClient()

# Set the text input to be synthesized
synthesis_input = texttospeech.SynthesisInput(text=x)

# Build the voice request, select the language code ("en-US") and the ssml
# voice gender ("neutral")
voice = texttospeech.VoiceSelectionParams(
    language_code="cmn-CN", ssml_gender=texttospeech.SsmlVoiceGender.NEUTRAL
)

# Select the type of audio file you want returned
audio_config = texttospeech.AudioConfig(
    audio_encoding=texttospeech.AudioEncoding.MP3
)

# Perform the text-to-speech request on the text input with the selected
# voice parameters and audio file type
response = client.synthesize_speech(
    input=synthesis_input, voice=voice, audio_config=audio_config
)

# The response's audio_content is binary.
with open("output.mp3", "wb") as out:
    # Write the response to the output file.
    out.write(response.audio_content)

```

Click the audio player to listen to the speech.

<audio controls>
  <source src="_images/output.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio>

Alternatively, you may play the audio file in python.
```{code}
import os
os.system('start output.mp3')
```

### Python package - gTTS
The package gTTS is a wrapper of the google API text-to-speech to convert text to speech. The speech is at a slow rate.

- pip install gTTS

```{code-cell}
from gtts import gTTS

tts = gTTS(x, lang='zh-CN', slow=True)
tts.save('slow.mp3')
```

Click the audio player to listen to the slower speech.

<audio controls>
  <source src="_images/slow.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio>

```{code}
from playsound import playsound
import os

os.system('start hello.mp3')
playsound("hello.mp3")
```

### Python package - pyttsx3
The package pyttsx3 takes Microsoft speech utility to convert text to speech. Check setting -> Region and language -> Language and install the needed languages. By default, English has been installed. If you need to install other languages, please make to also add voices in the "Speech" section.

- pip insatall pyttsx3

```{code-cell}
import pyttsx3

audio = pyttsx3.init()  
voices = audio.getProperty('voices') 

for voice in voices:
    print("Voice:")
    print(" - ID: %s" % voice.id)
    print(" - Name: %s" % voice.name)
    print(" - Languages: %s" % voice.languages)
    print(" - Gender: %s" % voice.gender)
    print(" - Age: %s" % voice.age)


audio.setProperty('rate', 110)
audio.setProperty('volume', 0.8)
audio.setProperty('voice', voices[3].id)

#audio.say(x)
#audio.runAndWait()

audio.save_to_file(x, './_build/html/_images/pyttsx3.mp3')
audio.runAndWait()
```

Click the audio player to listen to the Taiwan accent speech.

<audio controls>
  <source src="_images/pyttsx3.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio>

## Speech to text
Convert an Audio file to transcript using a python package SpeechRecognition.

- pip install SpeechRecognition

```{code-cell}
import speech_recognition as sr

r = sr.Recognizer()

with sr.AudioFile('./text2speech/preamble.wav') as source:
    audio_text = r.listen(source)
    try:    
        # using google speech recognition
        text = r.recognize_google(audio_text)
        print('Converting audio transcripts into text ...')
        print(text)
    except:
         print('Sorry.. run again...')