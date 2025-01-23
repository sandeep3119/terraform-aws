output "route_table_ID" {
  value = aws_route_table.AppRouteTable.id
}
output "WebServer1_public_ip" {
  value = aws_instance.WebServer1.public_ip
}
output "WebServer2_public_ip" {
  value = aws_instance.WebServer2.public_ip
}
output "instance1_id" {
  value = aws_instance.WebServer1.id
}
output "instance2_id" {
  value = aws_instance.WebServer2.id
}