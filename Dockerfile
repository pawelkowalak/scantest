FROM golang:1.19-alpine3.15
WORKDIR /go/src/app
COPY . .
RUN go install -v ./cmd/hello/main.go

FROM alpine:3.15
RUN apk add --no-cache tzdata
WORKDIR /hello
COPY --from=0 /go/bin/main hello
CMD ["./hello"]
