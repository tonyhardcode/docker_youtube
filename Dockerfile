FROM alpine:edge
RUN apk update
RUN apk add python bash git curl py-pip ffmpeg
RUN pip install --upgrade pip
RUN pip install --upgrade youtube-dl

ENV domain mysystem.org

ENTRYPOINT ["sh", "-c", "python Sublist3r/sublist3r.py -d ${domain}"]
