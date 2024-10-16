variable "instance_type" {
  type = string
  description = "Type of Ec2 instance"
}

variable "workbuddy_ports" {
  type = map(string)
  description = "UI and API port of Workbuddy app"
}