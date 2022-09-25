resource "aws_instance" "web" {
  count                  = var.ec2_count
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  subnet_id              = aws_subnet.main.*.id[count.index]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.ec2_key_pair.key_name
  user_data              = file("scripts/jenkins.sh")

  tags = {
    Name = "Glofex-${count.index}"
  }
}