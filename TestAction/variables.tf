variable "location" {
  type        = string
  description = "Location of the resource"
  default     = "westeurope"
}
variable "rg_name" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-web-x"
}

variable "sa_name" {
  type        = string
  description = "Name of the storage account"
  default     = "sawebx"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
  default     = "<h1>Yadda! Test-webpage made with Terraform for the following workspace:</h1>"
}

variable "index_document" {
  type        = string
  description = "Name of the index document"
  default     = "index.html"
}
