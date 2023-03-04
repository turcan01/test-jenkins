output "instance1" {
    value= module.aws_ec2.ec2_instance1.public_ip
}
output "instance2" {
    value= module.aws_ec2.ec2_instance2.public_ip
}
output "rds_endpoint" {
    value = module.rds_endpoint
  
}
