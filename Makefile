build:
	docker build -t opstree/ansible:1.0 .

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
	@docker run -itd --name controlserver --rm --net opstree -v ${PWD}:/src opstree/ansible:1.0

list-vm:
	echo "Listing VM's"
	@docker ps --filter "label=vm" --format "{{.Names}}"

wait:
	read -p "Press enter to continue...."
	clear
