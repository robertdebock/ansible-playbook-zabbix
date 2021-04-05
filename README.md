# Ansible playbook for Zabbix

## Overview

```
+--- floating ip ---+
|                   |
+-------------------+
          |
          V
+--- zabbix_web ---+    +--- zabbix_server ---+
| - :80/tcp        | -> | - :10050/tcp        |
| - :443/tcp       |    | - :10051/tcp        |
| - :10051/tcp     |    |                     |
+------------------+    +---------------------+
             |                |
             V                V
           +--- mysql_server ---+
           | - :3306/tcp        |
           | - :10051/tcp       |
           +--------------------+
```

## Setup

1. Download the Ansible roles:

```shell
ansible-galaxy install -r roles/requirements.yml
```

2. Download the terraform providers and modules:

```shell
cd terraform
terraform init
```

3. Set the DigitalOcean and CloudFlare credentials:

```shell
export TF_VAR_do_token="REPLACE_ME_WITH_THE_DO_TOKEN"
export TF_VAR_cloudflare_api_token="REPLACE_ME_WITH_THE_CF_TOKEN"
```

## Installation

Apply the playbook:
```
./playbook.yml
```

This will:

1. Create the infrastructure using Terraform.
2. Install Docker. (Including all requirements.)
3. Create the `rancher/rancher` container.

Finally, login. (URL displayed at the end of the play.)

### Files

```
.
├── ansible.cfg - To tell Ansible how to work.
├── playbook.yml - The playbook to run.
├── group_vars - Variables used by Ansible.
├── roles - Where roles will be stored.
│   └── requirements.yml - What roles to download.
└── terraform - A description of the infrastrucure.
```
