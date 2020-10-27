# ansible-dynamic-inventory
This repository shows a step-by-step approach of implementing Ansible Dynamic inventory. 

# Pre-requisite
To simulate VM's we are using Docker, so Docker is the only pre-requisite. Also you have to build the docker images for control server and target VM's
```
    make build
```

# High Level Flow
We are simulating Dynamic inventory in 3 steps:
* Step 1
    * Create initial setup with an Ansible control server and 2 VM's (vm1 & vm2)
    * Use anible ping module to validate if control server can talk to 2 VM's
* Step 2
    * Add 3 more VM's(vm3, vm4 & vm5) in the overall setup
    * Use ansible ping module to validate if control server can talk to all VM's
* Step 3
    * Delete 2 VM's(vm1 & vm2) in the overall setup
    * Use ansible ping module to validate if control server can talk to remaining VM's(vm3, vm4 & vm5)

# Detailed Flow
We will be doing a gradual move to dynamic inventory solution
* Implement dynamic inventory by updating static inventory file as per chaning infrastructure
```
cd static_inventory
make run-simulation
```

<p align="center"><img src="/img/DynamicInventory1.gif?raw=true"/></p>

* Implement dynamic inventory by replacing inventory file via corresponding json file but still changing inventory file as per changing infrastructure
```
cd json_static_inventory
make run-simulation
```

* Implement dynamic inventory by replacing inventory file via a bash script, but still the bash script will be updated as per changing infrastructure
```
cd dynamic_inventory_sol1
make run-simulation
```

* Implement dynamic inventory by replacing inventory file via a bash script, this bash script will actually get the VM details at runtime
```
cd dynamic_inventory_sol2
make run-simulation
```
