ARG BUILDPLATFORM
FROM golang:tip-alpine3.21 AS builder

WORKDIR /app

RUN apk update && apk add upx

COPY fx fx
RUN upx --best fx

FROM scratch


COPY --from=builder /app/fx /bin/fx

WORKDIR /data

ENV COLORTERM=truecolor

ENTRYPOINT ["/bin/fx"]
