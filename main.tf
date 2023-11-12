resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = join("-", concat(local.naming.prefix, ["rg"], local.naming.suffix))
}
