---
uid: troubleshoot-missing-pida
---

# Troubleshoot missing PI Data Archive configuration

If a PI to OCS agent's status appears as `No PI Data Archive Configured` in the `PI to OCS Agent` window, you may be missing a PI mapping from the Data Archive server to the agent service account. You can correct this issue in the PI to OCS Agent Configuration Utility.

**Note:** There may be different reasons why the `No PI Data Archive Configured` status appears under **Data Archive Connection Status** in the PI to OCS Agent Configuration Utility. This topic addresses troubleshooting due to a missing PI mapping.

To add a missing PI Data Archive mapping:

1. Open the [PI to OCS Agent Configuration Utility](xref:pi-to-ocs-utility) and connect to the portal.

1. After successful authentication, select the Data Archive tab, then select the pencil icon under **PI Mapping**.  

1. In the `Identity` list on the `Configure Mapping` window, select the identity, group or user for the PI mapping.

1. Select **Create**.

   The PI mapping is created for the selected identity, group, or user.

1. To close the `Configure Mapping` window, select **Close**. 

1. To remove the server and return to the first page of the PI to OCS Configuration Utility, select **Remove Server**, then select **Yes**.

1. Add the Data Archive server back to the configuration. For more information, see [Run the PI to OCS Configuration Utility](xref:pi-to-ocs-utility).  

1. After the PI Data Archive has been successfully added, select **Save** to save the newly added server configuration.
