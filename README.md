# BOOTSTRAPPING *DO THIS FIRST*
You should be running in a virtual environment. The ```source ./scripts/bootstrap.sh``` command creates it, adds deps, and sources you into it. If you have already run the script, you can source into it by typing `source ./.venv/bin/activate`  
See ./scripts/README.md for more information.  
<br>
## Ansible Playbook:
Skeleton (_Replace with Playbook Name_)  
<br>
## Target Requirements
Python, PIP, Virtualenv (_For venv. Add additional requirements below_)  
<br>
## Example Usage
`ansible-playbook ./playbooks/<Your_playbook>`  
(_Limit as needed._)  
<br>

## Role Creation
This will create the default role structure per ansible guidelines.  
`cd ./roles`  
`ansible-galaxy init <rolename>`  
*See ./roles/README.ms for more information.*  
<br>
## Additional Notes
-- Ansible will read the ansible.cfg in this directory. If changes are needed, change this file. It is unlikely this will need to be modified, though.  
<br>
--Ansible LINT is installed by default in the virtual environment. To check your playbooks' syntax, simply type: ```ansible-lint playbook.yml``` or ```ansible-lint role_dir```  
<br>
--If you are missing binaries or files in the git repo, check out ./.gitignore  
<br>
The folder use suggestions are listed below:

```
docs/                     # non-binary documentation for project

group_vars/
   group1                 # here we assign variables to particular groups
   group2                 # ""

host_vars/
   hostname1              # if systems need specific variables, put them here
   hostname2              # ""

library/                  # if any custom modules, put them here

playbooks/                # all playbooks go here. Playbooks will mostly call roles.

roles/
    common/               # this hierarchy represents a "role"
        tasks/            #
            main.yml      #  <-- tasks file can include smaller files if warranted
        handlers/         #
            main.yml      #  <-- handlers file
        templates/        #  <-- files for use with the template resource
            ntp.conf.j2   #  <------- templates end in .j2
        files/            #
            bar.txt       #  <-- files for use with the copy resource
            foo.sh        #  <-- script files for use with the script resource
        vars/             #
            main.yml      #  <-- variables associated with this role
        defaults/         #
            main.yml      #  <-- default lower priority variables for this role
        meta/             #
            main.yml      #  <-- role dependencies
        library/          # roles can also include custom modules

scripts/                  # Scripts required for prep

site.yml                  # master playbook Which will call all playbooks needed.
```