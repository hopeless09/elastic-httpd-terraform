resource "aws_elb" "elb" {
  name               = "apache-httpd-loadbalancer"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  security_groups    = ["${aws_security_group.sg-httpd.id}"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }

  instances                   = ["${aws_instance.httpd.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "apache-httpd-loadbalancer"
  }
}