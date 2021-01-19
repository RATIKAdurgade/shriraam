resource "aws_internet_gateway" "demo-igw" {
    vpc_id = "aws_vpc.demo-vpc.id"
    tags = {
        Name = "demo-igw"
    }
}

resource "aws_route_table" "demo-public-crt" {
    vpc_id = "aws_vpc.main-vpc.id"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "aws_internet_gateway.demo-igw.id" 
    }
    
    tags = {
        Name = "demo-public-crt"
    }
}

resource "aws_route_table_association" "demo-crta-public-subnet-1"{
    subnet_id = "aws_subnet.demo-subnet-public-1.id"
    route_table_id = "aws_route_table.demo-public-crt.id"
}