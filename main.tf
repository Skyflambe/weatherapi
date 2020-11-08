provider "azurerm" {
    version = "~>2.34.0"
    features {}
}

variable "imagebuild" {
    type = string
    description = "Latest image build number"
}

resource "azurerm_resource_group" "tf_test" {
    name                        = "tf_sky_test01_main_rg"
    location                    = "Australia East"
}

resource "azurerm_container_group" "tf_cont_test" {
    name                        = "weatherapi"
    location                    = azurerm_resource_group.tf_test.location
    resource_group_name         = azurerm_resource_group.tf_test.name 

    ip_address_type             = "public"
    dns_name_label              = "skyflambewa"
    os_type                     = "Linux"

    container  {
        name                    = "weatherapi"
        image                   = "skyflambe/weatherapi:${var.imagebuild}"
        cpu                     = "1"
        memory                  = "1"

        ports {
            port                = 80 
            protocol            = "TCP"
        }
    }
}