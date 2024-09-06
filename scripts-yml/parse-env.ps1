# parse-env.ps1

# Get the inputs JSON from environment variable
$inputsJson = $env:INPUTS_JSON

# Parse the JSON
$inputs = $inputsJson | ConvertFrom-Json

# Now you can access each input like:
foreach ($key in $inputs.PSObject.Properties.Name) {
    $envVarName = "o_inputs_$($key)"
    $value = $inputs.$key
    echo "$envVarName=$value"
}