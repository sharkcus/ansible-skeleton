## Bootstrap script and sourcing
Requirements: Python  
<br>
--Run  ```source ./bootstrap.sh``` to initialize venv from home directory of playbook. If using Python 3, a change must be made to a variable in the script. See script for details.  
Once done, you can enter the venv at anytime by typing:  
```source ./.venv/bin/activate```  
To leave the environment, type ```deactivate```  
<br>
--While in the environment, install any pip modules needed. They will NOT be installed outside the venv.  
--You may also specify the ansible version to be installed inside the bootstrap.sh script.  
--Note: If bootstrap.sh returns no result and closes, you probably don't have pip or virtualenv installed.  
--**If you are using python 3, the path changes from ```./.venv/bin/activate``` to ```./.venv/Scripts/activate```

*Be sure to update the bootstrap file with needed pip modules in the appropriate section.*
