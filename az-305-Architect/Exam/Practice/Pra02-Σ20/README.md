# Pra02-Σ20

---

## Questions
|n|Question|Answer|
|-|--------|------|
|1|You company has deployed several VMs on-premises & to Azure. Azure ExpressRoute has been deployed & confiugred for on-premises to Azure connectivity<br/>Several VMs are exhibiting network connectivity issues<br/>You need to analyze the network traffic to determine whether packets are being allowed or denied to the VMs<br/><br/>Solution : Use Azure Advisor to analyze the network traffic<br/>Does the solution meet the goal?<br/><br/>a. yes<br/>b. no|<details><summary>Answer</summary>b. no<br/><br/>Instead user Azure Network Watcher to run IP flow verify to analyze the network traffic<br/>**Note:** Advisor is a personalized cloud consultant that helps you follow best practices to optimize your Azure deployments. It analyzes your resource confiuguration & usage telemetry & then reccomends solution that can help you improve the cost effectiveness, performance, high avaialability, & security of your Azure resources<br/><br/>With Advisor, you can:<br/>- Get proactive, actionalble, & personalized best practices recommendations<br/>- Improve the performance, security, & high availability of your resources, as you identify oppertunites to reduce your overall Azure spend<br/>- Get recommendation with proposed actions inline<br/>ref:<br/>https://learn.microsoft.com/en-us/azure/network-watcher/network-watcher-overview<br/>https://learn.microsoft.com/en-us/azure/network-watcher/ip-flow-verify-overview</details>|
