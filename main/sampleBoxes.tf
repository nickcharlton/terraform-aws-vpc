resource "aws_instance" "testApp" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "us-west-2a"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    security_groups = ["${module.vpc.security_group_app_id}","${module.vpc.security_group_appCitizen_id}"]
    //vpc_security_group_ids = ["${aws_security_group.vpc_bastion.id}"]
    subnet_id = "${module.vpc.aws_subnet_private_app_id}"
    source_dest_check = false

    tags {
        Name = "The Test Box"
    }
}