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
        security_groups = ["${aws_security_group.app.id}"]
    }
    ingress { # MySQL
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.app.id}"]
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
        security_groups = ["${aws_security_group.web.id}"]
    }
    ingress { # http 80
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
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
}