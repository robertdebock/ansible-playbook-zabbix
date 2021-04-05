locals {
  mysql_server_droplet_size_map = {
    small  = "2gb"
    medium = "4gb"
    large  = "8gb"
  }
  zabbix_server_droplet_size_map = {
    small  = "1gb"
    medium = "2gb"
    large  = "4gb"
  }
  zabbix_web_droplet_size_map = {
    small  = "1gb"
    medium = "2gb"
    large  = "4gb"
  }
  mysql_server_droplet_size  = local.mysql_server_droplet_size_map[var.size]
  zabbix_server_droplet_size = local.zabbix_server_droplet_size_map[var.size]
  zabbix_web_droplet_size    = local.zabbix_web_droplet_size_map[var.size]
}
