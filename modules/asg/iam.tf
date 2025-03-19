resource "aws_iam_role" "asg_role" {
  name = "${var.project_name}-asg-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "asg_policy_attachment" {
  name       = "asg-policy-attachment"
  roles      = [aws_iam_role.asg_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_instance_profile" "asg_instance_profile" {
  name = "${var.project_name}-instance-profile"
  role = aws_iam_role.asg_role.name
}
