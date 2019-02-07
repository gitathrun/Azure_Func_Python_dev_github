# Azure Function Docker Image for Development #


## Base Image ##
This is the docker image for NLP task, its baseImage is:

__FROM tftwdockerhub/cuda_cudnn_ana_base:latest__

## Additional installed packages ##

For .NET and Azure Function development:

-  dotNet-sdk-2.2
-  azure-functions-core-tools

dotNet on linux installation is inspired by [dotNet development](https://dotnet.microsoft.com/download/linux-package-manager/ubuntu16-04/sdk-current)
Installation in Docker is based on [Microsoft's official dockerfile](https://github.com/dotnet/dotnet-docker/blob/master/2.2/sdk/stretch/amd64/Dockerfile)


## Docker Registry Repo ##

-  tftwdockerhub/azure_func_python_dev:latest

## Usage ##

on dsvm-gpu virtual machines


```
sudo docker pull tftwdockerhub/azure_func_python_dev:latest
```

remember the target port is __8889__
```
sudo nvidia-docker run -it -p 8889:8888 -v \<project-dir-path\>:/app tftwdockerhub/azure_func_python_dev:latest
```

In local browser, remember the target port is __8889__ and the token string on CLI screen
```
http://\<vm-ipaddress-or-dns\>:8889/?token=21c5e12xxxxxx
```