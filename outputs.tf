output "instance_public_hostname" {
  value = "${aws_instance.phpmyadmin.public_dns}"
}

output "instance_public_ip" {
  value = "${aws_instance.phpmyadmin.public_ip}"
}

output "instance_private_hostname" {
  value = "${aws_instance.phpmyadmin.private_dns}"
}

output "instance_private_ip" {
  value = "${aws_instance.phpmyadmin.private_ip}"
}

output "instance_net_interface_id" {
  value = "${aws_instance.phpmyadmin.network_interface_id}"
}
