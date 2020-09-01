[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $example
)

New-Item -ItemType Directory -Path "bin" -Force

Copy-Item "../glfw/lib/glfw3.dll" "./bin"

&cheezc $example --modules ../glfw --out bin --int bin --run --error-source