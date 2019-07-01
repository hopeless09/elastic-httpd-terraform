# elasticsearch-nginx

## Install Instructions 

1. Install Terraform 
https://www.terraform.io/downloads.html

2. Export the variables 

```
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-east-2"

```

3. Run terraform 

```
$ terraform init
$ terraform apply -auto-approve 
```

