moved {
  from = "aws_instance.ec2"
  to   = "aws_instance.ec2[0]"
}

moved {
  from = aws_instance.a
  to   = aws_instance.b
}

moved {
  from = aws_instance.a
  to   = aws_instance.a["small"]
}