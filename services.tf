variable "service_a_image" {
  description = "463646775279.dkr.ecr.eu-north-1.amazonaws.com/service-a"
}

variable "service_b_image" {
  description = "463646775279.dkr.ecr.eu-north-1.amazonaws.com/service-b"
}

variable "service_c_image" {
  description = "463646775279.dkr.ecr.eu-north-1.amazonaws.com/service-c"
}

resource "aws_ecs_task_definition" "service_a" {
  family                   = "service-a"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name  = "service-a"
      image = var.service_a_image
      portMappings = [{
        containerPort = 8080
      }]
    }
  ])
}

resource "aws_ecs_service" "service_a" {
  name            = "service-a"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.service_a.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.public.id]
    assign_public_ip = true
  }

  service_registries {
    registry_arn = aws_service_discovery_service.service_a.arn
  }
}


# --------------------
# SERVICE B
# --------------------


resource "aws_ecs_task_definition" "service_b" {
  family                   = "service-b"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name  = "service-b"
      image = var.service_b_image
      portMappings = [{
        containerPort = 8080
      }]
    }
  ])
}

resource "aws_ecs_service" "service_b" {
  name            = "service-b"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.service_b.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.public.id]
    assign_public_ip = true
  }

  service_registries {
    registry_arn = aws_service_discovery_service.service_b.arn
  }
}


# --------------------
# SERVICE C
# --------------------


resource "aws_ecs_task_definition" "service_c" {
  family                   = "service-c"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name  = "service-c"
      image = var.service_c_image
      portMappings = [{
        containerPort = 8080
      }]
    }
  ])
}

resource "aws_ecs_service" "service_c" {
  name            = "service-c"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.service_c.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.public.id]
    assign_public_ip = true
  }

  service_registries {
    registry_arn = aws_service_discovery_service.service_c.arn
  }
}
