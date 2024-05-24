output "instance_public_ip" {
    value = module.ec2_instance.public-ip-address
}
output "instance_type" {
    value = module.ec2_instance.instance_type
}
output "sri_public_ip" {
    value = module.sri_instance.public-ip-address
}

output "sri_type" {
    value = module.sri_instance.instance_type
}

output "demo_pubilc_ip" {
    value = module.demo_devops.public-ip-address
}

output "demo_instance" {
    value = module.demo_devops.instance_type 
}