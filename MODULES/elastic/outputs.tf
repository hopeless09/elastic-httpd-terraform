output "elastic-url" {
  value = "${aws_elasticsearch_domain.sample.endpoint}"
}
