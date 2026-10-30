
resource "aws_security_group" "main" {
  name        = "${var.project_name}-sg"
  description = "Security group for monitoring demo"
  vpc_id      = var.vpc_id

  # SSH, Jenkins aur Grafana: sirf aapke IP se
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    description = "Grafana"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  # VictoriaMetrics components ke beech internal traffic
  ingress {
    description = "VictoriaMetrics internal ports"
    from_port   = 8400
    to_port     = 8482
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "vmagent"
    from_port   = 8429
    to_port     = 8429
    protocol    = "tcp"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}
