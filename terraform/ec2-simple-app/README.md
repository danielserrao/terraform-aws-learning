# Requirements

- You should have Terraform v1.3.6 or higher.
- You should have aws cli installed and login done.

# Command to test this simple example from the root of this repo

- aws sts get-caller-identity (Confirm which AWS account and AWS user you are currently using)
- terraform init (Initialize terraform which will create files in .terraform directory)
- terraform validate (Basic validation of the TF config)
- terraform plan (See what the current TF config intends to deploy before actually deploying)
- terraform apply -auto-approve (Deploy to AWS)
- ssh -i "<you-pem-file-path>" ubuntu@ec2-18-130-228-56.eu-west-2.compute.amazonaws.com (Connect to EC2 instance)
- terraform plan -destroy (Check what will be destroyed before actually destroying it)
- terraform destroy -auto-approve (Destroy what was deployed by TF)




# TODO

- Deploy simple web server into the EC2 instance and make a web page available through a static IP.

- Allow to deploy to different environments.

- Do similar example in a different folder using SSM instead of SSH.

- Add connectivity through LoadBalancer on the second example.