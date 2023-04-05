on:
 - push

env: 
  AWS_ACCESS_KEY_ID: ${{secrets.ACCESS_KEY }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

jobs:
  Terraform-workflow:
    runs-on: ubuntu-latest
    steps:
       - name: Checkout
         uses: actions/checkout@v1
       - name: Setup Terraform
         uses: hashicorp/setup-terraform@v2
         with:
            terraform_version: 1.1.9
       - name: Terraform init
         run: terraform init
       - name: Terraform Validate
         run: terraform validate
       - name: Terraform Plan
         run: terraform plan
       - name: Terraform Apply
         run: terraform apply --auto-aprove 
       - name: Terraform Destroy
         run: terraform destroy --auto-aprove 
