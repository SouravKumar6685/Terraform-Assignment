resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.project_name}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.asg_sg.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.asg_instance_profile.name
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-ec2"
    }
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    echo "Hello from Auto Scaling Group!" > /var/www/html/index.html
    systemctl restart apache2
  EOF
  )
}
