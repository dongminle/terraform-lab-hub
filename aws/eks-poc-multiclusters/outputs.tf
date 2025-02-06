output "vpc_id" {
  value = data.aws_vpc.uplus.id
}

output "sbn_puba_id" {
  value = data.aws_subnet.puba.id
}

output "sbn_pubc_id" {
  value = data.aws_subnet.pubc.id
}

output "sbn_pria_id" {
  value = data.aws_subnet.pria.id
}

output "sbn_pric_id" {
  value = data.aws_subnet.pric.id
}

output "sbn_pria_pod_id" {
  value = data.aws_subnet.pria_pod.id
}

output "sbn_pric_pod_id" {
  value = data.aws_subnet.pric_pod.id
}

output "sbn_pria_db_id" {
  value = data.aws_subnet.pria_db.id
}

output "sbn_pric_db_id" {
  value = data.aws_subnet.pric_db.id
}
