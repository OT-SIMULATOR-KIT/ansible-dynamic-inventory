# ansible-dynamic-inventory
This repository shows a step-by-step approach of implementing Ansible Dynamic inventory. 

# Pre-requisite
To simulate VM's we are using Docker, so Docker is the only pre-requisite

# High Level Flow
We are simulating Dynamic inventory in 3 steps:
* Step 1
** Create initial setup with an Ansible control server and 2 VM's (vm1 & vm2)
** Use anible ping module to validate if control server can talk to 2 VM's
* Step 2
** Add 3 more VM's(vm3, vm4 & vm5) in the overall setup
** Use ansible ping module to validate if control server can talk to all VM's
* Step 3
* Delete 2 VM's(vm1 & vm2) in the overall setup
* Use ansible ping module to validate if control server can talk to remaining VM's(vm3, vm4 & vm5)