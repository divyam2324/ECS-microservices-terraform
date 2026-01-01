resource "aws_service_discovery_private_dns_namespace" "ns" {
  name = "myapp.local"
  vpc  = aws_vpc.main.id
}
