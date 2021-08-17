---
uid: gsPItoOCS
---

# Get started with PI to OCS connections

Before you set up your PI to OCS connection, see [PI System best practices](xref:bpPISystemConnection) for recommendations on the PI OCS Agent.

To use PI to OCS to transfer data from your PI System to OCS, you must complete the following tasks:

- Install the PI to OCS Agent.
- Set up your PI to OCS connection in the PI to OCS Configuration Utility.
- Create a data transfer.

**Prerequisite:** The exercise below assumes that your organization has a PI System with default PI points (for example, `sinusoid`) stored on Data Archive.

## Set up a PI to OCS transfer

1.  Click the ![Menu icon](images\menu-icon.png) icon, then click **Data Collection** > **PI to OCS Agents**.

1.  Select **Download Agent**, then follow the instructions in the [Install the PI to OCS Agent](xref:install-agent).

1. After agent installation, follow the instructions in the [Run the PI to OCS Agent Configuration Utility](xref:pi-to-ocs-utility) to set up your PI to OCS connection and register your agent on OCS.

1.  After successful data source configuration, return to the `PI to OCS Agents` window in the OCS portal.

1.  Select your PI to OCS Agent connection in the `PI to OCS Agents` window, then select **Create Transfer** in the right pane.

1.  Follow the steps in the [Transfer data to OCS](xref:transfer-data) procedure to define transfer settings and transfer data into OCS.

## Next step

If you have not already completed [Get started with OMF connections](xref:gsOMF), do this next. Otherwise, continue with [Get started with types](xref:gsTypes).
