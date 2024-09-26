module "workbuddy_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name = "workbuddy-sg"
  description = "Security group for the workbuddy application"

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
    Name = "workbuddy-sg"
    Application = "WorkBuddy"
  }
}