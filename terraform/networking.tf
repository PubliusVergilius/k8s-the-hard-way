resource "aws_vpc" "k8s-cluster" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  region = var.default_region
  
  tags = {
    Name = "k8s-cluster"
    ManagedBy = "terraform"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.k8s-cluster.id

  tags = {
    Name = "k8s-cluster-igw"
    ManagedBy = "terraform"
  }
}

# Subnet privada
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.k8s-cluster.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.az1

  tags = {
    Name = "Private"
    ManagedBy = "terraform"
  }
}

# Subnet pública
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.k8s-cluster.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az1

  tags = {
    Name = "Public"
    ManagedBy = "terraform"
  }
}
