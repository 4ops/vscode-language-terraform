# Change Log

## 0.2.5

- Added support for all `.hcl` files ([#21](https://github.com/4ops/vscode-language-terraform/pull/21)). Thanks to [@hariscodes](https://github.com/hariscodes)
- Fix syntax highlighting issues for `terraform_version_constraint` and `terragrunt_version_constraint` ([#22](https://github.com/4ops/vscode-language-terraform/pull/22)). Thanks to [@hariscodes](https://github.com/hariscodes)
- Fixed escape character regex ([#23](https://github.com/4ops/vscode-language-terraform/pull/23)). Thanks to [@hariscodes](https://github.com/hariscodes)

## 0.2.4

- Fix typo in changelog
- Update dev dependencies

## 0.2.3

- Added syntax hightlighting and snippet for `moved` blocks ([#18](https://github.com/4ops/vscode-language-terraform/pull/18)). Thanks to [@hariscodes](https://github.com/hariscodes)
- Added syntax highlighting for multiple include blocks in `terragrunt.hcl` ([#15](https://github.com/4ops/vscode-language-terraform/pull/15)). Thanks to [@cruftyoldsysadmin](https://github.com/cruftyoldsysadmin)

## 0.2.2

- Added sensitive variable support
- Fixed provider block inside required_providers

## 0.2.1

- Added variable validation support ([#5](https://github.com/4ops/vscode-language-terraform/issues/5))

## 0.2.0

- Added Terragrunt syntax highlighting

## 0.1.10

- Update common snippets
- Add snippets for creating datasources and resources with providers: `archive`, `external`, `http`, `terraform`, `tls`, `local`, `null`, `template`, `random`, `time`

## 0.1.9

- Rewrite all snippets
- Use [yq](https://github.com/mikefarah/yq) instead `js-yaml` for converting YAML to JSON
- Update readme
- Cleanup repository files

## 0.1.8

- Fix highlighting `any` type in `variable` block

## 0.1.7

- Highlight new Terraform 0.12.16 functions: `trimprefix`, `trimsuffix` and `trim`

## 0.1.6

- Highlight new Terraform 0.12.10 functions: `parseint` and `cidrsubnets`

## 0.1.5

- Highlight new Terraform 0.12.8 function: `fileset`

## 0.1.4

- Highlight new Terraform 0.12.7 functions: `regex` and `regexall`

## 0.1.3

- Allow identifiers without quotes in top-level blocks

## 0.1.2

- Add support for variable files: `.tfvars`
- Declare `.tfstate` files as JSON

## 0.1.1

- Add support for template expressions: `%{...}`
- Add keywords: `if`, `else`, `endif`, `for`, `in`, `endfor`

## 0.1.0

- Initial release
