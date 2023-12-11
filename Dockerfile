FROM golang:latest

LABEL maintainer="shehabalhayee82@gmial.com"

ENV DEBIAN_FRONTEND=non-interactive

RUN apt-get update && apt-get install -y curl jq git cmake g++

RUN git clone https://github.com/blechschmidt/massdns.git \
    && cd massdns \ 
    && make \
    && make install 

RUN go install github.com/d3mondev/puredns/v2@latest

WORKDIR /app

COPY . .

RUN chmod +x ./command.sh

CMD []

ENTRYPOINT ["./command.sh"]

