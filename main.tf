resource "azurerm_resource_group" "dddAdelaide" {
  location = var.location
  name     = join("-", concat(local.naming.prefix, ["rg"], local.naming.suffix))
}
