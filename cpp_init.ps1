# Setting up Directory Structure

New-Item  Dockerfile -ItemType File
New-Item .devcontainer -ItemType Directory
New-Item  -Path ./.devcontainer/devcontainer.json -ItemType File

# Setting up the content
Set-Content Dockerfile @"
FROM gk487/cpp-base-image:slim
"@

Set-Content .\.devcontainer\devcontainer.json @"
// For format details, see https://aka.ms/devcontainer.json. For config options, see the README at:
// https://github.com/microsoft/vscode-dev-containers/tree/v0.163.1/containers/docker-existing-dockerfile
{
	"name": "Existing Dockerfile",

	// Sets the run context to one level up instead of the .devcontainer folder.
	"context": "..",

	// Update the 'dockerFile' property if you aren't using the standard 'Dockerfile' filename.
	"dockerFile": "../Dockerfile",

	// Set *default* container specific settings.json values on container create.
	"settings": { 
		"terminal.integrated.shell.linux": "/bin/bash",
		"cmake.configureSettings": {
			"CMAKE_TOOLCHAIN_FILE":"/vcpkg/scripts/buildsystems/vcpkg.cmake",
			"VCPKG_TARGET_TRIPLET":"x64-linux"
		}
		
	},

	// Add the IDs of extensions you want installed when the container is created.
	"extensions": [
		"ms-vscode.cpptools",
		"twxs.cmake",
		"ms-vscode.cmake-tools",
		"cschlosser.doxdocgen",
		"github.vscode-pull-request-github",
	]

	// Use 'forwardPorts' to make a list of ports inside the container available locally.
	// "forwardPorts": [],

	// Uncomment the next line to run commands after the container is created - for example installing curl.
	// "postCreateCommand": "apt-get update && apt-get install -y curl",

	// Uncomment when using a ptrace-based debugger like C++, Go, and Rust
	// "runArgs": [ "--cap-add=SYS_PTRACE", "--security-opt", "seccomp=unconfined" ],

	// Uncomment to use the Docker CLI from inside the container. See https://aka.ms/vscode-remote/samples/docker-from-docker.
	// "mounts": [ "source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind" ],

	// Uncomment to connect as a non-root user if you've added one. See https://aka.ms/vscode-remote/containers/non-root.
	// "remoteUser": "vscode"
}
"@
