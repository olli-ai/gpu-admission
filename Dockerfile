FROM golang:1.13-alpine as build-stage

WORKSPACE /build

COPY go.mod go.sum ./
RUN go mod download

COPY main.go ./
COPY pkg ./pkg
RUN go build -o gpu-admission

FROM golang:1.13-alpine as production-stage

COPY --from=build-stage /build/gpu-admission /gpu-admission
