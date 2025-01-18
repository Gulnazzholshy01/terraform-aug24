resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  tags = {
    Name = "my-server-${var.env}" //user2 removes
    Env = var.env //user 1 adds

  }
}

/*
1. Create DynamoDB table  DONE
2. Update backend s3
*/