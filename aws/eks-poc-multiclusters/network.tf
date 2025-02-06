#### resource ####



#### data ####
data "aws_vpc" "uplus" {
  filter {
    name   = "tag:Name"
    values = ["VPC-UPLUS-DEV"]
  }
}

data "aws_subnet" "puba" {
  filter {
    name   = "tag:Name"
    values = ["sbn-uplus-dev-puba"]
  }
}

data "aws_subnet" "pubc" {
  filter {
    name   = "tag:Name"
    values = ["sbn-uplus-dev-pubc"]
  }
}

data "aws_subnet" "pria" {
  filter {
    name   = "tag:Name"
    values = ["sbn-uplus-dev-pria"]
  }
}

data "aws_subnet" "pric" {
  filter {
    name   = "tag:Name"
    values = ["sbn-uplus-dev-pric"]
  }
}

data "aws_subnet" "pria_pod" {
  filter {
    name   = "tag:Name"
    values = ["sbn-uplus-dev-pria-pod"]
  }
}

data "aws_subnet" "pric_pod" {
  filter {
    name   = "tag:Name"
    values = ["sbn-uplus-dev-pric-pod"]
  }
}

data "aws_subnet" "pria_db" {
  filter {
    name   = "tag:Name"
    values = ["sbn-uplus-dev-pria-db"]
  }
}

data "aws_subnet" "pric_db" {
  filter {
    name   = "tag:Name"
    values = ["sbn-uplus-dev-pric-db"]
  }
}
