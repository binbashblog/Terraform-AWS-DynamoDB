output "DynamoDB Table ARN" {
  value       = "${aws_dynamodb_table.dynamodb_table.arn}"
  description = "DynamoDB Table ARN"
}
