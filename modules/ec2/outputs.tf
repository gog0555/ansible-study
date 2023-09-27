output "pub_instance1a_ip" {
    value = aws_instance.pub_instance1a.public_ip
}

output "ec2_sg_id" {
    value = aws_security_group.ec2_sg.id
}
