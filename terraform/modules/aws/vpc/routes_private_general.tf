resource "aws_route_table" "private_general" {
  count  = "${ length( var.azs ) }"
  vpc_id = "${ aws_vpc.vpc.id }"

  tags = "${ merge(
    map( "Name", "${ var.name_prefix }_route_table_private_general_${ replace( var.azs[count.index], "-", "_" ) }" ),
    var.tags, module.constants.tags_default )
  }"
}

resource "aws_route" "nat" {
  count = "${ var.create_nat_gateways ? length( var.azs ) : 0}"

  route_table_id         = "${ element( aws_route_table.private_general.*.id, count.index ) }"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${ element( aws_nat_gateway.nat.*.id, count.index ) }"
}

resource "aws_route" "private_general_eoigw" {
  count = "${ length( var.azs ) }"

  route_table_id              = "${ element( aws_route_table.private_general.*.id, count.index ) }"
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id      = "${ aws_egress_only_internet_gateway.igw.id }"
}
