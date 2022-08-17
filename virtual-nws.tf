# Create Virtual Network
resource "azurerm_virtual_network" "devvnet1" {
  name                = "dev-vnet-1-terraform"
  address_space       = [var.azure_vn_cidr]
  location            = azurerm_resource_group.devrg1.location
  resource_group_name = azurerm_resource_group.devrg1.name
 
  tags = local.common_tags
}

# Create Subnet
resource "azurerm_subnet" "devsubnet1" {
  name                 = "dev-subnet-1-terraform"
  resource_group_name  = azurerm_resource_group.devrg1.name
  virtual_network_name = azurerm_virtual_network.devvnet1.name
  address_prefixes     = [var.azure_subnet_cidr]


}

# Create Subnet
resource "azurerm_subnet" "devsubnet2" {
  name                 = "dev-subnet-2-terraform"
  resource_group_name  = azurerm_resource_group.devrg1.name
  virtual_network_name = azurerm_virtual_network.devvnet1.name
  address_prefixes     = [var.azure_subnet_cidr2]


}

# Create Public IP Address
resource "azurerm_public_ip" "devpublicip" {
  name                = "dev-publicip-1-terraform"
  resource_group_name = azurerm_resource_group.devrg1.name
  location            = azurerm_resource_group.devrg1.location
  allocation_method   = "Static"
 tags = local.common_tags
}

# Create Network Interface
resource "azurerm_network_interface" "devvmnic" {
  name                = "dev-vm-nic-1"
  location            = azurerm_resource_group.devrg1.location
  resource_group_name = azurerm_resource_group.devrg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.devsubnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devpublicip.id
  }

  tags = local.common_tags
}


resource "azurerm_network_security_group" "dev-sg-1" {
    name                = "dev-instance-nsg"
    location            = azurerm_resource_group.devrg1.location
    resource_group_name = azurerm_resource_group.devrg1.name

    security_rule {
        name                       = "HTTP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "SSH"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

