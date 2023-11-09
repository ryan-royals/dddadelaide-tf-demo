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

module "vm" {
  for_each = {
    for o in var.virtual_machines : o.vm_name_suffix => o
  }

  source = "./modules/virtual_machine"

  resource_group_name = azurerm_resource_group.dddAdelaide.name
  location            = azurerm_resource_group.dddAdelaide.location

  vm_name     = join("-", concat(local.naming.prefix, ["vm"], local.naming.suffix, [each.value.vm_name_suffix]))
  vm_hostname = each.value.vm_hostname
  vm_username = each.value.vm_username
  vm_password = each.value.vm_password
  vm_sku      = each.value.vm_sku
  os_type     = each.value.os_type
  subnet_id   = local.deployed_subnets[each.value.subnet_name].id
}