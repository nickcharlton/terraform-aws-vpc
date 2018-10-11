resource "aws_instance" "testApp" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "us-west-2a"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    security_groups = ["${aws_security_group.appcitizen.id}","${aws_security_group.app.id}"]
    //vpc_security_group_ids = ["${aws_security_group.vpc_bastion.id}"]
    subnet_id = "${aws_subnet.private_app.id}"
    source_dest_check = false

    tags {
        Name = "The Test Box"
    }
}