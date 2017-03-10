##Infrastructure as Code

* Infrastructure just as critical to software delivery as application code; treat it the same
* Automate the provisioning of infrastructure ensuring predictability and repeatability
* Enable portability between environments, clouds, or even data centers
* Incremental iteration through version control
* Knowledge of server provisioning, configuration management, and deployment is no longer only with the systems admins


##Terraform

* Infrastructure described as high-level configuration syntax
* Execution plans – defines specifically what will be changed prior to execution
* Builds a graph of all your resources and parallelizes the creation and modification of any non-dependent resources
* Complex change sets can be applied to your infrastructure with minimal human interaction
* Similar to AWS CloudFormation, though offers cross-cloud and on-prem connections at the expense of some AWS integration features

##Infrastructure Pipeline
Allows the required infrastructure definition to be provisioned and promoted between environments in a consistent, headless, automated process.
