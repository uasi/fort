.PHONY: all db-provision install-roles

all:

db-provision:
	ansible-playbook db.yml -i inventory.sh

install-roles:
	ansible-galaxy install -p roles -r requirements.yml $(FLAGS)
