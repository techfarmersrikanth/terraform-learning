output "instance_public_ip" {
    value = module.ec2_instance.public-ip-address
}
output "instance_type" {
    value = module.ec2_instance.instance_type
}

