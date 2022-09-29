FROM golang:1.19-alpine3.16 as builder

WORKDIR /desafio

COPY . .

RUN go build -o /rocks 

FROM hello-world

WORKDIR /desafio

COPY --from=builder /rocks /rocks

ENTRYPOINT [ "/rocks" ]