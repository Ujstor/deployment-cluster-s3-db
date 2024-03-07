# HA Hetzner infrastructure

![infra-diagram](public/01_infra-diagram.png)

## Teraform
```bash
terraform init --upgrade
terraform validate
terraform apply -auto-approve
```

```bash
terraform-hetzner/
├── load_balancer.tf
├── main.tf
├── network.tf
├── output.tf
├── provider.tf
├── ssh.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf
```

## Ansible
```
ansible all -m ping
```

[Posix](https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html) module for Adds or removes an SSH authorized key

```bash
ansible-galaxy collection install ansible.posix
```

```yml
tasks:
    - name: Install public AuthorizedKeysFile
      ansible.posix.authorized_key:
        user: root
        state: present
        key: "{{ lookup('file', '~/.ssh/hetzner_key.pub') }}"
```


```bash
ansible-playbook playbooks/playbook_install_coolify.yml

ansible-playbook your_playbook.yml --start-at-task="Ensure PostgreSQL users are present."
```

## Ansible project structure:
```bash
ansible/
├── inventory/
│   └── hosts
├── playbooks/
│   ├── roles/
│   │   ├── common/
│   │   │   ├── tasks/
│   │   │   │   └── main.yml
│   │   │   └── templates/
│   │   │       └── jail.local.j2
│   │   ├── coolify/
│   │   │   └── tasks/
│   │   │       └── main.yml
│   │   └── traefik/
│   │       └── tasks/
│   │           └── main.yml
│   ├── playbook_init_server_config.yml
│   └── playbook_install_coolify.yml
├── ansible.cfg
├── requirements.yml
```

##  PostgreSQL

To install:

```
ansible-galaxy install anxs.postgresql
```

#### Example Playbook

An example how to include this role:

```yml
---
- hosts: postgresql-server
  roles:
    - role: postgresql
      become: yes
```

An example how to include this role as a task:

```yml
---
hosts: db
  become: yes
  vars:
    postgresql_version: 16
    postgresql_listen_addresses: "*"

    postgresql_databases:
      - name: blueprint
        owner: ujstor
        state: "present"      

    postgresql_users:
      - name: ujstor
        pass: password1234
        encrypted: yes
        state: "present"

    postgresql_database_schemas:
      - database: blueprint
        schema: ujstor-test
        state: present

    postgresql_user_privileges:
      - name: ujstor
        db: blueprint
        role_attr_flags: "CREATEDB"

  roles:
    - role: common
    - role: postgresql
```

#### Variables

```yaml
# Basic settings
postgresql_version: 16
postgresql_encoding: "UTF-8"
postgresql_locale: "en_US.UTF-8"
postgresql_ctype: "en_US.UTF-8"

postgresql_admin_user: "postgres"
postgresql_default_auth_method: "peer"

postgresql_cluster_name: main
postgresql_cluster_reset: false

# List of databases to be created (optional)
# Note: for more flexibility with extensions use the postgresql_database_extensions setting.
postgresql_databases:
  - name: foobar
    owner: baz          # optional; specify the owner of the database
    hstore: yes         # flag to install the hstore extension on this database (yes/no)
    uuid_ossp: yes      # flag to install the uuid-ossp extension on this database (yes/no)
    citext: yes         # flag to install the citext extension on this database (yes/no)
    encoding: "UTF-8"   # override global {{ postgresql_encoding }} variable per database
    state: "present"    # optional; one of 'present', 'absent', 'dump', 'restore'
    lc_collate: "en_GB.UTF-8"   # override global {{ postgresql_locale }} variable per database
    lc_ctype: "en_GB.UTF-8"     # override global {{ postgresql_ctype }} variable per database

# List of database extensions to be created (optional)
postgresql_database_extensions:
  - db: foobar
    extensions:
      - hstore
      - citext

# List of users to be created (optional)
postgresql_users:
  - name: baz
    pass: pass
    encrypted: yes  # if password should be encrypted, postgresql >= 10 does only accepts encrypted passwords
    state: "present"    # optional; one of 'present', 'absent'

# List of schemas to be created (optional)
postgresql_database_schemas:
  - database: foobar           # database name
    schema: acme               # schema name
    state: present

  - database: foobar           # database name
    schema: acme_baz           # schema name
    owner: baz                 # owner name
    state: present

# List of user privileges to be applied (optional)
postgresql_user_privileges:
  - name: baz                   # user name
    db: foobar                  # database
    priv: "ALL"                 # privilege string format: example: INSERT,UPDATE/table:SELECT/anothertable:ALL
    role_attr_flags: "CREATEDB" # role attribute flags
```

There's a lot more knobs and bolts to set, which you can find in the [defaults/main.yml](./defaults/main.yml)