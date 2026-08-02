variable "amazon" {
  description = "AMI ID for EC2 instances"
  default = "ami-07caf09b362be10b8"
}

variable "ubuntu" {
  description = "AMI ID for EC2 instances"
  default = "ami-04a81a99f5ec58529" # Ubuntu-24.04
  #default = "ami-0a0e5d9c7acc336f1" # Ubuuntu-22.04
}

variable "inst_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}
variable "key" {
  type = string
}
variable "vpc-sg" {
  type = list(string)
}
variable "subnet" {
  type = string
}
