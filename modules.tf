module "elastic" {
  source = "./MODULES/elastic"
  
}

module "ec2" {
  source = "./MODULES/ec2"
  elastic_url = "${module.elastic.elastic-url}"
}
