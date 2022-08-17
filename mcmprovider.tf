variable "subscription_id" {

  description = "Please provide Subscription id"
  type        = string
  sensitive   = true
  

}

variable "client_id" {

  description = "Please provide Client id"
  type        = string
  sensitive   = true
  

}

variable "client_secret" {

  description = "Please provide Client secret"
  type        = string
  sensitive   = true

}

variable "tenant_id" {

  description = "Please provide tenant id"
  type        = string
  sensitive   = true

}

terraform {
  required_version = "~> 1.0.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.11.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}



# Provider Block
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
 
}


