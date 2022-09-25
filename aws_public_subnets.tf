
resource "aws_subnet" "main" {
  count      = length(local.az_names)
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index + 1)
  map_public_ip_on_launch = true

  availability_zone = local.az_names[count.index]

  tags = {
    Name = "mainsubnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "pubilc_igw"
  }
}

resource "aws_route_table" "pubic_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }



  tags = {
    Name = "pubic_route_table"
  }
}

resource "aws_route_table_association" "a" {
  count          = length(local.az_names)
  subnet_id      = aws_subnet.main.*.id[count.index]
  route_table_id = aws_route_table.pubic_route_table.id
}