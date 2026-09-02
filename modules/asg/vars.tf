variable "image_id" {
    type = string
}
variable "inst_type" {
  type = string
}
variable "sg_ids" {
    type = string
}
variable "key_name" {
    type = string
}
variable "arn_id" {
    type = string
  
}
variable "subnet" {
  type = list(string)
}
variable "target_arn" {
  type = string
}