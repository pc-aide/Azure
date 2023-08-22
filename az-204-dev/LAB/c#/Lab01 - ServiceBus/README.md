# Lab01 - ServiceBus

---

## Shotcots visualStudio
1. Wrap word : Ctrl+E, Ctrl+W

---

## Requirements
1. [Visual Studio Community 2022](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&cid=2030&passive=false)
    a. [Worloads](ASP.NET & web development)

---

## main.tf
````tf
########################################################
# TERRAFORM
########################################################

terraform {
  required_version = "~>1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.19.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5.0"
    }
  }
}

########################################################
# PROVIDERS
########################################################

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "random" {
  # Configuration options
}

########################################################
# DATA
########################################################

resource "random_integer" "sbn_name_suffix" {
  min = 1000
  max = 9999
}

########################################################
# VARIABLES
########################################################

variable "rg_name" {
  type    = string
  default = "rg-lab01"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

// have a uniq name available
variable "sbn_name" {
  type    = string
  default = "sbn-lab01-"
}

variable "sbn_sku" {
  type    = string
  default = "Basic"
}

// queue name
variable "sbn_queue_name" {
  type    = string
  default = "myqueue"
}

// auth queue (SAS Policy)
variable "sbn_queue_auth_rul_name" {
  type    = string
  default = "SenderPolicy"
}

########################################################
# RESOURCE_GROUP
########################################################

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.location
}

########################################################
# SERVICEBUS_NAMESPACE
########################################################

resource "azurerm_servicebus_namespace" "sbn-lab01" {
  name                = "${var.sbn_name}${random_integer.sbn_name_suffix.result}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_name.name
  sku                 = var.sbn_sku
}

resource "azurerm_servicebus_queue" "sbn_queue" {
  name         = var.sbn_queue_name
  namespace_id = azurerm_servicebus_namespace.sbn-lab01.id
}

// SAS Policy for queue name
resource "azurerm_servicebus_queue_authorization_rule" "sbn_queue_auth_rul" {
  name     = var.sbn_queue_auth_rul_name
  queue_id = azurerm_servicebus_queue.sbn_queue.id

  send = true
}

########################################################
# OUTPUT
########################################################
````

---

## commands.sh
````sh
# account cleanUp
az account clear

# creds
read -p "Your email: " email && az login -u $email

# code format
terraform fmt -recursive

# init
terraform init

# validate
terraform validate

# deploy
terraform apply -auto-approve

# update vm-extension
terraform apply -auto-approve -replace="azurerm_windows_virtual_machine.vm_consul"

# destroy
terraform destroy -auto-approve
````

---

## NewProject
1. Language : C#
2. Console
3. Console App
4. Framework: .net 6.0 LTS
5. Tools\NuGet Package Manager\Package Manager Console :
`Install-Package Azure.Messaging.ServiceBus`

### Program.cs
````cs
// Import the namespace for interacting with Azure Service Bus

// Namespace for the Service Bus Console application

    // internal class program

        // variables : connection string & queueName from the SAS policy

        // service bus client instance (connectionString)

        // sender instance using the service bus for the queue

        // method is where the program execution begins

            // Create a message batch instance (class) using the Sender

            // add 10 messages to the message Batch

                // try to add a message to the batch with string : Message <number>

                    // if it's too large for batch, show this message "The message <n> is too large to fit in the batch"

            // use the serviceBusSender client to send the batch of messages to the service bus queue
            
            // write in the console : A batch of 10 messages has been published to the queue

            // show in the console

            // closing the connections & network resource
````

<details><summary>O/P</summary>outPut console:<br/><img src="https://i.imgur.com/bTl59jM.png"><br/>10 messages:<br/><img src="https://i.imgur.com/Wf3XLtD.png"><br/>message body:<br/><img src="https://i.imgur.com/fmQk74g.png"></details>

<details><summary>Answer</summary>// Import the namespace for interacting with Azure Service Bus<br/>using Azure.Messaging.ServiceBus;<br/><br/>// Namespace for the Service Bus Console application<br/>namespace ServiceBusConsole<br/>{<br/>    // internal class program<br/>    internal class Program<br/>    {<br/>        // variables : connection string & queueName from the SAS policy<br/>        const string connectionString = "";<br/>        const string queueName = "";<br/><br/>        // service bus client instance<br/>        static ServiceBusClient serviceBusClient = new ServiceBusClient(connectionString);<br/>        // send messages to the service bus<br/>        static ServiceBusSender serviceBusSender = serviceBusClient.CreateSender(queueName);<br/><br/>        // method is where the program execution begins<br/>        static async Task Main()<br/>        {<br/>            // create a batch<br/>            using ServiceBusMessageBatch messageBatch = await serviceBusSender.CreateMessageBatchAsync();<br/><br/>            // add 10 messages to the message Batch<br/>            for (int i = 1; i <= 10; i++)<br/>&ensp;&ensp;{<br/>                // try to add a message to the batch<br/>                if (!messageBatch.TryAddMessage(new ServiceBusMessage($"Message {i}")))<br/>                {<br/>                    // if it is too large for the batch : show this message  The message <n> is too large to fit in the batch<br/>                    throw new Exception($"The message {i} is too large to fit in the batch.");<br/>&ensp;&ensp;&ensp;}<br/>            }<br/><br/>            // use the serviceBusSender client to send the batch of messages to the service bus queue<br/>            await serviceBusSender.SendMessagesAsync(messageBatch);<br/>            // write in the console : A batch of 10 messages has been published to the queue<br/>            Console.WriteLine($"A batch of 10 messages has been published to the queue.");<br/>            // show in the console<br/>            Console.ReadLine();<br/><br/>            // closing the connections & network resource<br/>            await serviceBusSender.DisposeAsync();<br/>            await serviceBusClient.DisposeAsync();<br/>&ensp;&ensp;}<br/>&ensp;}<br/>}</details>
