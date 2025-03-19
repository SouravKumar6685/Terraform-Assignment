resource "aws_lb" "alb" {
    name = "${var.project_name}-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb_sg.id]
    subnets = var.public_subnets

    enable_deletion_protection = false

    tags = {
        Name = "${var.project_name}-alb"
    }
}

resource "aws_lb_target_group" "tg" {
    name = "${var.project_name}-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id

    health_check {
      path = "/"
      interval = 30
      timeout = 5
      healthy_threshold = 2
      unhealthy_threshold = 2
    }

    tags = {
        Name = "${var.project_name}-target-group"
    }
}

resource "aws_lb_listener" "https"{
    load_balancer_arn = aws_lb.alb.arn
    port = 443
    protocol = "HTTPS"
    ssl_policy = "ELBSecurityPolicy-2016-18"
    certificate_arn = var.ssl_certificate_arn

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.tg.arn
    }
}