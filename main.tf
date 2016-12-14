data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "phpmyadmin" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_size}"
  key_name = "${var.key_name}"
  user_data = "${data.template_file.init.rendered}"
  vpc_security_group_ids = ["${split(",",var.security_group_id)}"]
  subnet_id = "${var.subnet_id}"

  tags {
    Name = "phpmyadmin"
  }
}

data "template_file" "init" {
    template = "${file("${path.module}/files/cloudinit.yml")}"

    vars {
        setup_password = "${var.phpmyadmin_setup_password}"
        config_file_contents = "${base64encode(var.configuration)}"
    }
}
