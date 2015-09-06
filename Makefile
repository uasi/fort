.PHONY: all db-provision

all:

db-provision:
	ansible-playbook db/provision.yml -i inventory.sh -l db
