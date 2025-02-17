# Zona hospedada no Route53
resource "aws_route53_zone" "devsecops_zone" {
  name = "devsecops.local"
  
  vpc {
    vpc_id = aws_vpc.main.id
  }

  tags = {
    Environment = "dev"
  }
}

# Registro A apontando para a instância EC2
resource "aws_route53_record" "example" {
  zone_id = aws_route53_zone.devsecops_zone.zone_id
  name    = "app.devsecops.local"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.example.public_ip]  
}