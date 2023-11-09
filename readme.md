# DDD Adelaide 2023 Terraform Demo

This is a simple demo for deploying some basic resources to Azure using Terraform, showing off some of the features of Terraform.

Each branch in this repo represents a step in the demo, so you can follow along with the demo by checking out the branch for each step.
`main` is the final end result.

## Stages

### Stage 0 - Initialization

This stage shows `providers`, `backends`, `var files` and overall the basic concepts of Terraform.  
It also is a good ice breaker to show that Terraform effectively concat all files in the directory and builds a dependency graph from that.
This is also a good time to show the `plan` command and how it shows what Terraform will do, as well as making a lifecycle boundary with the state file.

### Stage 1 - First Dependent Resource

This stage shows how Terraform builds a dependency graph and how it will create resources in the correct order based on that graph.  
The key is to inherit values from prior resources and use them in later resources.

### Stage 2 - Loops

This stage brings in all 3 types of loops:

- Resource
- Dynamic Blocks
- Variable Construction

It also moves a previously deployed Virtual Network from hard coded values to being based on variables utilizing a interesting locals.

### Stage 3 - Modules

This final stage brings in a Module for deploying virtual machines, and practices lots of the concepts from the prior stages.
It is our moment to discuss how Modules are their own project boundaries and how they can be used to create reusable components.
