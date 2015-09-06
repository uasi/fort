output "ssh_private_key_file" {
    value = "${var.digitalocean_ssh_private_key_file}"
}

output "app_ipv4_address" {
    value = "${digitalocean_droplet.app.ipv4_address}"
}

output "db_ipv4_address" {
    value = "${digitalocean_droplet.db.ipv4_address}"
}
