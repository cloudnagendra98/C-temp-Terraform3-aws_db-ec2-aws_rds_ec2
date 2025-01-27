resource "aws_security_group" "webnsg" {
  name        = var.webnsg_config.name
  description = var.webnsg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets
  ]

}

resource "aws_security_group_rule" "webnsg_rule" {
  count             = length(var.webnsg_config.rules)
  type              = var.webnsg_config.rules[count.index].type
  from_port         = var.webnsg_config.rules[count.index].from_port
  to_port           = var.webnsg_config.rules[count.index].to_port
  protocol          = var.webnsg_config.rules[count.index].protocol
  security_group_id = aws_security_group.webnsg.id
  cidr_blocks       = [var.webnsg_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.webnsg
  ]

}

resource "aws_security_group" "appnsg" {
  name        = var.appnsg_config.name
  description = var.appnsg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets
  ]

}

resource "aws_security_group_rule" "appnsg_rule" {
  count             = length(var.appnsg_config.rules)
  type              = var.appnsg_config.rules[count.index].type
  from_port         = var.appnsg_config.rules[count.index].from_port
  to_port           = var.appnsg_config.rules[count.index].to_port
  protocol          = var.appnsg_config.rules[count.index].protocol
  security_group_id = aws_security_group.appnsg.id
  cidr_blocks       = [var.appnsg_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.appnsg
  ]

}

resource "aws_security_group" "dbnsg" {
  name        = var.dbnsg_config.name
  description = var.dbnsg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets
  ]

}

resource "aws_security_group_rule" "dbnsg_rule" {
  count             = length(var.dbnsg_config.rules)
  type              = var.dbnsg_config.rules[count.index].type
  from_port         = var.dbnsg_config.rules[count.index].from_port
  to_port           = var.dbnsg_config.rules[count.index].to_port
  protocol          = var.dbnsg_config.rules[count.index].protocol
  security_group_id = aws_security_group.dbnsg.id
  cidr_blocks       = [var.dbnsg_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.dbnsg
  ]

}