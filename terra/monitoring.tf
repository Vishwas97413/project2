# Create an SNS Topic for alerts
resource "aws_sns_topic" "alerts" {
  name = "portfolio-alerts-topic"
}

# Subscribe your email address to the topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "vishwasprabhu99@gmail.com"
}

# Create a CloudWatch Alarm for high CPU utilization
resource "aws_cloudwatch_metric_alarm" "ec2_cpu_high" {
  alarm_name          = "portfolio-ec2-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300 # 5 minutes
  statistic           = "Average"
  threshold           = 20
  alarm_description   = "This metric monitors ec2 cpu utilization"
  
  dimensions = {
    InstanceId = "i-04b2ecf9855c813b7"
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
}
