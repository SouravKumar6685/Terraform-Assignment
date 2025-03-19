output "alb_dns_name" {
  description = "DNS Name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "alb_target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.tg.arn
}
