---
uid: troubleshoot-missing-pida
---

# Troubleshoot missing PI Data Archive configuration

If a PI to OCS agent's status appears as "No PI Data Archive Configured" in the PI to OCS Agents window, you can correct this issue in the PI to OCS Agent Configuration Utility.

1. Open the PI to OCS Agent Configuration Utility: On the Windows menu, scroll down and click **OSIsoft** > **PI to OCS Agent Configuration Utility**.

1. Connect to OSIsoft Cloud Services.

1. In the utility, click the **Data Archive Server** tab, then click the pencil icon next to **PI Mapping** to open the **Configure Mapping** dialog box. 

1. Select an identity you want to assign to the machine with the installed agent for the PI mapping under **Identity**.

1. Click **Create**.

 **Result:** The PI mapping is created for the selected identity, group or user.

1. Click **Close**. 

1. Remove the Data Archive server. 

1. Add the Data Archive server back to the configuration. 

1. Click **Save** to save your PI Data Archive connection settings.