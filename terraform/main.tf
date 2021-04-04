resource "digitalocean_ssh_key" "default" {
  name       = "Robert de Bock"
  public_key = file("/Users/robertdb/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "zabbix_server" {
  image    = "centos-8-x64"
  name     = "zabbix-server.meinit.nl"
  region   = "ams3"
  size     = "s-2vcpu-4gb"
  ssh_keys = [digitalocean_ssh_key.default.id]
}

resource "digitalocean_droplet" "mysql_server" {
  image    = "centos-8-x64"
  name     = "mysql-server.meinit.nl"
  region   = "ams3"
  size     = "s-2vcpu-4gb"
  ssh_keys = [digitalocean_ssh_key.default.id]
}

data "cloudflare_zones" "meinit_nl" {
  filter {
    name = "meinit.nl"
  }
}

resource "cloudflare_record" "zabbix_server" {
  zone_id = data.cloudflare_zones.meinit_nl.zones[0].id
  name    = "zabbix-server"
  value   = digitalocean_droplet.zabbix_server.ipv4_address
  type    = "A"
  ttl     = 300
}

resource "cloudflare_record" "mysql_server" {
  zone_id = data.cloudflare_zones.meinit_nl.zones[0].id
  name    = "mysql-server"
  value   = digitalocean_droplet.mysql_server.ipv4_address
  type    = "A"
  ttl     = 300
}
