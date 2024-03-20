```bash
ansible-playbook playbooks/playbook_minio.yml

PLAY [Cluster config | ssl, dns, rename drives] *******************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [159.69.241.156]
ok: [49.13.167.104]
ok: [91.107.198.134]
ok: [65.109.141.80]

TASK [Check if cert directory exists] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [49.13.167.104]
ok: [159.69.241.156]
ok: [91.107.198.134]
ok: [65.109.141.80]

TASK [Create cert directory] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [Copy openssl crt] *******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [65.109.141.80]

TASK [Copy openssl crt to CAs] ************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [65.109.141.80]

TASK [Copy openssl key] *******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [49.13.167.104]
changed: [65.109.141.80]

TASK [Configure DNS mappings] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104] => (item={'hostname': 'minio1.ujstor.com', 'ip_address': '10.0.4.2'})
changed: [159.69.241.156] => (item={'hostname': 'minio1.ujstor.com', 'ip_address': '10.0.4.2'})
changed: [91.107.198.134] => (item={'hostname': 'minio1.ujstor.com', 'ip_address': '10.0.4.2'})
changed: [65.109.141.80] => (item={'hostname': 'minio1.ujstor.com', 'ip_address': '10.0.4.2'})
changed: [49.13.167.104] => (item={'hostname': 'minio2.ujstor.com', 'ip_address': '10.0.4.3'})
changed: [91.107.198.134] => (item={'hostname': 'minio2.ujstor.com', 'ip_address': '10.0.4.3'})
changed: [159.69.241.156] => (item={'hostname': 'minio2.ujstor.com', 'ip_address': '10.0.4.3'})
changed: [65.109.141.80] => (item={'hostname': 'minio2.ujstor.com', 'ip_address': '10.0.4.3'})
changed: [49.13.167.104] => (item={'hostname': 'minio3.ujstor.com', 'ip_address': '10.0.4.4'})
changed: [159.69.241.156] => (item={'hostname': 'minio3.ujstor.com', 'ip_address': '10.0.4.4'})
changed: [91.107.198.134] => (item={'hostname': 'minio3.ujstor.com', 'ip_address': '10.0.4.4'})
changed: [65.109.141.80] => (item={'hostname': 'minio3.ujstor.com', 'ip_address': '10.0.4.4'})
changed: [49.13.167.104] => (item={'hostname': 'minio4.ujstor.com', 'ip_address': '10.0.4.5'})
changed: [159.69.241.156] => (item={'hostname': 'minio4.ujstor.com', 'ip_address': '10.0.4.5'})
changed: [91.107.198.134] => (item={'hostname': 'minio4.ujstor.com', 'ip_address': '10.0.4.5'})
changed: [65.109.141.80] => (item={'hostname': 'minio4.ujstor.com', 'ip_address': '10.0.4.5'})

TASK [Copy mount volume rename script] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [Execute the script] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [Reboot server] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
fatal: [49.13.167.104]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 49.13.167.104 closed.", "unreachable": true}
...ignoring
fatal: [91.107.198.134]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 91.107.198.134 closed.", "unreachable": true}
...ignoring
fatal: [159.69.241.156]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 159.69.241.156 closed.", "unreachable": true}
...ignoring
fatal: [65.109.141.80]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 65.109.141.80 closed.", "unreachable": true}
...ignoring

TASK [Wait for servers to come back online] ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [49.13.167.104]
ok: [159.69.241.156]
ok: [91.107.198.134]
ok: [65.109.141.80]

PLAY [Install minIO] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [49.13.167.104]
ok: [91.107.198.134]
ok: [159.69.241.156]
ok: [65.109.141.80]

TASK [common : Update package lists] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [common : Upgrade all packages] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [common : Install public AuthorizedKeysFile] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [159.69.241.156]
changed: [65.109.141.80]
changed: [91.107.198.134]
changed: [49.13.167.104]

TASK [common : Install required packages] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [49.13.167.104]
changed: [65.109.141.80]

TASK [common : Allow everything and enable UFW] *******************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [49.13.167.104]
changed: [65.109.141.80]

TASK [common : Allow incoming traffic on specified ports] *********************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104] => (item=22)
changed: [159.69.241.156] => (item=22)
changed: [91.107.198.134] => (item=22)
changed: [65.109.141.80] => (item=22)

TASK [common : Configure Fail2Ban] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [49.13.167.104]
changed: [65.109.141.80]

TASK [common : Restart fail2ban] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [49.13.167.104]
changed: [65.109.141.80]

TASK [common : SSH Hardening for root user] ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [65.109.141.80]

TASK [common : Restart sshd] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [65.109.141.80]

TASK [minio : Install server] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
included: /home/ujstor/code/ujstor/deployment-cluster-s3-psqldb/ansible/playbooks/roles/minio/tasks/install_server.yml for 91.107.198.134, 49.13.167.104, 65.109.141.80, 159.69.241.156

TASK [minio : Compose the Minio server download url] **************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [91.107.198.134]
ok: [49.13.167.104]
ok: [65.109.141.80]
ok: [159.69.241.156]

TASK [minio : Get the Minio server checksum for architecture amd64] ***********************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [65.109.141.80]
ok: [49.13.167.104]
ok: [91.107.198.134]
ok: [159.69.241.156]

TASK [minio : Create Minio group] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [minio : Create Minio user] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [91.107.198.134]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [minio : Create the Minio config directories] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [159.69.241.156] => (item=/etc/minio)
changed: [49.13.167.104] => (item=/etc/minio)
changed: [91.107.198.134] => (item=/etc/minio)
changed: [65.109.141.80] => (item=/etc/minio)
changed: [159.69.241.156] => (item=/etc/minio/ssl)
changed: [49.13.167.104] => (item=/etc/minio/ssl)
changed: [91.107.198.134] => (item=/etc/minio/ssl)
changed: [65.109.141.80] => (item=/etc/minio/ssl)
changed: [159.69.241.156] => (item=/etc/minio/policy)
changed: [49.13.167.104] => (item=/etc/minio/policy)
changed: [91.107.198.134] => (item=/etc/minio/policy)
changed: [65.109.141.80] => (item=/etc/minio/policy)

TASK [minio : Create the Minio data storage directories] **********************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104] => (item=/var/lib/minio)
changed: [159.69.241.156] => (item=/var/lib/minio)
changed: [91.107.198.134] => (item=/var/lib/minio)
changed: [65.109.141.80] => (item=/var/lib/minio)

TASK [minio : Download the Minio server] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [minio : Generate the Minio server envfile] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [65.109.141.80]

TASK [minio : Create the Minio server systemd config] *************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [65.109.141.80]

TASK [minio : Copy SSL private key file] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [91.107.198.134]
skipping: [49.13.167.104]
skipping: [65.109.141.80]
skipping: [159.69.241.156]

TASK [minio : Copy cert file] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [91.107.198.134]
skipping: [49.13.167.104]
skipping: [65.109.141.80]
skipping: [159.69.241.156]

TASK [minio : Flush handlers] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [minio : Flush handlers] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [minio : Flush handlers] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [minio : Flush handlers] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

RUNNING HANDLER [minio : Reload minio systemd] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [49.13.167.104]
ok: [159.69.241.156]
ok: [91.107.198.134]
ok: [65.109.141.80]

RUNNING HANDLER [minio : Restart minio] ***************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [65.109.141.80]

TASK [minio : Ensure minio is started at boot] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [91.107.198.134]
changed: [65.109.141.80]

TASK [minio : Set secure minio url if not defined] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [91.107.198.134]
skipping: [49.13.167.104]
skipping: [65.109.141.80]
skipping: [159.69.241.156]

TASK [minio : Set unsecure minio_url if not defined] **************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [91.107.198.134]
ok: [49.13.167.104]
ok: [65.109.141.80]
ok: [159.69.241.156]

TASK [minio : Install client] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
included: /home/ujstor/code/ujstor/deployment-cluster-s3-psqldb/ansible/playbooks/roles/minio/tasks/install_client.yml for 91.107.198.134, 49.13.167.104, 65.109.141.80, 159.69.241.156

TASK [minio : Compose the Minio client download base url] *********************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [91.107.198.134]
ok: [49.13.167.104]
ok: [65.109.141.80]
ok: [159.69.241.156]

TASK [minio : Get the Minio client checksum for architecture amd64] ***********************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [91.107.198.134]
ok: [49.13.167.104]
ok: [65.109.141.80]
ok: [159.69.241.156]

TASK [minio : Download the Minio client] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]
changed: [49.13.167.104]
changed: [159.69.241.156]
changed: [65.109.141.80]

TASK [minio : Configure server] ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
included: /home/ujstor/code/ujstor/deployment-cluster-s3-psqldb/ansible/playbooks/roles/minio/tasks/configure_server.yml for 91.107.198.134

TASK [minio : Set insecure mc command] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [91.107.198.134]

TASK [minio : Set secure mc command] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [91.107.198.134]

TASK [minio : Create Minio Users] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [91.107.198.134]

TASK [minio : Create Minio Buckets] *******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
included: /home/ujstor/code/ujstor/deployment-cluster-s3-psqldb/ansible/playbooks/roles/minio/tasks/create_minio_buckets.yml for 91.107.198.134

TASK [minio : Ensure PIP is installed.] ***************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]

TASK [minio : Install pip packages] *******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134]

TASK [minio : Create Buckets] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [91.107.198.134]

TASK [minio : Create Prometheus bearer token] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [91.107.198.134]

TASK [Allow http, UI and S3 API ports] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134] => (item=9091)
changed: [49.13.167.104] => (item=9091)
changed: [159.69.241.156] => (item=9091)
changed: [65.109.141.80] => (item=9091)
changed: [91.107.198.134] => (item=9092)
changed: [49.13.167.104] => (item=9092)
changed: [159.69.241.156] => (item=9092)
changed: [65.109.141.80] => (item=9092)

TASK [Reboot server1] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
fatal: [49.13.167.104]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 49.13.167.104 closed.", "unreachable": true}
...ignoring
fatal: [159.69.241.156]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 159.69.241.156 closed.", "unreachable": true}
...ignoring
fatal: [91.107.198.134]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 91.107.198.134 closed.", "unreachable": true}
...ignoring
fatal: [65.109.141.80]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 65.109.141.80 closed.", "unreachable": true}
...ignoring

TASK [Wait for servers to come back online1] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [49.13.167.104]
ok: [159.69.241.156]
ok: [91.107.198.134]
ok: [65.109.141.80]

TASK [Change ownership for /mnt/disk] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [91.107.198.134] => (item=/mnt/disk1)
changed: [159.69.241.156] => (item=/mnt/disk1)
changed: [49.13.167.104] => (item=/mnt/disk1)
changed: [65.109.141.80] => (item=/mnt/disk1)
changed: [49.13.167.104] => (item=/mnt/disk2)
changed: [159.69.241.156] => (item=/mnt/disk2)
changed: [91.107.198.134] => (item=/mnt/disk2)
changed: [65.109.141.80] => (item=/mnt/disk2)
changed: [49.13.167.104] => (item=/mnt/disk3)
changed: [159.69.241.156] => (item=/mnt/disk3)
changed: [91.107.198.134] => (item=/mnt/disk3)
changed: [65.109.141.80] => (item=/mnt/disk3)
changed: [49.13.167.104] => (item=/mnt/disk4)
changed: [91.107.198.134] => (item=/mnt/disk4)
changed: [159.69.241.156] => (item=/mnt/disk4)
changed: [65.109.141.80] => (item=/mnt/disk4)

TASK [Reboot server2] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
fatal: [49.13.167.104]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 49.13.167.104 closed.", "unreachable": true}
...ignoring
fatal: [91.107.198.134]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 91.107.198.134 closed.", "unreachable": true}
...ignoring
fatal: [159.69.241.156]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 159.69.241.156 closed.", "unreachable": true}
...ignoring
fatal: [65.109.141.80]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: Shared connection to 65.109.141.80 closed.", "unreachable": true}
...ignoring

TASK [Wait for servers to come back online2] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [49.13.167.104]
ok: [91.107.198.134]
ok: [159.69.241.156]
ok: [65.109.141.80]

PLAY RECAP ********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
159.69.241.156             : ok=46   changed=29   unreachable=0    failed=0    skipped=3    rescued=0    ignored=3
49.13.167.104              : ok=46   changed=29   unreachable=0    failed=0    skipped=3    rescued=0    ignored=3
65.109.141.80              : ok=46   changed=29   unreachable=0    failed=0    skipped=3    rescued=0    ignored=3
91.107.198.134             : ok=51   changed=31   unreachable=0    failed=0    skipped=7    rescued=0    ignored=3



```