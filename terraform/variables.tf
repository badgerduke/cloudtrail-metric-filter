variable "custom_trail_name" {
 type = string
 description = "The name of the custom Cloudtrail trail"
}

variable "custom_trail_s3_prefix" {
 type = string
 description = "The S3 prefix in the bucket storing CloudTrail logs"
}

variable "custom_trail_S3_name" {
 type = string
 description = "The name of the S3 bucket storing the custom trail logs"
}

variable "custom_trail_cw_log_group_name" {
 type = string
 description = "The name of the CloudWatch log group to deliver CloudTrail logs"
}

variable "metric_filter_name" {
 type = string
 description = "The name of the CloudWatch metric filter"
}

variable "metric_filter_pattern" {
 type = string
 description = "The metric filter pattern"
}

variable "metric_filter_metric_namespace" {
 type = string
 description = "The custom namespace for the produced metric"
}

variable "metric_filter_metric_name" {
 type = string
 description = "The name of the metric to store filter matches"
}

variable "alarm_name" {
 type = string
 description = "The name of the CloudWatch Alarm"
}

variable "security_group_name" {
 type = string
 description = "The name of the security group"
}

variable "sns_topic_name" {
 type = string
 description = "The name of the SNS topic"
}

variable "sns_email" {
 type = string
 description = "The email address subscibing to the SNS topic"
}

