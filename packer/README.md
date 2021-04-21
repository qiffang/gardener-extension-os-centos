# Build customized CentOS VM image on Cloud

## Install Packer

```shell
brew install packer
```

## GCP

1. Configure GCP credentials

```shell
gcloud auth application-default login
```

2. Build CentOS image on GCP

``` shell
packer build -var 'project=xxxx' -var 'tag=v20201030' gcp-centos.json
```

## Aws
1. Configure AWS Profile

2. Build CentOS image on AWS

```shell
packer build -var 'profile=dev' -var 'vpc_region=us-west-2' -var 'instance_type=t2.medium' -var 'source_ami=ami-xxx' -var 'vpc_id=vpc-xxx' -var 'subnet_id=xxx' -var 'security_group_id=xxx' aws-centos.json
```

3. Copy AMI to regions

```shell
aws ec2 copy-image --source-image-id ami-xxx --source-region $sourceregion --name=centos-7-v20210420 --region=$targetregion
```

4. Share AMI

```shell
aws ec2 modify-image-attribute \
    --image-id ami-xxx \
    --launch-permission "Add=[{UserId=xxx}]"
```
