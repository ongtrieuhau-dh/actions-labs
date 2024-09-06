# Get all input keys and values
$inputs = ${{ toJson(github.event.inputs) } } | ConvertFrom-Json

foreach ($key in $inputs.PSObject.Properties.Name) {
    $envVarName = "o_inputs_$($key)"
    $value = $inputs.$key
    echo "$envVarName=$value" >> $env:GITHUB_ENV
}