provider "aws" {
  region = "us-east-1"
}

resource "aws_sns_topic" "my_sns_topic_name" {
  name = var.sns_topic_name
  display_name = var.sns_topic_name
  tags = {
    "Name" = var.sns_topic_name
  }
}

resource "aws_sns_topic_subscription" "my_sns_topic_name_subscription" {
  topic_arn = aws_sns_topic.my_sns_topic_name.arn
  protocol  = "sms"
  endpoint  = var.phone_number
}

resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = "alarm-billing-exceeded"
  comparison_operator       =  "GreaterThanOrEqualToThreshold" # LessThanOrEqualToThreshold
  evaluation_periods        = "1"
  metric_name               = "EstimatedCharges"
  namespace                 = "AWS/Billing"
  period                    = "21600"
  statistic                 = "Maximum"
  threshold                 = var.billing_total
  alarm_description         = "Billing Alarm Greater than 1 dollar"
  alarm_actions       = [aws_sns_topic.my_sns_topic_name.arn]
  
  dimensions = {
      Currency = var.currency
  }
}
