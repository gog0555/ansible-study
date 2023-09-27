output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet1a_id" {
  value = module.network.public_subnet1a_id
}

output "private_subnet1a_id" {
  value = module.network.private_subnet1a_id
}

output "pub_instance1a_ip" {
  value = module.ec2.pub_instance1a_ip
}
