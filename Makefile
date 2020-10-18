build:
	docker build -t opstree/ansible:1.0 .

create-network:
	@docker network create opstree || true > /dev/null

run-vm:
	@docker rm -f $(VM_NAME) || true > /dev/null
	@docker run -itd -l vm --name $(VM_NAME) --rm --net opstree opstree/ansible:1.0
	@docker exec -it $(VM_NAME) bash -c "/etc/init.d/ssh start"

terminate-vm:
	@docker rm -f $(VM_NAME) || true

run-controlserver:
	@docker rm -f controlserver || true  > /dev/null
	@docker run -itd --name controlserver --rm --net opstree -v ${PWD}:/src opstree/ansible:1.0

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

list-vm:
	@docker ps --filter "label=vm" --format "{{.Names}}"

cleanup:
	make terminate-vm VM_NAME=vm1
	make terminate-vm VM_NAME=vm2
	make terminate-vm VM_NAME=vm3
	make terminate-vm VM_NAME=vm4
	make terminate-vm VM_NAME=controlserver


