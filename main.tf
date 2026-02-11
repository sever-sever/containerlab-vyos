locals {
  routers = {
    r1 = {
      address = "192.0.2.21"
      cfg     = "containerlab/config/config-r1.cfg"
    }
    r2 = {
      address = "192.0.2.22"
      cfg     = "containerlab/config/config-r2.cfg"
    }
  }
}

module "router_config" {
  # source   = "github.com/apnex/mod-vyos-config"
  source   = "github.com/sever-sever/mod-vyos-config?ref=dehardcode-home"
  for_each = local.routers

  mgmt_address  = each.value.address
  mgmt_username = "admin"
  mgmt_password = "admin"
  config_string = file(each.value.cfg)
}


resource "null_resource" "dummy_mokutil" {
  for_each = local.routers

  connection {
    type     = "ssh"
    host     = each.value.address
    user     = "admin"
    password = "admin"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /usr/local/bin",
      "sudo tee /usr/local/bin/mokutil > /dev/null <<'EOF'",
      "#!/bin/sh",
      "echo 'SecureBoot disabled'",
      "exit 0",
      "EOF",
      "sudo chmod +x /usr/local/bin/mokutil"
    ]
  }

  depends_on = [module.router_config]
}
