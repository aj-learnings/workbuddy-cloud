output "workbuddy-ui" {
  value = "Workbuddy application(UI) is running at http://${module.workbuddy_app_ec2.public_ip}:${var.workbuddy_ports.ui_port}"
}

output "workbuddy-api" {
  value = "Workbuddy application(API) is running at http://${module.workbuddy_app_ec2.public_ip}:${var.workbuddy_ports.api_port}/api/workbuddy"
}