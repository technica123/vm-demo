
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "jenkins_public_ip" {
  value = module.ec2.public_ips["jenkins"]
}

output "storage_public_ip" {
  value = module.ec2.public_ips["storage"]
}

output "ingest_public_ip" {
  value = module.ec2.public_ips["ingest"]
}

output "query_public_ip" {
  value = module.ec2.public_ips["query"]
}
