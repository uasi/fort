#!/bin/bash

# Dynamic Inventory:
# http://docs.ansible.com/ansible/intro_dynamic_inventory.html
#
# Developing Dynamic Inventory Sources:
# http://docs.ansible.com/ansible/developing_inventory.html

list() {
    cat <<EOD
{
    "app": {
        "hosts": ["$(terraform output app_ipv4_address)"],
        "vars": {
            "ansible_ssh_user": "root",
            "ansible_ssh_private_key_file": "$(terraform output ssh_private_key_file)",
            "db_ipv4_address": "$(terraform output db_ipv4_address)"
        }
    },
    "db": {
        "hosts": ["$(terraform output db_ipv4_address)"],
        "vars": {
            "ansible_ssh_user": "root",
            "ansible_ssh_private_key_file": "$(terraform output ssh_private_key_file)"
        }
    }
}
EOD
}

host() {
    list | jq -M ".${1}.vars"
}

case $1 in
    --host) host "$2" ;;
    --list) list ;;
esac
