
/*
  Provides SSH connectivity to the private subnets.  
  See: https://medium.com/@williamtsoi/convenient-ssh-proxying-through-a-bastion-host-cef9eb832100 & 
  https://aws.amazon.com/blogs/security/securely-connect-to-linux-instances-running-in-a-private-amazon-vpc/
*/

resource "aws_instance" "bastion" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "us-west-2a"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    security_groups = ["${module.vpc.security_group_bastion_id}"]
    //vpc_security_group_ids = ["${aws_security_group.vpc_bastion.id}"]
    subnet_id = "${module.vpc.aws_subnet_public_id}"
    source_dest_check = false

    tags {
        Name = "The Bastion"
    }
}

resource "aws_eip" "bastion" {
  instance = "${aws_instance.bastion.id}"
  vpc      = true
}
