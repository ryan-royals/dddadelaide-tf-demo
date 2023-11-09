resource "azurerm_resource_group" "dddAdelaide" {
  location = var.location
  name     = join("-", concat(local.naming.prefix, ["rg"], local.naming.suffix))
}

resource "azurerm_virtual_network" "spoke" {
  name                = join("-", concat(local.naming.prefix, ["vnet"], local.naming.suffix))
  location            = azurerm_resource_group.dddAdelaide.location
  resource_group_name = azurerm_resource_group.dddAdelaide.name

  address_space = [var.networking.address_space]
  dynamic "subnet" {
    for_each = local.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}

locals {
  deployed_subnets = {
    for o in azurerm_virtual_network.spoke.subnet : o.name => {
      id             = o.id
      address_prefix = o.address_prefix
    }
  }
}
