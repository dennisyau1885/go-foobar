# Build Stage
FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN go mod init main
RUN go mod download
#RUN gCGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o main
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" main

# Run stage
FROM scratch
COPY --from=builder /app/main .
CMD ["/main"]
