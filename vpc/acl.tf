resource "aws_network_acl" "aclDb" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = "${aws_subnet.private_db.id}"

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.private_app_subnet_cidr}"
  }

  tags = {
    Name = "aclDb"
  }
}

resource "aws_network_acl" "aclApp" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = "${aws_subnet.private_app.id}"

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.public_subnet_cidr}"
  }

  tags = {
    Name = "aclApp"
  }
}

resource "aws_network_acl" "aclWeb" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = "${aws_subnet.public.id}"

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "aclWeb"
  }
}
