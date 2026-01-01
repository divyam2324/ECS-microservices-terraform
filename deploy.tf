data "aws_ecs_cluster" "existing" {
  cluster_name = "java-microservices-cluster"
}

data "aws_ecs_service" "service_a" {
  cluster_arn  = data.aws_ecs_cluster.existing.arn
  service_name = "service-a"
}
