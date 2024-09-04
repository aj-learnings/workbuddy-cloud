module "workbuddy_app_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"

  name = "workbuddy-app"

  ami = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [module.allow_all_workbuddy_sg.security_group_id]

  user_data = file("./deploy-workbuddy-docker.sh")

  metadata_options = {
    http_tokens = "required"
  }

  tags = {
    Name = "workbuddy-app",
    Application = "WorkBuddy"
  }
}