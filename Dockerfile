##### Stage 1 #####

FROM golang:1.17 as builder

WORKDIR /usr/src/app

COPY main.go .

RUN go build -ldflags "-s -w" main.go

##### Stage 2 #####

FROM scratch

WORKDIR /usr/src/app

### Copy built binary application from 'builder' image
COPY --from=builder /usr/src/app/main .

CMD ["./main"]