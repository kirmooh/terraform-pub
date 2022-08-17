variable "azure_dev_owner" {

  description = "Owner who provisioned the resource"
  type        = string
 

}

variable "azure_env" {

  description = "Environment which resource got provisioned"
  type        = string
 

}

variable "azure_loc" {

  description = "Location/region which resource got provisioned"
  type        = string
  default     = "South India"

}

variable "azure_vn_cidr" {

  description = "Address space CIDR for virtual network"
  type        = string

}

variable "azure_subnet_cidr" {

  description = "address_prefixes CIDR for subnet"
  type        = string

}

variable "azure_subnet_cidr2" {

  description = "address_prefixes CIDR for subnet2"
  type        = string

}
/*variable "subscription_id" {

  description = "Azure subscription_id"
  type        = string

}
variable "client_id" {

  description = "Azure client id"
  type        = string

}
variable "client_secret" {

  description = "Azure client_secret"
  type        = string

}
variable "tenant_id" {

  description = "Azure tenant_id"
  type        = string

}*/