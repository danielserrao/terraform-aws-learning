# Requirements

- You should have Terraform v1.3.6 or higher.
- You should have aws cli installed and login done.
- You should have a S3 bucket(s) created in your AWS account to store the terraform statefile and update the backend.hcl(s) accordingly.

# Command to test this simple example from the root of this repo

- aws sts get-caller-identity (Confirm which AWS account and AWS user you are currently using)
- terraform init -backend-config=environments/local/backend.hcl (Initialize terraform which will create files in .terraform directory)
- terraform validate (Basic validation of the TF config)
- terraform plan -var-file=environments/local/terraform.tfvars (See what the current TF config intends to deploy before actually deploying)
- terraform apply -var-file=environments/local/terraform.tfvars -auto-approve (Deploy to AWS)
- ssh -i "\<you-pem-file-path\>" ubuntu@ec2-18-130-228-56.eu-west-2.compute.amazonaws.com (Connect to EC2 instance)
- terraform plan -var-file=environments/local/terraform.tfvars -destroy (Check what will be destroyed before actually destroying it)
- terraform destroy -var-file=environments/local/terraform.tfvars -auto-approve (Destroy what was deployed by TF)

You should also update the `-backend-config` according to the environment to where you want to deploy. For example, you can deploy to development with the commands: 

- terraform init -backend-config=environments/development/backend.hcl -reconfigure
- terraform plan -var-file=environments/development/terraform.tfvars
- terraform apply -var-file=environments/development/terraform.tfvars -auto-approve


# TODO

* Deploy simple web server into the EC2 instance and make a web page available through a static IP.

* Allow to deploy to different environments. Set dynamic variables.
