resource "azurerm_resource_group" "dddAdelaide" {
  location = var.location
  name     = join("-", concat(local.naming.prefix, ["rg"], local.naming.suffix))
}

resource "azurerm_virtual_network" "spoke" {
  name                = join("-", concat(local.naming.prefix, ["vnet"], local.naming.suffix))
  location            = azurerm_resource_group.dddAdelaide.location
  resource_group_name = azurerm_resource_group.dddAdelaide.name

  address_space = ["192.168.1.0/24"]
  subnet {
    name           = "vm"
    address_prefix = "192.168.1.0/27"
  }
  subnet {
    name           = "app"
    address_prefix = "192.168.1.32/27"
  }
}
