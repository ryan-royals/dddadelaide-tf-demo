location = "australiaEast"
naming = {
  org_code         = "ddd"
  application_code = "adl"
  environment_code = "dev"
  location_code    = "aue"
}
networking = {
  address_space = "192.168.1.0/24"
  subnets = [{
    name           = "vm"
    address_prefix = 27
    },
    {
      name           = "app"
      address_prefix = 27
  }]
}
