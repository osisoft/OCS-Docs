---
uid: bpPISystemConnection
---

# PI to OCS best practices

Only a single PI to OCS Agent can connect to a single PI server or optional AF server and transfer data to a single namespace. This restriction prevents multiple PI to OCS Agents from pulling data from a single PI Data Archive, which places an excessive load on the server. The following actions are recommended to address this issue:

- Install the PI to OCS Agent on a host computer that is separate from the PI Data Archive deployment, so it does not add to the load on the server.

- Keep the PI to OCS Agent software version up-to-date for the best performance. The portal indicates when an agent is out of date and needs to be updated.
 
**Note:** Multiple PI to OCS Agents can connect to and transfer data from the same PI Server if the agents are installed on different machines and assigned to different namespaces within the same tenant.  
