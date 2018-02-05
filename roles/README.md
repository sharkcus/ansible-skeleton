## Adding a role
Add a role by running:  
```cd ./roles```  
```ansible-galaxy init <role_name>```
The role will appear in the roles directory with all directories created per ansible's standards.  
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