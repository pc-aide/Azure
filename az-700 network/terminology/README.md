# terminology

---

## List
|n|Name|Desc./Note|O/P|
|-|----|-----|---|
|1|Application Security Group|**ASG** in Azure is a construct used to configure network security for Azure resources. Essentially, it's a way to group virtual machines (VMs), virtual machine scale sets, and network interfaces into a single logical entity for the purpose of applying network security rules. By associating ASGs with security rules in network security groups (NSGs), you can define and enforce network traffic policies based on these logical groupings rather than individual resources. This helps simplify network security management, especially in complex environments with multiple resources and diverse communication patterns. ASGs enable you to define rules that apply uniformly to all resources within the group, enhancing security and simplifying management in Azure deployments.|<img src="https://i.imgur.com/9hhI06h.png">|
|2|IAM|<details><summary>Locks</summary><ins>To Create or delete locks</ins><br/>Users assigned to the **Owner** and the User **Access Administrator** roles<br/><br/>Some specialized built-in roles also grant this access. You can create a custom role with the required permissions</details>|<img src="https://i.imgur.com/9NZVqN2.png">|
|3|Network Watcher|
|4|Service Tag|a service tag is a convenient way to group specific IP address ranges associated with Azure services. This simplifies network security by allowing you to define rules based on service tags rather than individual IP addresses|<img src="https://i.imgur.com/ulkJfEj.png"><br/>NSG ServiceTag Outboud to Block StorageAccount:<br/><img src="https://i.imgur.com/pg4Mtka.png"><img src="https://i.imgur.com/6cEYaYd.png">|
|5|Storage Account|<details><summary>Performance</summary><ins>Standard:</ins><br/>1) general-purpose v2<br/>2) general-purpose v1 <- not exist anymore<br/><br/><ins>Premium:</ins></details>|
