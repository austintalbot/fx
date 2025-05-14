FROM golang:tip-alpine3.21 AS builder

WORKDIR /go

COPY . .
RUN apk update && apk add upx

RUN go mod download
RUN go build -o fx .
RUN upx --best fx

FROM scratch


COPY --from=builder /go/fx /bin/fx

WORKDIR /data

ENV COLORTERM=truecolor

ENTRYPOINT ["/bin/fx"]
