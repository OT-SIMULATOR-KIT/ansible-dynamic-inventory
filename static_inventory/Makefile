include ../Makefile

initialize-setup:
	make create-network
	make run-vm VM_NAME=vm1
	make run-vm VM_NAME=vm2
	make run-controlserver

add-vm:
	make run-vm VM_NAME=vm3
	make run-vm VM_NAME=vm4
	make run-vm VM_NAME=vm5

delete-vm:
	make terminate-vm VM_NAME=vm1
	make terminate-vm VM_NAME=vm2

cleanup:
	make terminate-vm VM_NAME=vm1
	make terminate-vm VM_NAME=vm2
	make terminate-vm VM_NAME=vm3
	make terminate-vm VM_NAME=vm4
	make terminate-vm VM_NAME=vm5
	make terminate-vm VM_NAME=controlserver

run-ansible-ping:

run-simulation:
	echo "Doing initial setup"
	make initialize-setup
	make wait
	
	make list-vm
	make wait

	make run-ping INVENTORY=inventory1
	make wait

	make add-vm
	make wait

	make list-vm
	make wait

	make run-ping INVENTORY=inventory2
	make wait

	make delete-vm
	make wait

	make list-vm
	make wait

	make run-ping INVENTORY=inventory3
	make wait

	make cleanup

	make list-vm
	make wait
