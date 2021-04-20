provider "aws" {
     region = "us-east-1"
     profile = "default"
}
resource "aws_instance" "despliegue-terraform-ec2" {
    ami                 = "ami-0742b4e673072066f"
    instance_type       = "t2.micro"
    key_name            = "ssh-key-pair"
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    #security_groups = ["allow-ssh"]
    subnet_id = aws_subnet.vpc-subnet-us-east-1a.id
    tags = {
        Name        = "test-terraform-ec2"
        terraform   = "True"
    }
}