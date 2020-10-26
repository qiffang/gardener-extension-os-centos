############# builder
FROM golang:1.14.9 AS builder

WORKDIR /go/src/github.com/gardener/gardener-extension-os-centos
COPY . .
RUN make install-requirements && make generate && make install

############# gardener-extension-os-centos
FROM alpine:3.12.0 AS gardener-extension-os-centos

COPY --from=builder /go/bin/gardener-extension-os-centos /gardener-extension-os-centos
ENTRYPOINT ["/gardener-extension-os-centos"]
