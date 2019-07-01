data "aws_ami" "centos" {
owners      = ["679593333241"]
most_recent = true

  filter {
      name   = "name"
      values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
      name   = "architecture"
      values = ["x86_64"]
  }

  filter {
      name   = "root-device-type"
      values = ["ebs"]
  }
}


resource "aws_instance" "httpd" {
  ami                           = "${data.aws_ami.centos.id}"
  instance_type                 = "t2.medium"
  vpc_security_group_ids        = ["${aws_security_group.sg-httpd.id}", "${aws_security_group.sg-ssh.id}"]
  key_name                      = "demo"
  iam_instance_profile          = "prowler"
  root_block_device {
    volume_size = "10"
    delete_on_termination = true
  }

  tags = {
    Name = "Apache-HTTPD"
  }

    provisioner "remote-exec" {
        connection {
            type     = "ssh"
            user     = "centos"
            private_key = "${file("/root/demo.pem")}"
            host = "${aws_instance.httpd.public_ip}"
        }

        inline = [
            "sudo yum install epel-release -y",
            "sudo yum install git ansible -y",
            "ansible-pull -U https://rkb03:password@gitlab.com/raghuk.vit/elasticsearch-nginx.git install.yml -e elasticsearch_url=${var.elastic_url} -e ACCESS_KEY=AKIAWXUXHYHTH7BYISFJ -e SECRET_KEY=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"
        ]
  }

}