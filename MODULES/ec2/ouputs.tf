output "elb-public-name" {
  value = "${aws_elb.elb.dns_name}"
}
