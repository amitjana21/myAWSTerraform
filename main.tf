
resource "aws_instance" "server1" {
  ami                    = var.ami_id
  instance_type          = var.ec2_insance_size
  key_name               = var.ec2_key_name
  vpc_security_group_ids = var.security_group_id
  subnet_id              = var.subnet_id
  

  disable_api_termination = true
  #ebs_optimized           = true

  root_block_device {
    volume_size           = "50"
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = false
    #kms_key_id = var.kms_key_id
  }


  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}

output "server1" {
  value = aws_instance.server1.availability_zone
}

resource "aws_ebs_volume" "volume1" {
  availability_zone = aws_instance.server1.availability_zone
  size              = 10
  tags = {
    Name = "ebs-for-test-servermount"
  }
}

resource "aws_volume_attachment" "volume_attachment" {
  device_name = "/dev/xvdh"
  instance_id = aws_instance.server1.id
  volume_id   = aws_ebs_volume.volume1.id
}

# resource "aws_ebs_volume" "ebs-volume-1" {
#   availability_zone = "us-east-2a"
#   size              = "20"
#   #type              = "st1"
# }

# resource "aws_volume_attachment" "ebs-volume-1-attachment" {
#   device_name = "/dev/sdf"
#   volume_id   = "aws_ebs_volume.ebs-volume-1.id"
#   instance_id = "aws_instance.server1.id"
# }

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.server1.id
  allocation_id = "eipalloc-0ff89f369632c2002"
  #public_ip = "3.135.75.62"
}