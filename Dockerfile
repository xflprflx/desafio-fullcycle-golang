FROM golang:1.19 as go_program

WORKDIR /app

COPY . .

RUN go build -o /main main.go


FROM scratch

WORKDIR /

COPY --from=go_program /main /main

ENTRYPOINT ["/main"]