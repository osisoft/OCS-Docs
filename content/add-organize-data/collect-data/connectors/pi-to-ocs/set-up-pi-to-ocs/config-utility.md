---
uid: pi-to-ocs-utility
---

# Run the PI to OCS Agent Configuration Utility

Use the PI to OCS Agent Configuration Utility to configure your PI Data Archive server connection settings before creating a transfer and after an agent upgrade. You can use the utility to change a data source, view connection details, add PI mappings, and set data privacy settings.

### Topics in this section

* [Add a PI Data Archive](#add-a-pi-data-archive)

* [Create a PI mapping](#create-a-pi-mapping)

* [Set data privacy and add an agent description](#set-data-privacy-and-add-an-agent-description)

* [List of agent status states](#list-of-agent-status-states)

* [Access the PI to OCS Agent Configuration Utility](#access-the-pi-to-ocs-agent-configuration-utility)

## Add a PI Data Archive

You must add and configure the source PI Data Archive you want to transfer on-prem data from to OCS. If you are upgrading an agent, the PI to OCS Agent Configuration Utility maintains the previously selected PI Data Archive configuration.

#### Before you begin

Install the [PI to OCS Agent](xref:install-agent). To open the PI to OCS Agent Configuration Utility, click the **Windows** menu button, then click **OSIsoft > PI to OCS Agent Configuration Utility**.

### Procedure

1. Click the ![](../../images/pda-source-icon.png) button in the PI to OCS Agent Configuration Utility.
   
   ![](../../images/config-utility-screen-01.png)
   
2. Enter the name of the source PI Data Archive in the text box, then click **Add Server**.

   **Result:** After successful detection, the PI Data Archive connection is added and you are advanced to the next page of the utility.
   ![PI Data Archive connection details](../../images/config-utility-screen-02.png)

3. Review the following details for your PI Data Archive:
   * Server name, version, and server ID
   * IP address
   * PI mapping (see [Create a PI mapping](#create-a-pi-mapping) for more information)
   * Connection status and timeout

4. **Optional:** Click the pencil icon next to the **Connection Timeout (sec)** text box to change the length of time the agent checks for a server connection before timing out.

5. **Optional**: Click the **Test Connection** button to confirm that the connection to the Data Archive is working.

6. **Optional**: Click the **Remove Server** button to remove the configured PI Data Archive from the PI to OCS connection.

7. Click **Save** to finish adding and saving the source PI Data Archive configuration settings.

8. **Optional:** If you are finished, click **Exit**.

   **Note:** You must click **Save** to save your PI Data Archive connection settings.  

## Create a PI mapping 

PI mappings enable access to data stored on a PI Data Archive by service accounts assigned to a PI identity.  PI mappings are created for a PI identity, user or group. Accounts assigned to a PI identity can read and transfer PI point data to OCS. See ["What are PI identities and mappings?"](https://docs.osisoft.com/bundle/pi-server/page/what-are-pi-identities-and-mappings_new.html) for more information. The following applies to PI mappings:

* The user account used to launch the utility must have permissions to create mappings.
* You can edit mappings.

#### Procedure

1. In the PI to OCS Agent Configuration Utility, click the pencil icon next to the **PI Mapping** field to open the **Configure Mapping** dialog box.

   ![Configure Mapping dialog box](../../images/configure-mapping-db.png)

2. Select an identity for the PI mapping under Identity.
3. Click **Create**.

   **Result:** The PI mapping is created for the selected identity, group or user.

   **Note:** If a PI mapping has already been created with another tool, a warning is displayed. 
4. Click **Close** to return to the utility, then click **Save**.

## Set data privacy and add an agent description

You can set data privacy settings and assign a descriptive name to an agent. Data privacy settings let you control wether a PI Data Archive host name is displayed in the OCS portal. If you opt to have a host name published, it appears on the PI to OCS Agents window as shown in the screen capture below.

![](../../images/pi-to-ocs-agents-hostname.png)

**Note:**  By default, host names are not published.

#### Procedure

1. In the PI to OCS Agent Configuration Utility, click the pencil icon to the right of the **Agent Service Account** field.
   **Result:** The `PI to OCS Agent Settings` dialog box opens.

   ![PI to OCS Agent Settings dialog box](../../images/agent-settings.png)

2. To have your PI to OCS Agent's hostname visible and displayed in OCS on the PI to OCS Agent page, select the **Opt-in to publishing PI to OCS Agent Hostname in OCS?** option.

3. **Optional:** Enter a descriptive name for the agent In the **PI to OCS Agent Description** text box.

4. Click **Ok** to save your selections, then click **Save** in the utility.

## List of agent status states

It may take a few minutes for your PI System to be registered. The following states may appear under the Agent Status field in the PI to OCS Configuration Utility to indicate a connection issue.

| **State**                     | **Description**                                              |
| ----------------------------- | ------------------------------------------------------------ |
| Data  Source Connection Issue | Indicates  the PI To OCS Agent isn’t able to connect to the PI Data Archive. Some  reasons for this status include the PI Data Archive is turned off, a firewall  issue is preventing connections or an incorrect name is configured for the  Data Archive (for example, trying to connect to a machine that doesn’t  exist/was renamed). There may be additional reasons for this status. |
| Data  Source Security Issue   | Indicates  the PI Data Archive connection is unsecure and security settings need to be  addressed. |
| Missing Configuration         | The PI Data Archive server or AF server has not been configured in the PI to OCS Agent. |
| Registration Failed           | Contact OSIsoft Customer support for assistance.             |
| Registering                   | The PI to OCS Cloud portion is creating the necessary resources for your PI to OCS Agent. |
| Shutdown                      | The last communication that the PI to OCS Cloud had with the agent was a shutdown message. |

## Access the PI to OCS Agent Configuration Utility

You can open the PI to OCS Agent Configuration Utility to change server connections and other settings after the initial setup. 

**Note:** If you're not the original user who installed the agent, the user account used needs to be authenticated in OCS before you can access the utility.

### Procedure

1. Click the Windows menu button.

2. On the Windows menu, scroll down and click **OSIsoft > PI to OCS Agent Configuration Utility**, then click **Yes**. 

   **Result:** Upon successful authentication, the **PI to OCS Agent Configuration Utility** opens.

   **Note:** If you have not yet added a PI Data Archive server, see [Add a PI Data Archive](#add-a-pi-data-archive) for instructions.