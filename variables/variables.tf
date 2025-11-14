variable "ami_id"{
    type=string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type"{
    type=string
    default="t3.micro"
}

variable "ec2_type"{
    type=map
    default={
        Name="terraform-demo"
        Terraform="true"
        Project="join devops"
        Environment="dev"   
    }
}

variable "sg_name"{
    type=string
    default="allow-all-terraform"
    #optional to inform this variable what's it doing 
    description="Security group name attached to ec2" 
}


variable "cidr"{
    type=list
    default=["0.0.0.0/0"]
}

variable "ingress_from_port"{
    default=0
}

variable "ingress_to_port"{
    default=0
}
variable "egress_from_port"{
    default=0
}

variable "egress_to_port"{
    default=0
}

variable "protocol"{
    type=string
    default="-1"
}