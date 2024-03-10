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
└── playbooks/
    ├── roles/
    │   ├── common/
    │   ├── coolify/
    │   ├── minio/
    │   ├── nginx/
    │   └── postgresql/
    ├── unique_templates_config/
    │   ├── coolify_lb/
    │   ├── minio_lb/
    │   ├── scripts/
    │   ├── playbook_dns_backup_lb.yml
    │   └── playbook_install_python.yml
    ├── playbook_install_coolify.yml
    ├── playbook_minio.yml
    ├── playbook_nginx_coolify_lb.yml
    ├── playbook_nginx_minio_lb.yml
    └── playbook_psql.yml
├── ansible.cfg
└── requirements.yml

```

## PostgreSQL

To install:

```
ansible-galaxy install anxs.postgresql
```

#### Example Playbook

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
        role_attr_flags: "SUPERUSER"

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
    owner: baz # optional; specify the owner of the database
    hstore: yes # flag to install the hstore extension on this database (yes/no)
    uuid_ossp: yes # flag to install the uuid-ossp extension on this database (yes/no)
    citext: yes # flag to install the citext extension on this database (yes/no)
    encoding: "UTF-8" # override global {{ postgresql_encoding }} variable per database
    state: "present" # optional; one of 'present', 'absent', 'dump', 'restore'
    lc_collate: "en_GB.UTF-8" # override global {{ postgresql_locale }} variable per database
    lc_ctype: "en_GB.UTF-8" # override global {{ postgresql_ctype }} variable per database

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
    encrypted: yes # if password should be encrypted, postgresql >= 10 does only accepts encrypted passwords
    state: "present" # optional; one of 'present', 'absent'

# List of schemas to be created (optional)
postgresql_database_schemas:
  - database: foobar # database name
    schema: acme # schema name
    state: present

  - database: foobar # database name
    schema: acme_baz # schema name
    owner: baz # owner name
    state: present

# List of user privileges to be applied (optional)
postgresql_user_privileges:
  - name: baz # user name
    db: foobar # database
    priv: "ALL" # privilege string format: example: INSERT,UPDATE/table:SELECT/anothertable:ALL
    role_attr_flags: "CREATEDB" # role attribute flags
```

There's a lot more options to set, which you can find in the [defaults/main.yml](./defaults/main.yml)

## MinIO

Available variables are listed below along with default values (see `defaults\main.yaml`)

- Wheter to install or not minio server and minio client

  ```yml
  minio_install_server: true
  minio_install_client: true
  ```
