# Check if the secretsJson is not null or empty
$secretsJson = $env:toJSON_secrets
if (-not [string]::IsNullOrEmpty($secretsJson)) {
    # Parse the JSON
    $inputs = $secretsJson | ConvertFrom-Json

    # Access each key and value in secrets
    foreach ($key in $inputs.PSObject.Properties.Name) {
        $envVarName = ("o_secrets_$($key)").ToUpper()
        $value = $inputs.$key

        # Check and set environment variable for secrets
        if ($value -notmatch '\*\*\*') {
            try {
                # Ghi biến môi trường vào $GITHUB_ENV với cú pháp -f
                echo ("{0}={1}" -f $envVarName, $value) >> $env:GITHUB_ENV
                Write-Host "Set $envVarName in GITHUB_ENV successfully."
            }
            catch {
                Write-Host "Failed to set $envVarName due to an error."
            }
        }
        else {
            Write-Host "Skipped setting $envVarName due to invalid value format."
        }

        # Similarly for inputs
        $envVarName2 = ("o_inputs_$($key)").ToUpper()
        $value2 = $inputs.$key

        # Check and set environment variable for inputs
        if ($value2 -notmatch '\*\*\*') {
            try {
                # Ghi biến môi trường vào $GITHUB_ENV với cú pháp -f
                echo ("{0}={1}" -f $envVarName2, $value2) >> $env:GITHUB_ENV
                Write-Host "Set $envVarName2 in GITHUB_ENV successfully."
            }
            catch {
                Write-Host "Failed to set $envVarName2 due to an error."
            }
        }
        else {
            Write-Host "Skipped setting $envVarName2 due to invalid value format."
        }
    }
}
else {
    Write-Host "No secret found or secrets JSON is null."
}

# Get the inputs JSON from environment variable
$inputsJson = $env:toJSON_inputs

# Check if the inputsJson is not null or empty
if (-not [string]::IsNullOrEmpty($inputsJson)) {
    # Parse the JSON
    $inputs = $inputsJson | ConvertFrom-Json

    # Access each input key and value
    foreach ($key in $inputs.PSObject.Properties.Name) {
        $envVarName = ("o_inputs_$($key)").ToUpper()
        $value = $inputs.$key

        # Check and set environment variable for inputs
        if ($value -notmatch '\*\*\*') {
            try {
                # Ghi biến môi trường vào $GITHUB_ENV với cú pháp -f
                echo ("{0}={1}" -f $envVarName, $value) >> $env:GITHUB_ENV
                Write-Host "Set $envVarName in GITHUB_ENV successfully."
            }
            catch {
                Write-Host "Failed to set $envVarName due to an error."
            }
        }
        else {
            Write-Host "Skipped setting $envVarName due to invalid value format."
        }
    }
}
else {
    Write-Host "No inputs found or inputs JSON is null."
}
