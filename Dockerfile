FROM alpine:latest as buildier

RUN apk update && apk add git gcc musl-dev
WORKDIR /app
RUN git clone https://github.com/Privanom/algorithms
#RUN ls -l algorithms > fldr.txt
RUN gcc algorithms/fac.c -o algorithms/fac.o


FROM alpine:latest

RUN apk update && apk add musl-dev
COPY --from=buildier /app/algorithms/fac.o /fac.o
