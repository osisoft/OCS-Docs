---
uid: troubleshoot-pi-pt-errors
---

# Troubleshoot common PI point errors
The following table provides a list of common PI point errors that occur when the AF server is indexing, and solutions to resolve these issues.

| PI point error | Troubleshooting solution | 
| ------------- | ----------------- | 
| **PI Point Not Found** | Ensure that the PI point exists on the Data Archive configured and that the Identity that is mapped to the service account running the PI To OCS Agent has sufficient permissions to read the PI Point and the Data for the PI Point|
| **Cannot connect to the PI Data Archive. Windows authentication trial failed because insufficient privilege to access the PI Data Archive. Trust authentication trial failed because insufficient privilege to access the PI Data Archive.** | Configure a PI mapping for the service account running the PI To OCS Agent that can connect to PI Data Archive. OSIsoft recommends this approach as it is the most secure connection method. For information on creating PI mappings, see the section on how to create a PI mapping in the [Run the PI to OCS Agent Configuration Utility](https://docs.osisoft.com/bundle/ocs/page/add-organize-data/collect-data/connectors/pi-to-ocs/set-up-pi-to-ocs/config-utility.html) topic. |
| **[-10722] PINET: Timeout on PI RPC or System Call** | Ensure the Data Archive is turned on, responsive, and able to receive connections over port 5450. |