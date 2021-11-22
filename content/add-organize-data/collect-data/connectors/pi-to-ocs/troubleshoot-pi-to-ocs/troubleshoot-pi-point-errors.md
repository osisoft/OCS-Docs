---
uid: troubleshoot-pi-pt-errors
---

# **Troubleshoot common PI point errors**

Certain PI point errors can occur when the AF server is indexing. The following table lists a few common PI point errors and troubleshooting solutions.

| PI point error                                               | Troubleshooting solution                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| PI Point Not Found | Ensure the PI point exists on the configured Data Archive. Verify that the identity is mapped to the service account running the PI To OCS Agent and also has read permission on the PI point and the PI point data. |
| PI Point Type Change Detected | Check the [PI to OCS event logs](xref:view-logs) in the Windows Event Viewer for the cause of the error. Filter the logs by "Type Change" or event ID "204" to locate the error message that contains the ID of the PI point that had its type changed. Change the type of this point to match its respective SDS Stream type. Then, restart the transfer to ensure all data is sent from the PI point in question. See [PI point type change](xref:pi-point-change) for more information. |  
| Cannot connect to the PI Data Archive. Windows authentication trial failed because insufficient privilege to access the PI Data Archive. Trust authentication trial failed because insufficient privilege to access the PI Data Archive. | Configure a PI mapping for the service account running the PI To OCS Agent that can connect to PI Data Archive. We recommend this approach as it is the most secure connection method. For information on creating PI mappings, see the section on how to create a PI mapping in the [Run the PI to OCS Agent Configuration Utility](xref:pi-to-ocs-utility) topic. |
| [-10722] PINET: Timeout on PI RPC or System Call | Ensure the Data Archive is turned on, responsive, and able to receive connections over port 5450. |
