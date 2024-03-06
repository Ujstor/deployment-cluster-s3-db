# HA Hetzner infrastructure

![infra-diagram](public/01_infra-diagram.png)

## Teraform
```bash
terraform init --upgrade
terraform validate
terraform apply -auto-approve
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
```

## Ansible project structure:
```bash
ansible_project/
├── roles/
│   ├── common/
│   │   ├── tasks/
│   │   │   ├── main.yml
│   │   │   └── update_upgrade.yml
│   │   └── templates/
│   │       └── jail.local.j2
│   └── coolify/
│       ├── tasks/
│       │   └── main.yml
│       └── files/
│           └── install.sh
├── inventory/
│   └── hosts
├── playbooks/
│   ├── site.yml
│   └── install_coolify.yml
└── ansible.cfg
```