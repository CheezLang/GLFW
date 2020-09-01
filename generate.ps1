$libname = "glfw"

New-Item -ItemType Directory -Path "int" -Force

./CheezCBindingGenerator.exe "$libname.lua" "./int"
Copy-Item "./int/$libname.che" "./$libname/$libname.che" -Force
Write-Host ""
