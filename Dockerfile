FROM golang:1.4-alpine AS builder

WORKDIR /app

COPY *.go .

RUN go build -o /app/fullcycle /app/fullcycle.go


FROM scratch

WORKDIR /app

COPY --from=builder /app .

CMD ["/app/fullcycle"]