#!/bin/bash

terraform output --json | jq .instances1.value | tr -d '"' >> ansible/inventory/hosts
terraform output --json | jq .instances2.value | tr -d '"' >> ansible/inventory/hosts
rds_endpoint=$(terraform output --json | jq .rds_endpoint.value | tr -d '"' | cut -d ':' -f 1)
echo $rds_endpoint
sed -Ei "s|rds_host|${rds_endpoint}|g" ansible/roles/wordpress/defaults/main.yml
cat ansible/roles/wordpress/defaults/main.yml
rds_password=$(aws secretsmanager get-secret-value --secret-id rds --region us-east-1 | jq .SecretString | cut -d ':' -f 2 | tr -d '\','"','}','\\')

echo $rds_password

sed -Ei "s|rds_password|${rds_password}|g" ansible/roles/wordpress/defaults/main.yml
cat ansible/roles/wordpress/defaults/main.yml