---
uid: troubleshoot-missing-pida
---

# Troubleshoot missing PI Data Archive configuration

If a PI to OCS agent's status appears as "No PI Data Archive Configured" in the PI to OCS Agents window, you can correct this issue in the PI to OCS Agent Configuration Utility.

1. [Open the PI to OCS Agent Configuration Utility](xref:pi-to-ocs-utility) and connect to the OCS portal.

1. After successful authentication, click the Data Archive Server tab, then click the pencil icon next to **PI Mapping**.  

    **Result:** The **Configure Mapping** dialog box. 

1. Select an identity you want to assign to the machine with the installed agent for the PI mapping under **Identity**.

1. Click **Edit**.

    **Result:** The PI mapping is created for the selected identity, group or user.

1. Click **Close** to exit out of the **Configure Mapping** dialog box. 

1. Click **Remove Server**, then click **Yes** to remove the server and return to the first screen of the PI to OCS Configuration Utility. 

1. Add the Data Archive server back to the configuration. 

1. After the Data Archive has been successfully added, click **Save** to save your connection settings.