/*
  Our VPC
*/
resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true

    tags {
        Name = "Default VPC"
    }

}

/*
  Internet gateway
*/
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}

/*
  Public Subnet
*/
resource "aws_subnet" "public" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true

    tags {
        Name = "Public Subnet"
    }
}

/*
  Routing table and Association
*/
resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
}

resource "aws_route_table_association" "public" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.public.id}"
}

/*
  Private Subnets
*/
resource "aws_subnet" "private_app" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_app_subnet_cidr}"
    availability_zone = "us-west-2a"

    tags {
        Name = "Private App Subnet"
    }
}

resource "aws_subnet" "private_db" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_db_subnet_cidr}"
    availability_zone = "us-west-2a"

    tags {
        Name = "Private dB Subnet"
    }
}