# battery-drain
Spinning up Azure resources after working hours

I. Your task is to write Terraform configuration files to provision the following resources
in Microsoft Azure:
    ● A Kubernetes cluster (AKS)
    ● A Cosmos DB database
    ● A Key Vault
    ● An Azure Container Registry
You may organise your Terraform configuration files in a manner that makes sense to
you in a folder/repo. When deploying these resources, make sure you prioritise
security considerations and you configure them to be as SECURE as they can.

II. Your second task is to create a Dockerfile for a basic .NET Core web application that
prints "Hello, Docker!" when accessed in a web browser. Make sure you use an
appropriate base image, you expose your application on port 5000 and that you
create a SECURE Docker image. These files should exist in another repository/folder.

III. Your third task is to create a new GitHub Action workflow file (e.g.,
.github/workflows/push-to-acr.yml) in the second repository/folder. The workflow
should include the following steps:
    ● Checkout the code.
    ● Build the Docker image using the Dockerfile.
    ● Log in to the Azure Container Registry using Azure credentials.
    ● Push the Docker image to the ACR.

IV. Create a Kubernetes manifest file to deploy your .NET web application. Make sure
you expose it publicly and you ensure high availability () for your application.

V. Setup a microservice deployment to the AKS cluster using ArgoCD and Helm
manifest files given that you have in place a Docker image of that microservice
hosted in a container registry.

Please send us both folders/repositories and we will have a look over your code. For bonus
points, send us as well a diagram that contains the resources and the connections in
between them.