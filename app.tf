resource "digitalocean_droplet" "app" {
    image = "dokku"
    name = "app"
    region = "sgp1"
    size = "1gb"
    private_networking = true
    ssh_keys = ["${var.digitalocean_ssh_key_fingerprint}"]

    lifecycle {
        prevent_destroy = false
    }
}
