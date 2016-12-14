variable "configuration" {
  description = "The full contents of your PMA configuration file."
}
variable "subnet_id" {
  description = "AWS Subnet to launch EC2 instance in"
}

variable "security_group_id" {
  description = "AWS VPC Subnet ID to apply to instance. Comma seperate multiple groups."
}

variable "key_name" {
  description = "Name of the keypair to initially launch with."
}

variable "phpmyadmin_setup_password" {
  description = "Setup password for PHPMyadmin Web Interface and config database."
}

variable "instance_size" {
  default = "t2.nano"
  description = "AWS instance size"
}
