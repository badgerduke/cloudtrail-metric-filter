resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = var.custom_trail_cw_log_group_name
  retention_in_days = 3
}

resource "aws_cloudwatch_log_metric_filter" "count_cloudtrail_modifications" {
  name           = var.metric_filter_name
  pattern        = var.metric_filter_pattern
  log_group_name = aws_cloudwatch_log_group.cloudwatch_log_group.name

  metric_transformation {
    name      = var.metric_filter_metric_name
    namespace = var.metric_filter_metric_namespace
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "demo_alarm" {
  alarm_name          = var.alarm_name
  metric_name         = aws_cloudwatch_log_metric_filter.count_cloudtrail_modifications.metric_transformation[0].name
  threshold           = "2"
  statistic           = "Sum"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  evaluation_periods  = "1"
  period              = "120"
  namespace           = aws_cloudwatch_log_metric_filter.count_cloudtrail_modifications.metric_transformation[0].namespace
  alarm_actions       = [aws_sns_topic.example_sns_topic.arn]
}