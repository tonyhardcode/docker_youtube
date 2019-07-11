#A simple dockerfile for downloading from youtube and convert mp3
FROM alpine:edge
MAINTAINER Serdar.Sarioglu@mysystem.org

RUN apk update
RUN apk add python bash git curl py-pip ffmpeg
RUN pip install --upgrade pip
RUN pip install --upgrade youtube-dl
RUN mkdir -p download

ARG youtube
ENV youtube=${youtube}

ENTRYPOINT ["sh", "-c", "cd download && youtube-dl --verbose --ignore-errors --no-continue --no-overwrites --no-post-overwrites --write-annotations --write-thumbnail --output '%(id)s.%(ext)s' -- ${youtube}"]