- Minio server installation details

  Minio UNIX user/group
  ```yml
  minio_group: minio
  minio_user: minio
  ```
  Minio installation directories to place server configuration (`minio_etc_dir`), TLS certificates (`minio_cert_dir`) and user access policies (`minio_policy_dir`)
  ```yml
  minio_etc_dir: /etc/minio
  minio_cert_dir: "{{ minio_etc_dir }}/ssl"
  minio_policy_dir: "{{ minio_etc_dir }}/policy"
  ```
  Minio server IP address (`minio_server_address`), if empty server listen in all available IP addresses, and server/console listening ports (`minio_server_port` and `minio_console_port`)
  ```yml
  minio_server_port: "9091"
  minio_server_addr: ""
  minio_console_port: "9092"
  ```
  
  Minio admin user and password
  ```yml
  minio_root_user: ""
  minio_root_password: ""
  ```

  Minio site region
  ```yml
  minio_site_region: "eu-west-1"
  ```
  
  Minio data directories (`minio_server_datadirs`) and whether force the creation in case they do not exist (`minio_server_make_datadirs`)
  
  ```yml
  minio_server_make_datadirs: true
  minio_server_datadirs:
    - /var/lib/minio
  ```

  ```yaml
  minio_server_cluster_nodes: []
  ```

  Set a list of nodes to create a [distributed cluster (Multi-Node Multi-Drive deployment)](https://min.io/docs/minio/linux/operations/install-deploy-manage/deploy-minio-multi-node-multi-drive.html).

  In this mode, ansible will create your server datadirs (`minio_serverdata_dirs`), but use this list (`minio_server_cluster_nodes`) for the server startup.

  > Multi-drive configuration requires datadirs on separate disks to satisfy Minio's distributed storage requirements.

  See recommendations for using, same configuration in all nodes, sequential hostnames and local-atached storage with sequential mounts in the documentation (https://min.io/docs/minio/linux/operations/install-deploy-manage/deploy-minio-multi-node-multi-drive.html)

  Example:

  ```yaml
  minio_server_datadirs:
    - '/mnt/disk1/minio'
    - '/mnt/disk2/minio'
    - '/mnt/disk3/minio'
    - '/mnt/disk4/minio'
  minio_server_cluster_nodes:
    - 'https://minio{1...4}.example.net:9091/mnt/disk{1...4}/minio'
  ```

- Minio client configuration
  
  Connection alias name `minio_alias` and whether validate or not SSL certificates (`minio_validate_certificates`)
  
  ```yml
  minio_validate_certificate: true
  minio_alias: "myminio"
  ```

- Configuration of TLS

  To enable configuration of TLS set `minio_enable_tls` to true and provide the private key and public certificate as content loaded into `minio_key` and `minio_cert` variables.

  They can be loaded from files using an ansible task like:

  ```yml
  - name: Load tls key and cert from files
  set_fact:
    minio_key: "{{ lookup('file','certificates/{{ inventory_hostname }}_private.key') }}"
    minio_cert: "{{ lookup('file','certificates/{{ inventory_hostname }}_public.crt') }}"

  ```

  `minio_url` might be needed in case MinIO Server TLS certificates do not contain any IP Subject Alternative Names (SAN). See [MINIO_SERVER_URL environment variable definition](https://min.io/docs/minio/linux/reference/minio-server/minio-server.html#envvar.MINIO_SERVER_URL).

  ```yml
  minio_url: "https://minio.ricsanfre.com:{{ minio_server_port }}"
  ```


- Buckets to be created
  
  Variable `minio_buckets` create the list of provided buckets, and applying a specifc policy. For creating the buckets, a modified version of Ansible Module from Alexis Facques is used (https://github.com/alexisfacques/ansible-module-s3-minio-bucket)
  
  ```yml
  minio_buckets:
    - name: bucket1
      policy: read-only
    - name: bucket2
      policy: read-write
    - name: bucket3
      policy: private
  ```
  > NOTE The module use remote connection to Minio Server using Python API (`minio` python package). Role ensure that PIP is installed and install `minio` package.

  During bucket creation three types of policy can be specified: `private`, `read-only` or `read-write` buckets.

- Users to be created and buckets ACLs

  Users can be automatically created using  `minio_users` variable: a list of users can be provided, each user with three variables `name` (user name), `password` (user password) and `buckets_acl` list of buckets and type of access granted to each bucket (read-only or read-write).
  The role automatically create policy json files containing the user policy statements and load them into the server.

  Predefined `read-only` and `read-write` policies, containing pre-defined access statements, can be used. Custom policies can be also defined using  `custom` policy. In this case list of access statements need to be provided.


  ```yml
  minio_users:
  - name: user1
    password: supers1cret0
    buckets_acl:
      - name: bucket1
        policy: read-write
      - name: bucket2
        policy: read-only
      - name: bucket3
        policy: custom
        custom:
          - rule: |
              "Effect": "Allow",
              "Action": [
                  "s3:GetObject",
                  "s3:DeleteObject",
                  "s3:PutObject",
                  "s3:AbortMultipartUpload",
                  "s3:ListMultipartUploadParts"
              ],
              "Resource": [
                  "arn:aws:s3:::bucket3/*"
              ]
          - rule: |
              "Effect": "Allow",
              "Action": [
                  "s3:ListBucket"
              ],
              "Resource": [
                  "arn:aws:s3:::bucket3"
              ]
  ```
 The previous configuration will create the following policy.json file for the user

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::bucket1",
                "arn:aws:s3:::bucket1/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::bucket2",
                "arn:aws:s3:::bucket2/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:AbortMultipartUpload",
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:ListMultipartUploadParts",
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::bucket3/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::bucket3"
            ]
        }
    ]
}
```

- Generate Prometheus bearer token

  ```yml
  minio_prometheus_bearer_token: false
  prometheus_bearer_token_output: "{{ minio_etc_dir }}/prometheus_bearer.json"
  ```
  
  Setting `minio_prometheus_bearer_token` to true, generates a file `/etc/minio/prometheus_bearer.json` which contains the result of executing the command:

  `mc admin prometheus generate myminio -json`



Example Playbook
----------------

The following playbook install and configure minio server and client, enabling TLS and generating self-signed SSL certificates.
It also create some buckets and users with proper ACLs

```yml
---
- name: Install and configure Minio Server
  hosts: minio
  become: true
  gather_facts: true
  vars:
    server_hostname: minio.example.com
    ssl_key_size: 4096
    ssl_certificate_provider: selfsigned

  pre_tasks:
    - name: Generate self-signed SSL certificates for minio
      include_tasks: generate_selfsigned_cert.yml
      args:
        apply:
          delegate_to: localhost
          become: false
    - name: Load tls key and cert
      set_fact:
        minio_key: "{{ lookup('file','certificates/' + inventory_hostname + '_private.key') }}"
        minio_cert: "{{ lookup('file','certificates/' + inventory_hostname + '_public.crt') }}"

  roles:
    - role: ricsanfre.minio
      minio_root_user: "miniadmin"
      minio_root_password: "supers1cret0"
      minio_enable_tls: true
      minio_url: "https://{{ server_hostname }}:{{ minio_server_port }}"
      minio_buckets:
        - name: bucket1
          policy: read-write
        - name: bucket2
          policy: read-write
      minio_users:
        - name: user1
          password: supers1cret0
          buckets_acl:
            - name: bucket1
              policy: read-write
            - name: bucket2
              policy: read-only

