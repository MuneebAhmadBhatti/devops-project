provider "aws" {
  region = "us-east-1"  # Ensure you're in the correct region
}

resource "aws_instance" "node_app_instance" {
  ami           = "ami-002c18240e702b6cf"  # Ubuntu 22.04 AMI (x86_64)
  instance_type = "t3.micro"               # x86_64 compatible instance type
  key_name      = "devops-ssh-key"         # The name of your key pair created in AWS

  # Install Docker and Docker Compose during instance initialization
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable docker
              yum install -y docker
              service docker start
              usermod -aG docker ec2-user
              curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose
              EOF

  tags = {
    Name = "NodeAppInstance"
  }
}

output "instance_ip" {
  value = aws_instance.node_app_instance.public_ip
}
