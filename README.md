# Hack and Heat 2024 - Terraform Workshop

Welcome to the workshop. If you haven't already followed the initial setup that was sent out by mail (due to unforeseen events or just laziness 🦥), please start with the below section PREPARATION. Otherwise you will find the tasks in the following sections. Happy hacking! 😄

- The structure of the project has already been created for you. Just work in the files provided in this repository. 
- There are helpful links in the files to pages containing information.
- When you need help, please inform your workshop presenter in the office.

## Preparation (skip, if already done when you received our welcome mail ✉️)
- 0.1 Create a HCP Terraform account under https://app.terraform.io/session.
- 0.2 Install the terraform CLI (installation guidance: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Task 1 - GCS - bucket.tf
- 1.1 Create a GCS Bucket
- 1.2 Create an IAM binding for the Bucket with the Role Storage Object User and yourself as the member
- 1.3 Destroy the bucket by either commenting out or deleting the code

## Task 2 - Terraform State - service_account.tf
- 2.1 Create a Service Account
- 2.2 Create a Service Account Key
- 2.3 Inspect the state file with the terraform cli

## Task 3 - Terraform Modules - ./module and main.tf
- 3.1 In the main.tf in the module folder create a disk
- 3.2 In the main.tf in the module folder create a VM and attach the disk
- 3.3. In the main.tf in the base folder use the module to create both resources
- 3.4 Define the self links to the resources in the outputs.tf file
  
## Task 4 - Terraform Remote State
- 4.1 Follow the TFE_SETUP.md and connect your repository to TFE
- 4.2 Inspect the state file remotely
- 4.3 Use the terraform CLI and inspect the state file again
  
## Task 5 - Data Sources - bucket.tf
- 5.1 Create a data source for a GCS Bucket and use following bucket: hack-and-heat-2024-task-5
- 5.2 Upload this file to the bucket with your name prefixed
