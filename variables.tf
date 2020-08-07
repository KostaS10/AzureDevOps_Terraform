#AzureRM provider variables
variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

#Resources variables
variable "location" {
  type    = string
  default = "westeurope"
}

variable "rgname" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "key" {
  type = string
}

variable "access_key" {
  type = string
}

variable "tags" {
  type = map

  default = {
    Environment = "Dev"
    Department  = "IT"
  }
}

variable "subnets" {
  type = map
}

variable "stg_acc_name" {
	type = string
}

#AzureDevOps provider variables

variable "org_service_url" {
 type = string
}

variable "personal_access_token" {
	type = string	
}

variable "ado_project_name" {
	type = string
}
