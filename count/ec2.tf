resource "aws_instance" "terraform" {
  count=4
  ami = "ami-09c813fb71547fc4f"
  instance_type="t3.micro"
  vpc_security_group_ids=[aws_security_group.allow-all-terraform.id]
  tags = {
    Name = var.instance_type[count.index]
    Terraform = true
  }
}

resource "aws_security_group" "allow-all-terraform" {
  name   = "allow-all-terraform"

    egress {
    from_port        = 0 #from port 0 to all the ports
    to_port          = 0
    protocol         = "-1" # -1 for all protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 0 #from port 0 to all the ports
    to_port          = 0
    protocol         = "-1" # -1 for all protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags={
    Name="allow-all-terraform"
    }

}