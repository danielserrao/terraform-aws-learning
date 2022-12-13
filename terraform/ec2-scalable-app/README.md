# Requirements

- You should have Terraform v1.3.6 or higher.
- You should have aws cli installed and login done.

# Command to test this simple example from the root of this repo

- aws sts get-caller-identity (Confirm which AWS account and AWS user you are currently using)
- terraform init (Initialize terraform which will create files in .terraform directory)
- terraform validate (Basic validation of the TF config)
- terraform plan (See what the current TF config intends to deploy before actually deploying)
- terraform apply -auto-approve (Deploy to AWS)
- terraform plan -destroy (Check what will be destroyed before actually destroying it)
- terraform destroy -auto-approve (Destroy what was deployed by TF)


# TODO

- Create Security Group via TF to allow SSH and put this example in a separate folder.

- Do similar example in a different folder using SSM instead of SSH.

- Add connectivity through LoadBalancer on the second example.
