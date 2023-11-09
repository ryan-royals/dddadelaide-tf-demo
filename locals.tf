locals {
  naming = {
    prefix = [lower(var.naming.org_code)]
    suffix = [lower(var.naming.application_code), lower(var.naming.environment_code), lower(var.naming.location_code)]
  }
}
