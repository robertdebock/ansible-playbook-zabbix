resource "digitalocean_ssh_key" "default" {
  name       = "Robert de Bock"
  public_key = file("/Users/robertdb/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "zabbix_web" {
  image    = "centos-stream-8-x64"
  name     = "zabbix-web.meinit.nl"
  region   = var.region
  size     = local.zabbix_web_droplet_size
  ssh_keys = [digitalocean_ssh_key.default.id]
}

resource "digitalocean_floating_ip" "zabbix" {
  droplet_id = digitalocean_droplet.zabbix_web.id
  region     = var.region
}

resource "digitalocean_droplet" "zabbix_server" {
  image    = "centos-stream-8-x64"
  name     = "zabbix-server.meinit.nl"
  region   = var.region
  size     = local.zabbix_server_droplet_size
  ssh_keys = [digitalocean_ssh_key.default.id]
}

resource "digitalocean_droplet" "mysql_server" {
  image    = "centos-stream-8-x64"
  name     = "mysql-server.meinit.nl"
  region   = var.region
  size     = local.mysql_server_droplet_size
  ssh_keys = [digitalocean_ssh_key.default.id]
}

data "cloudflare_zones" "meinit_nl" {
  filter {
    name = "meinit.nl"
  }
}

resource "cloudflare_record" "zabbix" {
  zone_id = data.cloudflare_zones.meinit_nl.zones[0].id
  name    = "zabbix"
  value   = digitalocean_floating_ip.zabbix.ip_address
  type    = "A"
  ttl     = 300
}

resource "cloudflare_record" "zabbix_web" {
  zone_id = data.cloudflare_zones.meinit_nl.zones[0].id
  name    = "zabbix-web"
  value   = digitalocean_droplet.zabbix_web.ipv4_address
  type    = "A"
  ttl     = 300
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

resource "digitalocean_firewall" "web" {
  name        = "web"
  droplet_ids = [digitalocean_droplet.zabbix_web.id]
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

resource "digitalocean_firewall" "database" {
  name        = "database"
  droplet_ids = [digitalocean_droplet.mysql_server.id]
  inbound_rule {
    protocol         = "tcp"
    port_range       = "3306"
    source_addresses = [digitalocean_droplet.zabbix_server.ipv4_address, digitalocean_droplet.zabbix_web.ipv4_address]
  }
}

resource "digitalocean_firewall" "zabbix_agent" {
  name        = "zabbix-agent"
  droplet_ids = [digitalocean_droplet.zabbix_web.id,digitalocean_droplet.mysql_server.id]
  inbound_rule {
    protocol         = "tcp"
    port_range       = "10050"
    source_addresses = [digitalocean_droplet.zabbix_server.ipv4_address]
  }
}

resource "digitalocean_firewall" "zabbix_server" {
  name        = "zabbix-server"
  droplet_ids = [digitalocean_droplet.zabbix_server.id]
  inbound_rule {
    protocol         = "tcp"
    port_range       = "10051"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

resource "digitalocean_firewall" "all" {
  name        = "ssh-and-internet"
  droplet_ids = [digitalocean_droplet.zabbix_server.id, digitalocean_droplet.zabbix_web.id, digitalocean_droplet.mysql_server.id]
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
