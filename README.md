# cpp_init

cpp_init is a powershell script for initializing the vs-code based C++ container,

# Reason for this script

Creating a new container based development environment for C++ in vs code required me to do the following

* Create a `Dockerfile` with image information
* Create a `.devcontainer` directory at the top level along with a `devcontainer.json` file containing the vs-code configuration(extensions,...) along with container configuration.

I create a lot of new projects all the time for improving my design skills, testing out new C++ features (which cannot be done in Compiler Explorer), practising stuff.

Creating this structure within vscode was quite time consuming hence this powershell script

# What does this generate




As you can see in the image running this powershell script generates a DockerFile that uses my cppbaseimage (slim version) that contains all the basic tools required for C++ Project development.

[https://hub.docker.com/r/gk487/cpp-base-image](https://hub.docker.com/r/gk487/cpp-base-image)


Along with that it also sets up a devcontainer.json config file for container based development that sets up the cmake toolchain file for vcpkg and installs the following vscode extensions

* C/C++ - [https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

* CMake for VSCode - [https://marketplace.visualstudio.com/items?itemName=twxs.cmake](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)

* Doxygen Documentation Generator - [https://marketplace.visualstudio.com/items?itemName=cschlosser.doxdocgen](https://marketplace.visualstudio.com/items?itemName=cschlosser.doxdocgen)

* Github Pull Request and Issues - [https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)

# Using the script

My first choice was to place this script in the `path` and access it via terminal easily but that did not work.

The reason is that powershell only allows you to run a script if you specify a absolute path or relative path of the script.

This is done to prevent command Hijacking. 


The alternative to this is creating an alias command in your [Powershell Profile](https://www.howtogeek.com/126469/how-to-create-a-powershell-profile/)  that invokes the powershell script when it is called.

```powershell
$ps_script_dir= "C:\Users\krish\OneDrive\lab\scripts"
New-Alias cpp_init $ps_script_dir\cpp_init.ps1
```

Now when you type in cpp_init in the working directory the files are automatically generated for you


