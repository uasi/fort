.PHONY: all db-provision

all:

db-provision:
	ANSIBLE_SSH_ARGS='-i "$(shell terraform output ssh_private_key_file)"' \
		ansible-playbook db/provision.yml -i root@$(shell terraform output db_ipv4_address),
