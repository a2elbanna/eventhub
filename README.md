# Azure Event hubs as an infrastructure
## Project Structure 
This project consists of one module. The 'module-eventhub' creats Azure resource group, eventhub namespace, eventhub, Diagnostic settings for the eventhub namespace and a storage account for sharing diagnostic settings.


## To run the script
```bash
# Initalizing the module
terraform init
# Creating the eventhub
terraform apply -target=module.eventhub
```