FROM golang:1.20.3-alpine3.17
WORKDIR /go/src/app
COPY . .
RUN go install -v ./cmd/hello/main.go

FROM alpine:3.17
RUN apk add --no-cache tzdata
WORKDIR /hello
COPY --from=0 /go/bin/main hello
CMD ["./hello"]
