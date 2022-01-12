---
uid: install-agent
---

# Install the PI to OCS Agent

When you install the PI to OCS Agent, make sure to follow these guidelines:

* Install the agent on a host computer separate from your PI Server deployment.

* Use a domain account that has been granted Administrator privileges on a computer registered to the same domain.

* Enable read access to Data Archive security tables and the PI points and data to be transferred.

* Enable read access to the AF server elements and attributes to be transferred.

You can download the PI to OCS Agent from the PI to OCS Agents page on the portal and then transfer it to the computer that will host the agent.

**Note:** The PI to OCS Agent installation cannot be completed if the system time is not correct. Additionally, you will not be able to complete the PI to OCS Agent installation if Internet Explorer Enhanced Security Configuration is enabled. For more information, see [Disable Internet Explorer Enhanced Security Configuration](xref:disable-ie-security). 

## Configure access to PI Data Archive Security tables, PI point data, and optional AF server

**Important:** The PI to OCS Agent requires the Windows service account to `Run as user`. Enable read access to the following PI Server data:

* Archive data (PIARCDATA Security table)

* The PI points configuration table (PIPOINT Security table)

* The PI points and data to be transferred

* The AF server elements and attributes to be transferred 

## Installation process

Complete the following procedures to install the PI to OCS Agent:

* [Install the PI to OCS Agent](#install-the-pi-to-ocs-agent)

* [Verify the PI to OCS Agent is running and registered](#verify-the-pi-to-ocs-agent-is-running-and-registered)

## Install the PI to OCS Agent

To install the PI to OCS Agent, follow these steps:

1. In the left pane, select **Data Collection** > **PI to OCS Agents**.

1. Select **Download Agent**.

1. On the `Agent Installer Download` window, select **Download**. When the download completes, close the window.

1. Navigate to the downloaded PI to OCS agent installation file.

1. Right-click the PI to OCS Agent installation file, then select **Run as administrator**.

1. To confirm running the installation file, select **Yes**.

1. On the `Welcome` page of the `PI to OCS Agent` window, select **Next**.

   The `Company Information` page opens.

   ![](../../images/agent-co-info.png) <!--Angela Flores 11/12/21 - I don't think this screenshot is necessary. There is only one field on the screen. -->

1. In the **Tenant Id or Company Alias** field, enter your tenant ID or company alias and select **Next**.

   **Note:** You are logged on to your tenant account. The account used to log on must be assigned to the `Tenant Administrator` role to complete the PI to OCS Agent installation.

   A message opens in your web browser regarding the status of the user authentication process. 

1. Close the browser window, and then select **Next** on the `Browser Login` page.

1. On the `Namespace` page, complete the following fields, then select **Next**:

    * **Namespace** - Select the location where the transferred data will be stored. The region indicates where the namespace resides. Streaming data sent by the PI to OCS Agent only goes to the selected namespace's region.

    * **Agent Description** - Enter an optional name for the agent.

      **Result:** The **Service Account** page opens.

1. On the `Servive Account` page, select the service account type for the connection:

    * **NT Service** - Enter an NT account to connect to PI Data Archive.

    * **This account** - Specify a user name and password (domain\account) to connect to PI Data Archive.

    **Note:** The service account used to run the PI to OCS Service requires Administrator privileges. Read access to the PIARCDATA Security and PIPOINT Security tables, the PI points and data to be transferred, and the AF server, elements, and attribute data is required.

1. Select **Install**.

1. After the agent is installed, select **Close**.

    **Result**: The PI to OCS Configuration Utility opens. See [Run the PI to OCS Agent Configuration Utility](xref:pi-to-ocs-utility) for instructions.

    **Note:** An agent cannot be registered until a PI Data Archive server has been added and configured in the PI to OCS Configuration Utility.

## Verify the PI to OCS Agent is running and registered

After installation, check that the PI to OCS Agent Windows service is running on the machine where the agent is installed. You also should confirm the agent is registered in OCS. 

To verify the installation, follow these steps:

1. On the computer where the agent is installed, open the Microsoft Management Console (MMC) snap-in for Services. <!--Angela Flores 11/12/21 there is no mention of selecting a host machine for this installation before this point.-->

  **Tip:** Enter *services.msc* in Windows search to locate the application.

1. In the `Services` window, find the PI to OCS Agent service and verify that the status is `Running`, then close the window.

   ![](../../images/services-window.png)

1. In the AVEVA Data Hub portal, in the left pane, select **Data Collection** > **PI to OCS Agents**.

1. On the `PI to OCS Agents` page, select the connection you created.

1. On the `Details` pane, verify that Registered appears next to the **Agent Status** field.

   ![Agent status](../../images/details-pane.png)

   **Note:** The agent status is also displayed in the PI to OCS Configuration Utility. For a list of states and descriptions that explain why an agent may not be running, see [List of agent status states](xref:pi-to-ocs-utility#list-of-agent-status-states).
