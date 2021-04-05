output "zabbix_web" {
  value = cloudflare_record.zabbix_web.hostname
}

output "zabbix_server" {
  value = cloudflare_record.zabbix_server.hostname
}

output "mysql_server" {
  value = cloudflare_record.mysql_server.hostname
}

output "zabbix" {
  value = cloudflare_record.zabbix.hostname
}
