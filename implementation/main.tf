resource "aws_instance" "publi-server" {

  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "devopskey2"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("apache.sh")
  tags = {
    Name = "${var.env_prefix}-public-server"
  }
}
resource "aws_instance" "private-server" {

  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "devopskey2"
  subnet_id                   = aws_subnet.myapp-subnet-2.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true

  tags = {
    Name = "${var.env_prefix}-private-server"
  }
}