.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: build
build: # Build the Docker Image
	cd lab-setup/mac-silicon \
	&& sudo vagrant up \
	&& sudo vagrant reload \
	&& sudo vagrant upload ../../ansible_files/ controlplane

.PHONY: destroy
destroy: # Build the Docker Image
	cd lab-setup/mac-silicon \
	&& sudo vagrant destroy

.PHONY: run
run: # Run the project Container, volumes and keys configurated
	cd lab-setup/mac-silicon \
	&& sudo vagrant ssh controlplane -c "cd ansible_files \
	                                && sudo ansible-galaxy collection install -r requirements.yml \
	                                && sudo ansible-playbook site.yml -i inventory/my-cluster/hosts.yml"

.PHONY: setup
setup: # Set SSH Config
	cd lab-setup/mac-silicon \
	&& sudo vagrant ssh controlplane -c "sudo apt update \
	    && sudo apt install software-properties-common \
	    && sudo add-apt-repository --yes --update ppa:ansible/ansible \
	    && sudo apt install ansible"

.PHONY: get_nodes
get_nodes: # Get Clusters Nodes
	ssh vagrant@192.168.201.11 'sudo /var/lib/rancher/rke2/bin/kubectl --kubeconfig /etc/rancher/rke2/rke2.yaml get nodes'

.PHONY: lift
lift: # Lift kubernetes clusters
	make build
	make setup
	make run

.PHONY: rke2_uninstall
rke2_uninstall: # Uninstall the rke2 from VMS
	cd lab-setup/mac-silicon \
	&& sudo vagrant ssh agent -c "sudo /usr/local/bin/rke2-uninstall.sh" \
	&& sudo vagrant ssh server -c "sudo /usr/local/bin/rke2-uninstall.sh"

.PHONY: down
down: # Drop down the Kubernetes Clusters and Destroy Vagrant VMS
	make rke2_uninstall
	make destroy