# Deploymet Cluster Infrastructure

![infra-diagram](public/01_infra-diagram.png)

## Prerequisites

Before you begin, ensure you have the following:

- [Hetzner](https://hetzner.cloud/?ref=Ix9xCKNxJriM) Cloud account
- [Terraform](https://www.terraform.io/downloads.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

### Generate Hetzner API Token

Create new project in Hetzner [console](https://console.hetzner.cloud/projects)

Obtain API token from Hetzner console that will be used by Terraform to interact with the platform.
Navigate to your project and click on SECURITY > API TOKENS > GENERATE API (give read/write access)

Paste API token in the `.auto.tfvars`. This will overwrite default values in `variables.tf` file.



**For configuration and deployment instructions, please refer to the [docs](https://ujstor.github.io/deployment-cluster-s3-db/)**

---

This is stil a work in progress!