build:
	docker build -t opstree/ansible:1.0 .
	docker build -t opstree/ansibledocker:1.0 -f Dockerfile.controlserver .

create-network:
	@docker network create opstree || true > /dev/null

run-vm:
	echo "Creating VM $(VM_NAME)"
	@docker rm -f $(VM_NAME) || true > /dev/null
	@docker run -itd -l vm --name $(VM_NAME) --rm --net opstree opstree/ansible:1.0
	@docker exec -it $(VM_NAME) bash -c "/etc/init.d/ssh start"

terminate-vm:
	echo "Terminating VM $(VM_NAME)"
	@docker rm -f $(VM_NAME) || true

run-controlserver:
	@docker rm -f controlserver || true  > /dev/null
	@docker run -itd --name controlserver --rm --net opstree -v ${PWD}:/src -v /var/run/docker.sock:/var/run/docker.sock --privileged opstree/ansibledocker:1.0

list-vm:
	echo "Listing VM's"
	@docker ps --filter "label=vm" --format "{{.Names}}"

wait:
	read -p "Press enter to continue...."
	clear

run-ping:
	echo "Validating connection to VM's"
	docker exec -it controlserver bash -c "ansible -i /src/$(INVENTORY) all -m ping"