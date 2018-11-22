/*
  Security Groups ... these are the specific ingress / egress rules (vs. the citizens found at citizens.tf)
*/

/*
  Database Servers
*/
resource "aws_security_group" "db" {
    name = "vpc_db"
    description = "Allow incoming database connections."

    ingress { # reThink dB
        from_port = 28015
        to_port = 28015
        protocol = "tcp"
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }
    ingress { # MySQL
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "dB Security Group"
    }
}

/*
  Application Servers
*/
resource "aws_security_group" "app" {
    name = "vpc_app"
    description = "Allow incoming app connections."

    ingress { # tomcat etc
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        security_groups = ["${aws_security_group.webcitizen.id}"]
    }
    ingress { # http 80
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = ["${aws_security_group.webcitizen.id}"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    egress { # reThink dB
        from_port = 28015
        to_port = 28015
        protocol = "tcp"
        security_groups = ["${aws_security_group.dbcitizen.id}"]
    }
    egress { # MySQL
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.dbcitizen.id}"]
    }
    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "App Server Security Group"
    }
}

/*
  Web Servers
*/
resource "aws_security_group" "web" {
    name = "vpc_web"
    description = "Allow incoming HTTP connections."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress { # tomcat etc
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }
    egress { # http 80
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = ["${aws_security_group.appcitizen.id}"]
    }
    egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Web / Frontend Security Group"
    }

}

/*
  Web Servers
*/
resource "aws_security_group" "bastion" {
    name = "vpc_bastion"
    description = "Bastion SSH allowance"

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress { 
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Bastion Security Group"
    }

}


