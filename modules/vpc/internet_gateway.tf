resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.main.id
    
    tags = {
        Name = "${var.project_name}-igw"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "${var.project_name}-public-route-table"
    }
}

resource "aws_route_table_association" "public" {
    count = length(var.public_subnets_cidr)
    subnet_id = aws_subnet.public_subnets[count.index].id
    route_table_id = aws_route_table.public_rt.id
}