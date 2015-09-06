PROVISION := ansible-playbook site.yml -i inventory.sh

.PHONY: all db-provision install-roles

all:

app-provision:
	$(PROVISION) -l app -e "db_ipv4_address=$(shell terraform output db_ipv4_address)"
	@echo "To finish setup, open $(shell terraform output app_ipv4_address) in your browser and follow instructions."

db-provision:
	$(PROVISION) -l db

syntax-check:
	$(PROVISION) --syntax-check

install-roles:
	ansible-galaxy install -p roles -r requirements.yml $(FLAGS)
