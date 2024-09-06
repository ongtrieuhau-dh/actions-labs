# parse-env.ps1

# Get the inputs JSON from environment variable
$inputsJson = $env:toJSON_inputs
$secretsJson = $env:toJSON_secrets

# Check if the inputsJson is not null or empty
if (-not [string]::IsNullOrEmpty($inputsJson)) {
    # Parse the JSON
    $inputs = $inputsJson | ConvertFrom-Json

    # Now you can access each input like:
    foreach ($key in $inputs.PSObject.Properties.Name) {
        $envVarName = "o_inputs_$($key)"
        $value = $inputs.$key
        echo "$envVarName=$value"
    }
}
else {
    Write-Host "No inputs found or inputs JSON is null."
}

# Check if the secretsJson is not null or empty
if (-not [string]::IsNullOrEmpty($secretsJson)) {
    # Parse the JSON
    $inputs = $secretsJson | ConvertFrom-Json

    # Now you can access each input like:
    foreach ($key in $inputs.PSObject.Properties.Name) {
        $envVarName = "o_secrets_$($key)"
        $value = $inputs.$key
        echo "$envVarName=$value"
    }
}
else {
    Write-Host "No secret found or secrets JSON is null."
}
