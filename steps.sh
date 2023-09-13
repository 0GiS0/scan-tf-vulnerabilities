# Scan using tfsec https://github.com/aquasecurity/tfsec 
# ------------------------------------------------------------------------------
# tfsec -h
# tfsec .

# Tfsec > Trivy
# ------------------------------------------------------------------------------
trivy config .

# Scan using checkov
# ------------------------------------------------------------------------------
checkov -h
checkov -d .

# Scan using terrascan
# ------------------------------------------------------------------------------
terrascan -h
terrascan scan -d .

# Scan using snyk
# ------------------------------------------------------------------------------
snyk -h
snyk auth
snyk iac test --help
snyk iac test . --report

# Test a Terraform plan file
terraform init \


terraform plan -out=tfplan.binary
terraform show -json tfplan.binary > tf-plan.json
snyk iac test tf-plan.json