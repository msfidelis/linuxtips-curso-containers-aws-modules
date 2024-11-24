<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_vpc_link.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_vpc_link) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_lb.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb.vpclink](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.internal_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.vpclink](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.vpclink_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.vpclink](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.vpclink_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.internal_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_lb_target_group_attachment.internal_lb_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_route53_record.wildcard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_security_group.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.lb_internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.vpclink](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ingress_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.internal_ingress_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.internal_ingress_80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.subnet_ranges](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.vpclink_ingress_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.vpclink_ingress_80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_service_discovery_private_dns_namespace.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |
| [aws_service_discovery_private_dns_namespace.sc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certs"></a> [acm\_certs](#input\_acm\_certs) | Lista de ARNs de certificados ACM que serão associados a recursos como load balancers no cluster ECS. Caso não sejam especificados, será usada a configuração padrão vazia. | `list(string)` | `[]` | no |
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | Lista de capacity providers que o cluster ECS irá utilizar. Por padrão, inclui FARGATE e FARGATE\_SPOT para tasks gerenciadas por serverless. | `list(any)` | <pre>[<br>  "FARGATE",<br>  "FARGATE_SPOT"<br>]</pre> | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Lista de IDs das sub-redes privadas dentro da VPC onde serão provisionados recursos como tasks ECS sem exposição pública. | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do projeto, utilizado para nomear e identificar os recursos criados pelo Terraform dentro do escopo deste cluster ECS. | `string` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Lista de IDs das sub-redes públicas dentro da VPC onde serão provisionados recursos que necessitam de acesso à Internet, como load balancers. | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Região da AWS onde os recursos do cluster ECS e suas dependências serão provisionados. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID da VPC onde o cluster ECS e seus recursos associados serão implantados. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_internal_load_balancer_dns"></a> [internal\_load\_balancer\_dns](#output\_internal\_load\_balancer\_dns) | n/a |
| <a name="output_lb_external_arn"></a> [lb\_external\_arn](#output\_lb\_external\_arn) | n/a |
| <a name="output_lb_external_listener"></a> [lb\_external\_listener](#output\_lb\_external\_listener) | n/a |
| <a name="output_lb_internal_arn"></a> [lb\_internal\_arn](#output\_lb\_internal\_arn) | n/a |
| <a name="output_lb_internal_listener"></a> [lb\_internal\_listener](#output\_lb\_internal\_listener) | n/a |
| <a name="output_lb_internal_listener_https"></a> [lb\_internal\_listener\_https](#output\_lb\_internal\_listener\_https) | n/a |
| <a name="output_load_balancer_dns"></a> [load\_balancer\_dns](#output\_load\_balancer\_dns) | n/a |
| <a name="output_service_discovery_cloudmap"></a> [service\_discovery\_cloudmap](#output\_service\_discovery\_cloudmap) | n/a |
| <a name="output_service_discovery_cloudmap_name"></a> [service\_discovery\_cloudmap\_name](#output\_service\_discovery\_cloudmap\_name) | n/a |
| <a name="output_service_discovery_service_connect"></a> [service\_discovery\_service\_connect](#output\_service\_discovery\_service\_connect) | n/a |
| <a name="output_service_discovery_service_connect_name"></a> [service\_discovery\_service\_connect\_name](#output\_service\_discovery\_service\_connect\_name) | n/a |
| <a name="output_vpc_link"></a> [vpc\_link](#output\_vpc\_link) | n/a |
| <a name="output_vpc_link_nlb_arn"></a> [vpc\_link\_nlb\_arn](#output\_vpc\_link\_nlb\_arn) | n/a |
<!-- END_TF_DOCS -->