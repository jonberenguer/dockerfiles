# readme

# overview
look at the network availabe `docker network ls` prefered to use `host` so that ansible will be able to communicate with devices on the network with the host

[ansbile documentation](https://docs.ansible.com/)


# examples to run container

``` bash
docker run --rm -it \
  --network host \
  -v `pwd`:/home/ansible/playbook \
  devops/ansible ansible-playbook --help


docker run --rm -it \
  --network host \
  -v `pwd`:/home/ansible/playbook \
  devops/ansible ansible --help


# --inventory=INVENTORY # INVENTORY = file or 192.168.0.1,192.168.0.2

# -v # will show details
```



``` bash ansible example
ansible * -i localhost, -m ping

ansible all -m copy -a "src=/home/mike/.ssh/id_rsa.pub dest=/tmp/id_rsa.pub" --ask-pass -c paramiko

ansible all -m shell -a "cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys" --ask-pass -c paramiko

ansible all -m authorized_key -a "user=mike key='{{ lookup('file', '/home/mike/.ssh/id_rsa.pub') }}' path=/home/mike/.ssh/authorized_keys manage_dir=no" --ask-pass -c paramiko

ansible all -m zypper -a "name=apache2 state=latest" -u root
```


# example of playbook
``` bash ansible-playbook example
cat << 'EOF' > inventory
node.kb.web.com
EOF

cat << 'EOF' > install-nginx.yml
- hosts: node.kb.web.com
  become: yes
  tasks:
    name: install epel
    yum:
      name: epel-release
      state: installed
    name: intsall nginx
    yum:
      name: nginx
      state: installed
EOF

ansible-playbook -i ./inventory ./install-nginx.yml

```

``` yaml example
---
- hosts: showtermServers
  remote_user: root
  tasks:
    - name: ensure packages are installed
      yum: name={{item}} state=latest
      with_items:
        - postgresql
        - postgresql-server
        - postgresql-devel
        - python-psycopg2
        - git
        - ruby21
        - ruby21-passenger
    - name: showterm server from github
      git: repo=https://github.com/ConradIrwin/showterm.io dest=/root/showterm
    - name: Initdb
      command: service postgresql initdb
               creates=/var/lib/pgsql/data/postgresql.conf
 
    - name: Start PostgreSQL and enable at boot
      service: name=postgresql
               enabled=yes
               state=started
    - gem: name=pg state=latest user_install=no
  handlers:
   - name: restart postgresql
     service: name=postgresql state=restarted
 
- hosts: showtermServers
  remote_user: root
  sudo: yes
  sudo_user: postgres
  vars:
    dbname: showterm
    dbuser: showterm
    dbpassword: showtermpassword
  tasks:
    - name: create db
      postgresql_db: name={{dbname}}
 
    - name: create user with ALL priv
      postgresql_user: db={{dbname}} name={{dbuser}} password={{dbpassword}} priv=ALL
- hosts: showtermServers
  remote_user: root
  tasks:
    - name: database.yml
      template: src=database.yml dest=/root/showterm/config/database.yml
- hosts: showtermServers
  remote_user: root
  tasks:
    - name: run bundle install
      shell: bundle install
      args:
        chdir: /root/showterm
- hosts: showtermServers
  remote_user: root
  tasks:
    - name: run rake db tasks
      shell: 'bundle exec rake db:create db:migrate db:seed'
      args:
        chdir: /root/showterm
- hosts: showtermServers
  remote_user: root
  tasks:
    - name: apache config
      template: src=showterm.conf dest=/etc/httpd/conf.d/showterm.conf
```


``` bash
docker run --rm -it \
 -v `echo $HOME/.ssh`:/home/ansible/.ssh \
 devops/ansible ansible all -i git.facade.codes, -u git -m ping -c paramiko -v



docker run --rm -it \
 -v `echo $HOME/vbox-Public_Repos/docker/git`:/home/ansible \
 -v `echo $HOME/.ssh`:/home/ansible/.ssh \
 devops/ansible ansible-playbook -i git-hosts --extra-vars '{"new_repo":"NEWREPO"}' new-repo-playbook.yml



cat << 'EOF' > git-hosts
[private-git]
git.facade.codes
EOF


cat << 'EOF' > new-repo-playbook.yml
---
- hosts: private-git
  vars:
    new_repo : test
  remote_user: git
  tasks:
  - name: new repo directory
    file:
      path: /gitrepo/{{ new_repo }}.git
      state: directory
  - name: go to new repo and init
    command:
      cmd: git init --bare
      chdir: /gitrepo/{{ new_repo }}.git
  - name: print to stdout
    command:
      cmd: ls
      chdir: /gitrepo
    register: ls_stdout
  - debug: msg="{{ ls_stdout.stdout }}"
EOF
```