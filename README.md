# Personal AWS Account
Terraform for setting up my personal AWS account. Notice that the terraform is creating it's own state
bucket and users/roles to administrate itself. To bootstrap this was done manually and then imported
into state. The amount of complexity in this setup is overkill for my actual personal use of AWS, but
it will allow for scale in the future and is a good way to test best practices.

## Organization
```
# Templates
terraform/provider/...
terraform/modules/provider/...

# AWS Provider
terraform/aws/region/service
terraform/aws/region/service/vpc
terraform/modules/aws/service/module_name
terraform/modules/aws/s3/generic_bucket
terraform/aws/global/iam
terraform/aws/us-east-2/kms
terraform/aws/us-east-2/ec2/main
```

## Constants Module
Holds static information that cannot be pulled from terraform.
Account ID is hardcoded here, depite being available in [terraform](https://www.terraform.io/docs/providers/aws/d/caller_identity.html)
because it safeguards applying against the wrong account.