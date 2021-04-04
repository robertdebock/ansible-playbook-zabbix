output "zabbix_server" {
  value = cloudflare_record.zabbix_server.hostname
}

output "mysql_server" {
  value = cloudflare_record.mysql_server.hostname
}
