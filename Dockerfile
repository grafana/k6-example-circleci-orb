FROM golang:1.17-alpine as builder
WORKDIR $GOPATH/src/go.k6.io/k6
ADD . .
RUN apk --no-cache add git
RUN go install go.k6.io/xk6/cmd/xk6@latest
RUN xk6 build --with github.com/mstoykov/xk6-counter --output /tmp/k6

FROM alpine:3.14
RUN apk add --no-cache ca-certificates && \
    adduser -D -u 12345 -g 12345 k6

WORKDIR /home/k6
COPY --from=builder /tmp/k6 /usr/bin/k6

USER 12345
ENTRYPOINT ["k6"]
