
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_elasticsearch_domain" "sample" {
  domain_name           = "${var.domain_name}"
  elasticsearch_version = "6.7"

  cluster_config {
    instance_type = "t2.medium.elasticsearch"
  }

  ebs_options {
      ebs_enabled = true
      volume_size = 10
  }

  tags = {
    Domain = "SampleDomain"
  }
  access_policies = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "es:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain_name}/*",
      "Condition": {
        "IpAddress": {"aws:SourceIp": ["0.0.0.0/0"]}
      }
    }
  ]
}
POLICY
}



