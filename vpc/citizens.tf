/*
  Security Group "citizens".  Used for the other rule based security groups to formulate ingress / egress rules.
*/

resource "aws_security_group" "dbcitizen" {
    name = "vpc_dbcitizen"
    description = "A dB citizen"

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "dB Citizen"
    }

}

resource "aws_security_group" "appcitizen" {
    name = "vpc_appcitizen"
    description = "An app citizen"

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "App server Citizen"
    }
}

resource "aws_security_group" "webcitizen" {
    name = "vpc_webcitizen"
    description = "A web citizen"

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Web / Frontend Citizen"
    }
}