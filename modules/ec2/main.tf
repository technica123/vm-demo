
resource "aws_instance" "node" {
  for_each = var.instance_types

  ami                    = var.ami_id
  instance_type          = each.value
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "${var.project_name}-${each.key}"
  }
}
