module "configuration1" {
 source = "./nic"
  nic = "sasi_nic"
  ipconfig = "sasiip"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid
}
module "configuration2" {
  source = "./resource group"
  resource_group = "sasiRG"
  location = "eastus"
  }

module "configuration3" {
  source = "./vm"
  vm= "sasivm1"
  size = "standard_f2"
  vmuser_name = "sasiweb1"
  user_password = "websasi@2022"
  rights = "ReadWrite"
  storage = "Standard_LRS"
  micsft = "microsoftwindowsserver"
  win = "windowsserver"
  vmwin_versing = "2016-datacenter"
  location = "eastus"
  rg = module.configuration2.rgid
  nic = module.configuration1.nicid
}
module "configuration4" {
  source = "./vnet"
  vnet = "sasivnet"
  cidr_block = "192.168.0.0/16"
  vsub = "sasisubnet"
  ip_address = "192.168.2.0/24"
  location = "eastus"
  rg = module.configuration2.rgid
}