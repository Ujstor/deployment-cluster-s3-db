```bash
ansible-playbook playbooks/playbook_nginx_minio_lb.yml

PLAY [Configure Nginx as Load Balancer for MinIO cluster] *********************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [common : Update package lists] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [157.90.150.92]

TASK [common : Upgrade all packages] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [common : Install public AuthorizedKeysFile] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [common : Install required packages] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [common : Allow everything and enable UFW] *******************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [common : Allow incoming traffic on specified ports] *********************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92] => (item=22)

TASK [common : Configure Fail2Ban] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [common : Restart fail2ban] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [157.90.150.92]

TASK [common : SSH Hardening for root user] ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [common : Restart sshd] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [157.90.150.92]

TASK [Install Nginx] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [nginx : Include OS-specific variables.] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [nginx : Define nginx_user.] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [nginx : include_tasks] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : include_tasks] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
included: /home/ujstor/code/ujstor/deployment-cluster-s3-psqldb/ansible/playbooks/roles/nginx/tasks/setup-Ubuntu.yml for 157.90.150.92

TASK [nginx : Ensure dirmngr is installed (gnupg dependency).] ****************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [nginx : Add PPA for Nginx (if configured).] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : Ensure nginx will reinstall if the PPA was just added.] *********************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : include_tasks] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
included: /home/ujstor/code/ujstor/deployment-cluster-s3-psqldb/ansible/playbooks/roles/nginx/tasks/setup-Debian.yml for 157.90.150.92

TASK [nginx : Update apt cache.] **********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [nginx : Ensure nginx is installed.] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [nginx : include_tasks] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : include_tasks] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : include_tasks] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : Remove default nginx vhost config file (if configured).] ********************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : Ensure nginx_vhost_path exists.] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [nginx : Add managed vhost config files.] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : Remove managed vhost config files.] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [157.90.150.92]

TASK [nginx : Remove legacy vhosts.conf file.] ********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [nginx : Copy nginx configuration in place.] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [nginx : Ensure nginx service is running as configured.] *****************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [Create NGINX configuration directory] ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [Create nginx group] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [Create nginx system user] ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [157.90.150.92]

TASK [Nginx configuration file] ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [157.90.150.92]

TASK [Allow http, UI and S3 API ports] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [157.90.150.92] => (item=80)
changed: [157.90.150.92] => (item=443)
changed: [157.90.150.92] => (item=9091)
changed: [157.90.150.92] => (item=9092)

RUNNING HANDLER [Restart Nginx] ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [157.90.150.92]

PLAY RECAP ********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
157.90.150.92              : ok=28   changed=6    unreachable=0    failed=0    skipped=9    rescued=0    ignored=0

```