```

`pre-tasks` section include tasks to generate a private key and a self-signed certificate and load them into `minio_key` and `minio_cert` variables.

Where `generate_selfsigned_cert.yml` contain the tasks for generating a Private Key and SSL self-signed certificate:

```yml
---
- name: Create private certificate
  openssl_privatekey:
    path: "certificates/{{ inventory_hostname }}_private.key"
    size: "{{ ssl_key_size | int }}"
    mode: 0644

- name: Create CSR
  openssl_csr:
    path: "certificates/{{ inventory_hostname }}_cert.csr"
    privatekey_path: "certificates/{{ inventory_hostname }}_private.key"
    common_name: "{{ server_hostname }}"

- name: Create certificates for keystore
  openssl_certificate:
    csr_path: "certificates/{{ inventory_hostname }}_cert.csr"
    path: "certificates/{{ inventory_hostname }}_public.crt"
    privatekey_path: "certificates/{{ inventory_hostname }}_private.key"
    provider: "{{ ssl_certificate_provider }}"

```


## NGINX

Available variables are listed below, along with default values (see `defaults/main.yml`):


    nginx_listen_ipv6: true

Whether or not to listen on IPv6 (applied to all vhosts managed by this role).

    nginx_vhosts: []

A list of vhost definitions (server blocks) for Nginx virtual hosts. Each entry will create a separate config file named by `server_name`. If left empty, you will need to supply your own virtual host configuration. See the commented example in `defaults/main.yml` for available server options. If you have a large number of customizations required for your server definition(s), you're likely better off managing the vhost configuration file yourself, leaving this variable set to `[]`.

    nginx_vhosts:
      - listen: "443 ssl http2"
        server_name: "example.com"
        server_name_redirect: "www.example.com"
        root: "/var/www/example.com"
        index: "index.php index.html index.htm"
        error_page: ""
        access_log: ""
        error_log: ""
        state: "present"
        template: "{{ nginx_vhost_template }}"
        filename: "example.com.conf"
        extra_parameters: |
          location ~ \.php$ {
              fastcgi_split_path_info ^(.+\.php)(/.+)$;
              fastcgi_pass unix:/var/run/php5-fpm.sock;
              fastcgi_index index.php;
              fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
              include fastcgi_params;
          }
          ssl_certificate     /etc/ssl/certs/ssl-cert-snakeoil.pem;
          ssl_certificate_key /etc/ssl/private/ssl-cert-snakeoil.key;
          ssl_protocols       TLSv1.1 TLSv1.2;
          ssl_ciphers         HIGH:!aNULL:!MD5;

An example of a fully-populated nginx_vhosts entry, using a `|` to declare a block of syntax for the `extra_parameters`.

Please take note of the indentation in the above block. The first line should be a normal 2-space indent. All other lines should be indented normally relative to that line. In the generated file, the entire block will be 4-space indented. This style will ensure the config file is indented correctly.

      - listen: "80"
        server_name: "example.com www.example.com"
        return: "301 https://example.com$request_uri"
        filename: "example.com.80.conf"

An example of a secondary vhost which will redirect to the one shown above.

*Note: The `filename` defaults to the first domain in `server_name`, if you have two vhosts with the same domain, eg. a redirect, you need to manually set the `filename` so the second one doesn't override the first one*

    nginx_remove_default_vhost: false

Whether to remove the 'default' virtualhost configuration supplied by Nginx. Useful if you want the base `/` URL to be directed at one of your own virtual hosts configured in a separate .conf file.

    nginx_upstreams: []

If you are configuring Nginx as a load balancer, you can define one or more upstream sets using this variable. In addition to defining at least one upstream, you would need to configure one of your server blocks to proxy requests through the defined upstream (e.g. `proxy_pass http://myapp1;`). See the commented example in `defaults/main.yml` for more information.

    nginx_user: "nginx"

