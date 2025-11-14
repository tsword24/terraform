resource "aws_instance" "example" {
  ami = var.ami_id
  instance_type=var.instance_type
  vpc_security_group_ids=[aws_security_group.allow-all-terraform.id]
  tags = var.ec2_type
}

resource "aws_security_group" "allow-all-terraform" {
  name   = var.sg_name

    egress {
    from_port        = var.egress_from_port #from port 0 to all the ports
    to_port          = var.egress_to_port
    protocol         = var.protocol # -1 for all protocol
    cidr_blocks      = var.cidr
  }

  ingress {
    from_port        = var.ingress_from_port #from port 0 to all the ports
    to_port          = var.ingress_to_port
    protocol         = var.protocol # -1 for all protocol
    cidr_blocks      = var.cidr
  }

  tags={
    Name="allow-all-terraform"
    }

}