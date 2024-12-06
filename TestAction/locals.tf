locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  web_suffix       = "<h1>${terraform.workspace}</h1>"

  rg_name = "${var.rg_name}-${local.workspace_suffix}"
  sa_name = "${var.sa_name}${local.workspace_suffix}"
}
