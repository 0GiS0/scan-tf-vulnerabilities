# Scan using trivy https://github.com/aquasecurity/trivy
# ------------------------------------------------------------------------------

trivy config . 
trivy config  --format table --exit-code  0 --severity  UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL  .

# Scan using checkov https://github.com/bridgecrewio/checkov
# ------------------------------------------------------------------------------
checkov -h
# Scan only terraform files
checkov -d . --output cli --output sarif --output-file-path console,results.sarif --soft-fail    

# Scan using terrascan https://github.com/tenable/terrascan
# ------------------------------------------------------------------------------
terrascan -h
terrascan scan -d .

# Scan using snyk https://github.com/snyk/cli
# ------------------------------------------------------------------------------
snyk -h
snyk auth
snyk iac test --help
SNYK_TOKEN=1a0bee11-920a-477a-9c9f-3dcf40b26a41
snyk config set api=$SNYK_TOKEN
snyk iac test . --sarif
