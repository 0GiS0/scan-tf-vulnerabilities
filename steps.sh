# Scan using tfsec https://github.com/aquasecurity/tfsec 
# ------------------------------------------------------------------------------
# tfsec -h
# tfsec .

# Tfsec > Trivy
# ------------------------------------------------------------------------------
trivy config . 
trivy config  --format table --exit-code  0 --severity  UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL  .

# Scan using checkov
# ------------------------------------------------------------------------------
checkov -h
# Scan only terraform files
checkov -d . --output cli --output sarif --output-file-path console,results.sarif --soft-fail    

# Scan using terrascan
# ------------------------------------------------------------------------------
terrascan -h
terrascan scan -d .

# Scan using snyk
# ------------------------------------------------------------------------------
snyk -h
snyk auth
snyk iac test --help
SNYK_TOKEN=1a0bee11-920a-477a-9c9f-3dcf40b26a41 snyk iac test . --sarif

# Test a Terraform plan file
terraform init \


terraform plan -out=tfplan.binary
terraform show -json tfplan.binary > tf-plan.json
snyk iac test tf-plan.json