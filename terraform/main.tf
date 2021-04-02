<<<<<<< HEAD
resource "digitalocean_ssh_key" "robertdebock" {
=======
module "ssh_key" {
  source     = "robertdebock/ssh_key/digitalocean"
  version    = "2.0.0"
>>>>>>> f6dbc31f2fe5704d06e226c7fa0ec235506627d7
  name       = "Robert de Bock"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCWswOogkZz/ihQA0lENCwDwSzmtmBWtFwzIzDlfa+eb4rBt6rZBg7enKeMqYtStI/NDneBwZUFBDIMu5zJTbvg7A60/WDhWXZmU21tZnm8K7KREFYOUndc6h//QHig6IIaIwwBZHF1NgXLtZ0qrUUlNU5JSEhDJsObMlPHtE4vFP8twPnfc7hxAnYma5+knU6qTMCDvhBE5tGJdor4UGeAhu+SwSVDloYtt1vGTmnFn8M/OD/fRMksusPefxyshJ37jpB4jY/Z9vzaNHwcj33prwl1b/xRfxr/+KRJsyq+ZKs9u2TVw9g4p+XLdfDtzZ8thR2P3x3MFrZOdFmCbo/5"
}

resource "digitalocean_droplet" "server" {
  image    = "centos-8-x64"
  name     = "server"
  region   = "ams3"
  size     = "s-2vcpu-4gb"
  ssh_keys = [digitalocean_ssh_key.robertdebock.id]
}

resource "digitalocean_droplet" "agent" {
  image    = "centos-8-x64"
  name     = "agent"
  region   = "ams3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.robertdebock.id]
}

output "server" {
  value = digitalocean_droplet.server.ipv4_address
}
<<<<<<< HEAD

output "agent" {
  value = digitalocean_droplet.agent.ipv4_address
}
=======
>>>>>>> f6dbc31f2fe5704d06e226c7fa0ec235506627d7
