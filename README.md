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

The state of the used roles:

|Role name|GitHub Action|GitLab CI|Version|
|---------|-------------|---------|-------|
|[aide](https://galaxy.ansible.com/robertdebock/aide)|[![github](https://github.com/robertdebock/ansible-role-aide/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-aide/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-aide/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-aide)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-aide/latest.svg)](https://github.com/robertdebock/ansible-role-aide/releases)|
|[auto_update](https://galaxy.ansible.com/robertdebock/auto_update)|[![github](https://github.com/robertdebock/ansible-role-auto_update/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-auto_update/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-auto_update/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-auto_update)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-auto_update/latest.svg)](https://github.com/robertdebock/ansible-role-auto_update/releases)|
|[bootstrap](https://galaxy.ansible.com/robertdebock/bootstrap)|[![github](https://github.com/robertdebock/ansible-role-bootstrap/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-bootstrap/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-bootstrap/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-bootstrap)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-bootstrap/latest.svg)](https://github.com/robertdebock/ansible-role-bootstrap/releases)|
|[buildtools](https://galaxy.ansible.com/robertdebock/buildtools)|[![github](https://github.com/robertdebock/ansible-role-buildtools/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-buildtools/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-buildtools/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-buildtools)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-buildtools/latest.svg)](https://github.com/robertdebock/ansible-role-buildtools/releases)|
|[certbot](https://galaxy.ansible.com/robertdebock/certbot)|[![github](https://github.com/robertdebock/ansible-role-certbot/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-certbot/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-certbot/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-certbot)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-certbot/latest.svg)](https://github.com/robertdebock/ansible-role-certbot/releases)|
|[common](https://galaxy.ansible.com/robertdebock/common)|[![github](https://github.com/robertdebock/ansible-role-common/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-common/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-common/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-common)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-common/latest.svg)](https://github.com/robertdebock/ansible-role-common/releases)|
|[core_dependencies](https://galaxy.ansible.com/robertdebock/core_dependencies)|[![github](https://github.com/robertdebock/ansible-role-core_dependencies/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-core_dependencies/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-core_dependencies/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-core_dependencies)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-core_dependencies/latest.svg)](https://github.com/robertdebock/ansible-role-core_dependencies/releases)|
|[digitalocean-agent](https://galaxy.ansible.com/robertdebock/digitalocean-agent)|[![github](https://github.com/robertdebock/ansible-role-digitalocean-agent/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-digitalocean-agent/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-digitalocean-agent/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-digitalocean-agent)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-digitalocean-agent/latest.svg)](https://github.com/robertdebock/ansible-role-digitalocean-agent/releases)|
|[epel](https://galaxy.ansible.com/robertdebock/epel)|[![github](https://github.com/robertdebock/ansible-role-epel/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-epel/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-epel/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-epel)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-epel/latest.svg)](https://github.com/robertdebock/ansible-role-epel/releases)|
|[fail2ban](https://galaxy.ansible.com/robertdebock/fail2ban)|[![github](https://github.com/robertdebock/ansible-role-fail2ban/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-fail2ban/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-fail2ban/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-fail2ban)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-fail2ban/latest.svg)](https://github.com/robertdebock/ansible-role-fail2ban/releases)|
|[firewall](https://galaxy.ansible.com/robertdebock/firewall)|[![github](https://github.com/robertdebock/ansible-role-firewall/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-firewall/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-firewall/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-firewall)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-firewall/latest.svg)](https://github.com/robertdebock/ansible-role-firewall/releases)|
|[httpd](https://galaxy.ansible.com/robertdebock/httpd)|[![github](https://github.com/robertdebock/ansible-role-httpd/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-httpd/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-httpd/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-httpd)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-httpd/latest.svg)](https://github.com/robertdebock/ansible-role-httpd/releases)|
|[logwatch](https://galaxy.ansible.com/robertdebock/logwatch)|[![github](https://github.com/robertdebock/ansible-role-logwatch/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-logwatch/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-logwatch/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-logwatch)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-logwatch/latest.svg)](https://github.com/robertdebock/ansible-role-logwatch/releases)|
|[maintenance](https://galaxy.ansible.com/robertdebock/maintenance)|[![github](https://github.com/robertdebock/ansible-role-maintenance/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-maintenance/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-maintenance/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-maintenance)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-maintenance/latest.svg)](https://github.com/robertdebock/ansible-role-maintenance/releases)|
|[mysql](https://galaxy.ansible.com/robertdebock/mysql)|[![github](https://github.com/robertdebock/ansible-role-mysql/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-mysql/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-mysql/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-mysql)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-mysql/latest.svg)](https://github.com/robertdebock/ansible-role-mysql/releases)|
|[openssl](https://galaxy.ansible.com/robertdebock/openssl)|[![github](https://github.com/robertdebock/ansible-role-openssl/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-openssl/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-openssl/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-openssl)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-openssl/latest.svg)](https://github.com/robertdebock/ansible-role-openssl/releases)|
|[php](https://galaxy.ansible.com/robertdebock/php)|[![github](https://github.com/robertdebock/ansible-role-php/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-php/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-php/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-php)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-php/latest.svg)](https://github.com/robertdebock/ansible-role-php/releases)|
|[postfix](https://galaxy.ansible.com/robertdebock/postfix)|[![github](https://github.com/robertdebock/ansible-role-postfix/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-postfix/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-postfix/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-postfix)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-postfix/latest.svg)](https://github.com/robertdebock/ansible-role-postfix/releases)|
|[python_pip](https://galaxy.ansible.com/robertdebock/bootstrap)|[![github](https://github.com/robertdebock/ansible-role-bootstrap/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-python_pip/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-python_pip/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-python_pip)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-python_pip/latest.svg)](https://github.com/robertdebock/ansible-role-python_pip/releases)|
|[rsyslog](https://galaxy.ansible.com/robertdebock/rsyslog)|[![github](https://github.com/robertdebock/ansible-role-rsyslog/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-rsyslog/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-rsyslog/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-rsyslog)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-rsyslog/latest.svg)](https://github.com/robertdebock/ansible-role-rsyslog/releases)|
|[software](https://galaxy.ansible.com/robertdebock/software)|[![github](https://github.com/robertdebock/ansible-role-software/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-software/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-software/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-software)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-software/latest.svg)](https://github.com/robertdebock/ansible-role-software/releases)|
|[unowned_files](https://galaxy.ansible.com/robertdebock/unowned_files)|[![github](https://github.com/robertdebock/ansible-role-unowned_files/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-unowned_files/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-unowned_files/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-unowned_files)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-unowned_files/latest.svg)](https://github.com/robertdebock/ansible-role-unowned_files/releases)|
|[update](https://galaxy.ansible.com/robertdebock/update)|[![github](https://github.com/robertdebock/ansible-role-update/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-update/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-update/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-update)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-update/latest.svg)](https://github.com/robertdebock/ansible-role-update/releases)|
|[zabbix_agent](https://galaxy.ansible.com/robertdebock/zabbix_agent)|[![github](https://github.com/robertdebock/ansible-role-zabbix_agent/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-zabbix_agent/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-zabbix_agent/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-zabbix_agent)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-zabbix_agent/latest.svg)](https://github.com/robertdebock/ansible-role-zabbix_agent/releases)|
|[zabbix_repository](https://galaxy.ansible.com/robertdebock/zabbix_repository)|[![github](https://github.com/robertdebock/ansible-role-zabbix_repository/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-zabbix_repository/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-zabbix_repository/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-zabbix_repository)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-zabbix_repository/latest.svg)](https://github.com/robertdebock/ansible-role-zabbix_repository/releases)|
|[zabbix_server](https://galaxy.ansible.com/robertdebock/zabbix_server)|[![github](https://github.com/robertdebock/ansible-role-zabbix_server/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-zabbix_server/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-zabbix_server/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-zabbix_server)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-zabbix_server/latest.svg)](https://github.com/robertdebock/ansible-role-zabbix_server/releases)|
|[zabbix_web](https://galaxy.ansible.com/robertdebock/zabbix_web)|[![github](https://github.com/robertdebock/ansible-role-zabbix_web/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-zabbix_web/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-zabbix_web/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-zabbix_web)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-zabbix_web/latest.svg)](https://github.com/robertdebock/ansible-role-zabbix_web/releases)|

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
