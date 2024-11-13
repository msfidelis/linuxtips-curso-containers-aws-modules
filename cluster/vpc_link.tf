resource "aws_security_group" "vpclink" {
  name   = format("%s-vpclink", var.project_name)
  vpc_id = var.vpc_id
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "aws_security_group_rule" "vpclink_ingress_80" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  description       = "Liberando trafego na porta 80"
  protocol          = "tcp"
  security_group_id = aws_security_group.vpclink.id
  type              = "ingress"
}

resource "aws_security_group_rule" "vpclink_ingress_443" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  description       = "Liberando trafego na porta 443"
  protocol          = "tcp"
  security_group_id = aws_security_group.vpclink.id
  type              = "ingress"
}

resource "aws_lb" "vpclink" {
  name     = format("%s-vpc-link", var.project_name)
  internal = true

  load_balancer_type = "network"

  subnets = var.private_subnets

  security_groups = [
    aws_security_group.vpclink.id
  ]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false
}

resource "aws_lb_target_group" "vpclink" {
  name        = format("%s-vpc-link", var.project_name)
  port        = 80
  protocol    = "TCP"
  target_type = "alb"

  vpc_id = var.vpc_id

  target_health_state {
    enable_unhealthy_connection_termination = false
  }
}

resource "aws_lb_listener" "vpclink" {
  load_balancer_arn = aws_lb.vpclink.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vpclink.arn
  }
}

resource "aws_lb_listener" "vpclink_https" {

  count = length(var.acm_certs) > 0 ? 1 : 0

  load_balancer_arn = aws_lb.vpclink.arn
  port              = 443
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vpclink_https[count.index].arn
  }
}


resource "aws_lb_target_group" "vpclink_https" {

  count = length(var.acm_certs) > 0 ? 1 : 0


  name        = format("%s-vpc-https-link", var.project_name)
  port        = 443
  protocol    = "TCP"
  target_type = "alb"

  vpc_id = var.vpc_id

  health_check {
    matcher   = "200-399"
     protocol = "HTTPS"
  }

  target_health_state {
    enable_unhealthy_connection_termination = false
  }
}

resource "aws_lb_target_group_attachment" "internal_lb_443" {

  count = length(var.acm_certs) > 0 ? 1 : 0

  target_group_arn = aws_lb_target_group.vpclink_https[count.index].arn
  target_id        = aws_lb.internal.id
  port             = 443
}

resource "aws_lb_target_group_attachment" "internal_lb" {
  target_group_arn = aws_lb_target_group.vpclink.arn
  target_id        = aws_lb.internal.id
  port             = 80
}

resource "aws_api_gateway_vpc_link" "main" {
  name = var.project_name

  target_arns = [
    aws_lb.vpclink.arn
  ]
}