The user under which Nginx will run. Defaults to `nginx` for RedHat, `www-data` for Debian and `www` on FreeBSD and OpenBSD.

    nginx_worker_processes: "{{ ansible_processor_vcpus|default(ansible_processor_count) }}"
    nginx_worker_connections: "1024"
    nginx_multi_accept: "off"

`nginx_worker_processes` should be set to the number of cores present on your machine (if the default is incorrect, find this number with `grep processor /proc/cpuinfo | wc -l`). `nginx_worker_connections` is the number of connections per process. Set this higher to handle more simultaneous connections (and remember that a connection will be used for as long as the keepalive timeout duration for every client!). You can set `nginx_multi_accept` to `on` if you want Nginx to accept all connections immediately.

    nginx_error_log: "/var/log/nginx/error.log warn"
    nginx_access_log: "/var/log/nginx/access.log main buffer=16k flush=2m"

Configuration of the default error and access logs. Set to `off` to disable a log entirely.

    nginx_sendfile: "on"
    nginx_tcp_nopush: "on"
    nginx_tcp_nodelay: "on"

TCP connection options. See [this blog post](https://t37.net/nginx-optimization-understanding-sendfile-tcp_nodelay-and-tcp_nopush.html) for more information on these directives.

    nginx_keepalive_timeout: "65"
    nginx_keepalive_requests: "100"

Nginx keepalive settings. Timeout should be set higher (10s+) if you have more polling-style traffic (AJAX-powered sites especially), or lower (<10s) if you have a site where most users visit a few pages and don't send any further requests.

    nginx_server_tokens: "on"

Nginx server_tokens settings. Controls whether nginx responds with it's version in HTTP headers. Set to `"off"` to disable.

    nginx_client_max_body_size: "64m"

This value determines the largest file upload possible, as uploads are passed through Nginx before hitting a backend like `php-fpm`. If you get an error like `client intended to send too large body`, it means this value is set too low.

    nginx_server_names_hash_bucket_size: "64"

If you have many server names, or have very long server names, you might get an Nginx error on startup requiring this value to be increased.

    nginx_proxy_cache_path: ""

Set as the `proxy_cache_path` directive in the `nginx.conf` file. By default, this will not be configured (if left as an empty string), but if you wish to use Nginx as a reverse proxy, you can set this to a valid value (e.g. `"/var/cache/nginx keys_zone=cache:32m"`) to use Nginx's cache (further proxy configuration can be done in individual server configurations).

    nginx_extra_http_options: ""

Extra lines to be inserted in the top-level `http` block in `nginx.conf`. The value should be defined literally (as you would insert it directly in the `nginx.conf`, adhering to the Nginx configuration syntax - such as `;` for line termination, etc.), for example:

    nginx_extra_http_options: |
      proxy_buffering    off;
      proxy_set_header   X-Real-IP $remote_addr;
      proxy_set_header   X-Scheme $scheme;
      proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header   Host $http_host;

See the template in `templates/nginx.conf.j2` for more details on the placement.

    nginx_extra_conf_options: ""

Extra lines to be inserted in the top of `nginx.conf`. The value should be defined literally (as you would insert it directly in the `nginx.conf`, adhering to the Nginx configuration syntax - such as `;` for line termination, etc.), for example:

    nginx_extra_conf_options: |
      worker_rlimit_nofile 8192;

See the template in `templates/nginx.conf.j2` for more details on the placement.

    nginx_log_format: |-
      '$remote_addr - $remote_user [$time_local] "$request" '
      '$status $body_bytes_sent "$http_referer" '
      '"$http_user_agent" "$http_x_forwarded_for"'

Configures Nginx's [`log_format`](http://nginx.org/en/docs/http/ngx_http_log_module.html#log_format). options.

    nginx_default_release: ""

(For Debian/Ubuntu only) Allows you to set a different repository for the installation of Nginx. As an example, if you are running Debian's wheezy release, and want to get a newer version of Nginx, you can install the `wheezy-backports` repository and set that value here, and Ansible will use that as the `-t` option while installing Nginx.

    nginx_ppa_use: false
    nginx_ppa_version: stable

(For Ubuntu only) Allows you to use the official Nginx PPA instead of the system's package. You can set the version to `stable` or `development`.

    nginx_yum_repo_enabled: true

(For RedHat/CentOS only) Set this to `false` to disable the installation of the `nginx` yum repository. This could be necessary if you want the default OS stable packages, or if you use Satellite.

    nginx_service_state: started
    nginx_service_enabled: yes

By default, this role will ensure Nginx is running and enabled at boot after Nginx is configured. You can use these variables to override this behavior if installing in a container or further control over the service state is required.

## Overriding configuration templates

If you can't customize via variables because an option isn't exposed, you can override the template used to generate the virtualhost configuration files or the `nginx.conf` file.

```yaml
nginx_conf_template: "nginx.conf.j2"
nginx_vhost_template: "vhost.j2"
```

If necessary you can also set the template on a per vhost basis.

```yaml
nginx_vhosts:
  - listen: "80 default_server"
    server_name: "site1.example.com"
    root: "/var/www/site1.example.com"
    index: "index.php index.html index.htm"
    template: "{{ playbook_dir }}/templates/site1.example.com.vhost.j2"
  - server_name: "site2.example.com"
    root: "/var/www/site2.example.com"
    index: "index.php index.html index.htm"
    template: "{{ playbook_dir }}/templates/site2.example.com.vhost.j2"
```

You can either copy and modify the provided template, or extend it with [Jinja2 template inheritance](http://jinja.pocoo.org/docs/2.9/templates/#template-inheritance) and override the specific template block you need to change.

### Example: Configure gzip in nginx configuration

Set the `nginx_conf_template` to point to a template file in your playbook directory.

```yaml
nginx_conf_template: "{{ playbook_dir }}/templates/nginx.conf.j2"
```

Create the child template in the path you configured above and extend `nginx` template file relative to your `playbook.yml`.

```
{% extends 'roles/nginx/templates/nginx.conf.j2' %}

{% block http_gzip %}
    gzip on;
    gzip_proxied any;
    gzip_static on;
    gzip_http_version 1.0;
    gzip_disable "MSIE [1-6]\.";
    gzip_vary on;
    gzip_comp_level 6;
    gzip_types
        text/plain
        text/css
        text/xml
        text/javascript
        application/javascript
        application/x-javascript
        application/json
        application/xml
        application/xml+rss
        application/xhtml+xml
        application/x-font-ttf
        application/x-font-opentype
        image/svg+xml
        image/x-icon;
    gzip_buffers 16 8k;
    gzip_min_length 512;
{% endblock %}
```

## Dependencies

None.

## Example Playbook

    - hosts: server
      roles:
        - { role: nginx }