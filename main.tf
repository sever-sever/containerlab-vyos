locals {
  routers = {
    r1 = {
      address = "192.0.2.21"
      cfg     = "config-r1.cfg"
    }
    r2 = {
      address = "192.0.2.22"
      cfg     = "config-r2.cfg"
    }
  }
}

module "router_config" {
  source        = "github.com/apnex/mod-vyos-config"
  for_each      = local.routers

  mgmt_address  = each.value.address
  mgmt_username = "admin"
  mgmt_password = "admin"
  config_string = file(each.value.cfg)
}
