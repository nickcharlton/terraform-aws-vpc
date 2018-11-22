output "security_group_db_id" {
  value = "${aws_security_group.db.id}"
}

output "security_group_app_id" {
  value = "${aws_security_group.app.id}"
}

output "security_group_web_id" {
  value = "${aws_security_group.web.id}"
}

output "security_group_bastion_id" {
  value = "${aws_security_group.bastion.id}"
}

output "aws_subnet_public_id" {
  value = "${aws_subnet.public.id}"
}

output "aws_subnet_private_app_id" {
  value = "${aws_subnet.private_app.id}"
}

output "aws_subnet_private_db_id" {
  value = "${aws_subnet.private_db.id}"
}

output "security_group_appCitizen_id" {
  value = "${aws_security_group.appcitizen.id}"
}