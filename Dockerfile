#A simple dockerfile for downloading from youtube and convert mp3
FROM alpine:edge
MAINTAINER Serdar.Sarioglu@mysystem.org

RUN apk update
RUN apk add python bash git curl py-pip ffmpeg
RUN pip install --upgrade pip
RUN pip install --upgrade youtube-dl

ENV youtube https://youtu.be/z5GTScs8Jos

ENTRYPOINT ["sh", "-c", "youtube-dl  -i  --extract-audio --audio-format mp3 --output '%(title)s.%(ext)s' ${youtube}"]
