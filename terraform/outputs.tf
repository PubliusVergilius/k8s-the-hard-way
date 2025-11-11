output "master-ip" {
  description = "Master node private ip"
  value = aws_instance.master.private_ip
  depends_on = [ aws_instance.master ]
}

output "worker1-ip" {
  description = "Worker 1 node private ip"
  value = aws_instance.worker1.private_ip
  depends_on = [ aws_instance.master ]
}

output "worker2-ip" {
  description = "Worker 2 node private ip"
  value = aws_instance.worker2.private_ip
  depends_on = [ aws_instance.master ]
}

output "master-fqdn" {
  description = "Master node FQDN"
  value = aws_instance.master.private_dns
  depends_on = [ aws_instance.master ]
}

output "worker1-fqdn" {
  description = "Worker 1 node FQDN"
  value = aws_instance.worker1.private_dns
  depends_on = [ aws_instance.master ]
}

output "worker2-fqdn" {
  description = "Worker 2 nodek FQDN"
  value = aws_instance.worker2.private_dns
  depends_on = [ aws_instance.master ]
}

