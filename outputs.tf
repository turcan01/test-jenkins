output "instances1" {
    value = module.ec2_instance1.ipv4
}
output "instances2" {
    value = module.ec2_instance2.ipv4
}
output "rds_endpoint" {
    value = module.rds.endpoint
}
