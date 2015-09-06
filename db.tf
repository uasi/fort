resource "digitalocean_droplet" "db" {
    image = "ubuntu-14-04-x64"
    name = "db"
    region = "sgp1"
    size = "512mb"
    backups = true
    private_networking = true
    ssh_keys = ["${var.digitalocean_ssh_key_fingerprint}"]

    lifecycle {
        prevent_destroy = true
    }
}
