FROM golang:1.17-alpine3.15 AS builder

WORKDIR /app
COPY message.go .
RUN go build message.go

# Base docker empty image
FROM scratch

WORKDIR /app
COPY --from=builder /app .

ENTRYPOINT ["./message"]