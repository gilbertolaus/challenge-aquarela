# Tabela DynamoDB
data "aws_dynamodb_table" "existing" {
  name = "devsecops-table"
}

resource "aws_dynamodb_table" "devsecops_table" {
  count        = data.aws_dynamodb_table.existing.id != "" ? 0 : 1
  name         = "devsecops-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
}

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Environment = "dev"
  }
}