## Not for Public Consumption | Example Only ##
---
# Terraform Enterprise - AWS EKS FDO

## What is this?

This is the base module that is used by the `terraform-aws-eks-fdo-nocode` [module](https://app.terraform.io/app/hashicorp-support-eng/registry/modules/private/hashicorp-support-eng/eks-fdo-nocode/aws/) to deploy a functional k8s based instance of Terraform Enterprise FDO. This module can be referenced directly if so desired.

[K8s internal install guide](https://hashicorp.atlassian.net/wiki/spaces/IPL/pages/2557116565/Kubernetes+Install+Guide+Internal+Alpha)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.19.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.11.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.23.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.19.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.16.0 |
| <a name="module_object_storage"></a> [object\_storage](#module\_object\_storage) | ./modules/object_storage | n/a |
| <a name="module_postgresql"></a> [postgresql](#module\_postgresql) | ./modules/postgresql | n/a |
| <a name="module_redis"></a> [redis](#module\_redis) | ./modules/redis | n/a |
| <a name="module_tfe-fdo-kubernetes"></a> [tfe-fdo-kubernetes](#module\_tfe-fdo-kubernetes) | ./modules/tfe-fdo-kubernetes | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.www](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [random_pet.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_acm_certificate.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_secretsmanager_secret.tls-cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.tls-cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [kubernetes_service.tfe](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |
| [terraform_remote_state.base-infra](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_instance_size"></a> [db\_instance\_size](#input\_db\_instance\_size) | n/a | `string` | `"db.t3.small"` | no |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | n/a | `string` | `"5432"` | no |
| <a name="input_docker_registry"></a> [docker\_registry](#input\_docker\_registry) | Appending of /hashicorp needed to registry URL for Docker to succesfully pull image via Terraform. | `string` | `"images.releases.hashicorp.com"` | no |
| <a name="input_docker_registry_username"></a> [docker\_registry\_username](#input\_docker\_registry\_username) | n/a | `string` | `"terraform"` | no |
| <a name="input_encryption_password"></a> [encryption\_password](#input\_encryption\_password) | n/a | `string` | `"SUPERSECRET"` | no |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | n/a | `string` | `"1.0.0"` | no |
| <a name="input_image"></a> [image](#input\_image) | n/a | `string` | `"hashicorp/terraform-enterprise"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for the EKS managed node group | `list(string)` | <pre>[<br>  "t3a.2xlarge"<br>]</pre> | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.28"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"terraform-enterprise"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | (Optional) The number of pods when using active-active. | `number` | `1` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | n/a | `string` | `"15.4"` | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | n/a | `string` | `"6379"` | no |
| <a name="input_redis_use_password_auth"></a> [redis\_use\_password\_auth](#input\_redis\_use\_password\_auth) | (Optional) Whether or not to use password authentication when connecting to Redis. | `bool` | `true` | no |
| <a name="input_redis_use_tls"></a> [redis\_use\_tls](#input\_redis\_use\_tls) | (Optional) Whether or not to use TLS when connecting to Redis. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_tag"></a> [tag](#input\_tag) | Currently no latest tag available and must be manually set on workspace creation. | `string` | `"v202309-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Any custom tags that should be added to all of the resources. | `map(string)` | `{}` | no |
| <a name="input_tfe_license"></a> [tfe\_license](#input\_tfe\_license) | License URL https://license.hashicorp.services/customers/7f3e3c93-0677-dafa-f3b4-8ee6c7fdf8d1 | `string` | `"02MV4UU43BK5HGYYTOJZWFQMTMNNEWU33JJVVE2MSZPJWGQTL2KF2FUR2FGRGUGMLIJZ5GQ2SMKRDGWTSHJF2E4VCGNVNEIUJRJZLVM3CZPJDGUSLJO5UVSM2WPJSEOOLULJMEUZTBK5IWST3JJEZVU2SONRGTETJVJV4TA52ONJRTGTCXKJUFU3KFORNGUTTJJZBTANC2K5KTEWL2MRWVUR2ZGRNEIRLJJRBUU4DCNZHDAWKXPBZVSWCSOBRDENLGMFLVC2KPNFEXCSLJO5UWCWCOPJSFOVTGMRDWY5C2KNETMSLKJF3U22SNORGUI23UJVCFUVKNKRRTMTLKIU3E2RCNOVGUIZZVJ5KE2NCNNJCXSV3JJFZUS3SOGBMVQSRQLAZVE4DCK5KWST3JJF4U2RCJPJGFIQJVJRKECMSWIRAXOT3KIF3U62SBO5LWSSLTJFWVMNDDI5WHSWKYKJYGEMRVMZSEO3DULJJUSNSJNJEXOTLKKV2E2RCFORGUIRSVJVCECNSNIRATMTKEIJQUS2LXNFSEOVTZMJLWY5KZLBJHAYRSGVTGIR3MORNFGSJWJFVES52NNJKXITKEIV2E2RCGKVGUIQJWJVCECNSNIRBGCSLJO5UWGSCKOZNEQVTKMRBUSNSJNZJGYY3OJJUFU3JZPFRFGSLTJFWVU42ZK5SHUSLKOA3WMWBQHUXC63ZZNBYU2NBTFNTXK6DHMNEEOT2ZFNZUSSTIO4ZTQNLGJMYGE4TVOFCXORCZF52VK53UNNLDOMZWJVSEUMJPKZLG4MS2PA3XANTMGJ3TAQSXMNGVE5SHNIZCWS3QPJUEQNKJMZATKMLEIFVWGYJUMRLDAMZTHBIHO3KWNRQXMSSQGRYEU6CJJE4UINSVIZGFKYKWKBVGWV2KORRUINTQMFWDM32PMZDW4SZSPJIEWSSSNVDUQVRTMVNHO4KGMUVW6N3LF5ZSWQKUJZUFAWTHKMXUWVSZM4XUWK3MI5IHOTBXNJBHQSJXI5HWC2ZWKVQWSYKIN5SWWMCSKRXTOMSEKE6T2"` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | (Required) The existing AWS Route53 zone to use. If using the base infrastructure, the value can be accessed via the `zone_name` output. | `string` | `"tf-support.hashicorpdemo.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_random_pet"></a> [random\_pet](#output\_random\_pet) | n/a |
<!-- END_TF_DOCS -->
