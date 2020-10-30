# Build customized CentOS VM image on Cloud

## GCP

1. Install Packer

```shell
brew install packer
```

2. Configure GCP credentials

```shell
gcloud auth application-default login
```

3. Build CentOS image on GCP

``` shell
packer build -var 'project=xxxx' gcp-centos.json
```
