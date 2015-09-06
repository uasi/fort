.PHONY: all db-provision install-roles

all:

app-provision:
	ansible-playbook app.yml -i inventory.sh
	@echo "To finish setup, open $(shell terraform output app_ipv4_address) in your browser and follow instructions."

db-provision:
	ansible-playbook db.yml -i inventory.sh

install-roles:
	ansible-galaxy install -p roles -r requirements.yml $(FLAGS)
