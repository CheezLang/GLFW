$libname = "glfw"

Write-Host "Compiling C++ part"
&clang -c "./int/$libname.cpp" -o "./int/binding.o" -DFORCE_CPP
&llvm-lib "/out:./int/binding.lib" "./int/binding.o"
Copy-Item "./int/binding.lib" "./$libname/lib/binding.lib" -Force