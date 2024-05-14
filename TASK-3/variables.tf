#Network 1
variable "net1" {
type = string
default = "madrid-net"
}
#>>>
#Subnet 1
variable "net1_sub1" {
    type = string
    default = "madrid-office"
}

variable "net1_sub1_iprange" {
    type = string
    default = "10.206.44.0/24"
}

variable "net1_sub1_region" {
    type = string
    default = "europe-southwest1"
}
#>>>

#Network 2
variable "net2" {
type = string
default = "osaka-net"
}
#>>>
#Subnet 1
variable "net2_sub1" {
    type = string
    default = "osaka-office"
}

variable "net2_sub1_iprange" {
    type = string
    default = "192.168.44.0/24"
}

variable "net2_sub1_region" {
    type = string
    default = "asia-northeast2"
}
#>>>

#Bucket Variable
variable "ninja_bucket" {
  type = string
  default = "dev_ops_plumber"
  description = "A True Ninja Never Makes A Sound"
}

#Bucket Region
variable "ninja_bucket_region" {
  type = string
  default = "europe-southwest1"
}

variable "content_source1" {
  default = "C:/Users/harri/OneDrive/Pictures/PIPE WRENCH.jpg"
}

variable "content_source2" {
  default = "C:/Users/harri/OneDrive/Desktop/AWS Certs/image (1).png"
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#VM Instances
#>>>

#Main Madrid Office VM Instance
variable "vm_name" {
  type = string
  default = "engine-1"
}

variable "vm_machine_type" {
  type = string
  default = "e2-medium"
}

variable "vm_zone" {
  type = string
  default = "europe-southwest1-b"
}

variable "vm_image" {
  type = string
  default = "debian-cloud/debian-11"
}

variable "vm_subnetwork" {
  type = string
  default = "projects/gcp-tutorial-project-1-417922/regions/europe-southwest1/subnetworks/madrid-office"
  
}

variable "vm_metadata" {
  type = string
  default = "startupscript.sh"
}
#>>>

#Main Osaka Office VM Instance
variable "vm2_name" {
  type = string
  default = "engine-2"
}

variable "vm2_machine_type" {
  type = string
  default = "n2d-standard-2"
}

variable "vm2_zone" {
  type = string
  default = "asia-northeast2-b"
}

variable "vm2_image" {
  type = string
  default = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240415"
}

variable "vm2_subnetwork" {
  type = string
  default = "projects/gcp-tutorial-project-1-417922/regions/asia-northeast2/subnetworks/osaka-office"
  
}

