module "allow_all_workbuddy_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name = "allow-all-workbuddy"
  description = "Security group that allows all inbound and outbound traffic"

  ingress_with_cidr_blocks = [
    {
      from_port   = var.workbuddy_ports.ui_port
      to_port     = var.workbuddy_ports.api_port
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0" # Allows traffic from anywhere
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1" # All protocols
      cidr_blocks = "0.0.0.0/0" # Allows traffic to anywhere
    }
  ]

  tags = {
    Name = "allow-all-workbuddy"
    Application = "WorkBuddy"
  }
}