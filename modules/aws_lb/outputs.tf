output "elb_id" {
  value = aws_elb.elb.id
}
output "elb_name" {
  value = aws_elb.elb.name
}
output "elb_dns" {
  value = aws_elb.elb.dns_name
}