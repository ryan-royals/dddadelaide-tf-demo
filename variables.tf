variable "subscription_id" {
  type        = string
  description = "Azure subscription ID to deploy resources to. Example: '00000000-0000-0000-0000-000000000000'"
  sensitive   = true
}

variable "location" {
  type        = string
  description = "Azure location to deploy resources to. Example: 'australiaEast'"
  default     = "australiaEast"
}

variable "naming" {
  type = object({
    org_code         = string
    application_code = string
    environment_code = string
    location_code    = string
  })
  description = <<EOT
    Naming convention for resources
    
    - org_code: 3 letter code for the organisation. Example. 'ddd'
    - application_code: 3 letter code for the application. Example: 'adl'
    - environment_code: 3 letter code for the environment classification. Example: 'dev'
    - location_code: 3 letter code for the datacenter location. Example: 'aue'
    EOT
}
