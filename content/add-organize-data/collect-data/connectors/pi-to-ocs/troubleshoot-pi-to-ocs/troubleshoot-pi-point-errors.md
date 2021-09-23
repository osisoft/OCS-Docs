---
uid: troubleshoot-pi-pt-errors
---

# **Troubleshoot common PI point errors**

Certain PI point errors can occur when the AF server is indexing. The following table lists a few common PI point errors and troubleshooting solutions.

| PI point error                                               | Troubleshooting solution                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **PI Point Not Found**                                       | Ensure the PI point exists on the configured Data Archive. Verify that the identity is mapped to the service account running the PI To OCS Agent and also has read permission on the PI point and the PI point data. |
| **Cannot connect to the PI Data Archive. Windows authentication trial failed because insufficient privilege to access the PI Data Archive. Trust authentication trial failed because insufficient privilege to access the PI Data Archive.** | Configure a PI mapping for the service account running the PI To OCS Agent that can connect to PI Data Archive. OSIsoft recommends this approach as it is the most secure connection method. For information on creating PI mappings, see the section on how to create a PI mapping in the [Run the PI to OCS Agent Configuration Utility](https://docs.osisoft.com/bundle/ocs/page/add-organize-data/collect-data/connectors/pi-to-ocs/set-up-pi-to-ocs/config-utility.html) topic. |
| **[-10722] PINET: Timeout on PI RPC or System Call**         | Ensure the Data Archive is turned on, responsive, and able to receive connections over port 5450. |
