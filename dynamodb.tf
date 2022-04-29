locals {
  key_lookup_table_base_name = "dyndb-${var.service}-${var.environment}"
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name = "${local.key_lookup_table_base_name}-${var.suffix}"
  billing_mode = "PAY_PER_REQUEST"
  point_in_time_recovery  = {
    enabled = "${var.point_in_time_recovery}"
  }
  read_capacity = 20
  write_capacity = 30
  stream_enabled = true
  stream_view_type = "NEW_IMAGE"

  hash_key = "Id"
  attribute {
    name = "Id"
    type = "S"
  }
  # Add a map of standards tags for this resource to a map of tags passed into the module:
  tags = "${merge(map(
    "Name", "${local.key_lookup_table_base_name}-${var.suffix}"),
    local.all_tags
  )}"
}

