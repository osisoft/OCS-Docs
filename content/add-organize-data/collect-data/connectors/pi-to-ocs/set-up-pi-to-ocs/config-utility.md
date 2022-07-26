---
uid: pi-to-ocs-utility
---

# Run the PI to OCS Agent Configuration Utility

Use the PI to OCS Agent Configuration Utility to set up and configure AF server and Data Archive data sources before creating a data transfer. After installing or upgrading a PI to OCS Agent, use the utility to select a source AF server or Data Archive, view connection details, create AF and PI mappings, set data privacy settings, and register the agent. 

The following table provides descriptions of the fields shown in the configuration utility. The image shows the AF server selected, but the fields are similar when a Data Archive server is selected.

   ![AF server details](../../images/af-details-refreshed.png)

| Field | Description                                                     |
| ----- | --------------------------------------------------------------- |
| Agent HostName  | Name of the host computer where the agent is installed. |
| Agent Description  | An optional name for the agent. |
| Agent Status  | Displays the agent's status. |
| Agent State  | Displays the agent's registration state. |
| Agent Version  | The installed PI to OCS Agent version. |
| Agent Service Account  | Type of agent service account. |
| PI to OCS Agent Settings ![Customize icon](../../images/agent-settings-icon.png) | Set data privacy options and assign an agent description. |
| Refresh Display ![Refresh icon](../../images/agent-refresh-icon.png) | Refresh the displayed agent and server information. |
| AF Server Name/Data Archive Server Name  | Source AF or Data Archive server name. |
| Alternate Display Name | An optional, alternate name for an AF or Data Archive server. | 
| AF Mapping/PI Mapping | The type of AF/PI mapping configured on the service account. |
| Connection Timeout | The time before the agent connection times out. |

## Open the PI to OCS Agent Configuration Utility

The PI to OCS Agent Configuration Utility opens after you install or upgrade a PI to OCS Agent. You can open the PI to OCS Agent Configuration Utility at any time to change server connections and other settings after initial setup. 

**Note:** If you use a different user account than the one that was used originally to install the agent, authentication is required before you can access the utility. 

To open the PI to OCS Agent Configuration Utility:

1. Select **Start** > **OSIsoft** > **PI to OCS Agent Configuration Utility**, and then select **Yes** to confirm.

   Upon successful authentication, the PI to OCS Agent Configuration Utility opens.

1. Select **Connect to OSIsoft Cloud Services**.
   
## Add an AF server

Add an AF server to the utility to be able to use it in data transfers. The utility validates an AF server connection to ensure the following criteria is met:

* The AF server is not currently registered to any other agents under the same namespace as the current agent.

* The version of PI Asset Framework (AF) installed on the AF server supports the features required for transfers.

To add an AF server:

1. Open the PI to OCS Agent Configuration Utility.

1. In the `PI to OCS Agent Configuration Utility` window, select the **AF** button.<!--Angela Flores 11/12/21 - I normally would not use button, but I can't tell from the screenshots what you actual need to select.-->

   **Note**: If a Data Archive server was added first, select **Add Asset Framework Server** on the left side of the window instead.

1. In the **AF Server Name** field, enter the name of the AF server, and then select **Add Server**.

   The utility displays the server details.

   **Note:** Once an AF Server has been added, the utility scans the configured AF server for referenced Data Archives. As the utility finds Data Archives, they are shown in the **Detected Data Archives** list. You can select and add the desired Data Archive. You do not have to wait for the scan to complete. You can also select **Add Data Archive Server** on the left and manually enter the name of the Data Archive if you do not want to wait for the scan.

1. Select one of the Data Archives listed under `Detected Data Archives`, and then select **Add Selected Data Archive**.

1. Review the AF source server details to ensure they are correct:

   * AF server name, version, and ID
   * IP address
   * Connection status and timeout

1. (Optional) To add an alternate name that appears in the path of the asset's metadata and in the portal if you opted to display it, select the pencil icon, type an alternate name, select **Set Display Name** and then select **Close**. See [Usage of server names and alternate display names within OCS](#usage-of-server-names-and-alternate-display-names-within-ocs).

1. (Optional) To change the length of time the agent checks for a server connection before timing out, select the pencil icon next to **Connection Timeout**.

1. To keep the current AF server configuration settings and restart the agent, select **Save**.

1. (Optional) To check that the connection to the AF server is working, select **Test Connection**.

1. (Optional) To delete a server connection, select **Remove Server**, then select **Yes** to confirm. 

   **Note:** After you save the AF server configuration settings and restart and register the agent, you need to select a default Data Archive in PI System Explorer to resolve substitution references for AF element attributes.

## Usage of server names and alternate display names within OCS

The AF server name, or its alternate display name, displays on the PI to OCS Agents page within OCS and is referenced in the path of an asset's metadata, which is visible in Asset Explorer (`__Path`).

The Data Archive name, or its alternate display name, appears in the PI to OCS Agents window within OCS, and is used in the StreamIds created by a transfer. StreamIds have the format `PI_[DataArchiveServerName]_[PIPointIDNumber]`.

**Note:** Setting an alternate display name for a Data Archive must be done *before* the initial start of a transfer. StreamIds are immutable. Once a stream is built, to change it you must delete all the original streams, configure the alternate display name, and restart the transfer.

## Select the default Data Archive in PI System Explorer

You need to specify the default Data Archive, also referred to as the default data server, for the PI system and PI AF database after setting an AF server. By default, PI AF databases inherit the PI AF Server's local default data server. See [Find the default Data Archive server](https://docs.osisoft.com/bundle/pi-server/page/find-the-default-pi-data-archive-server.html) for more information.

To select the default Data Archive:

1. Open PI System Explorer on the client machine.

1. Select **File** > **Server Properties**.

1. In the `PI AF Server Properties` window, select the data server from the **Default Data Server** dropdown list.

1. Select **Apply**, then select **OK** to save the selection.
 
1. Close PI System Explorer.  
 
## Create an AF Mapping

You can assign an AF mapping to an AF identity. AF mappings enable a specific service account assigned to an AF identity in PI System Explorer to read and transfer AF element and attribute data. You can also edit mappings with the utility.

**Note:** The user account used to launch the utility must have permission to create mappings.

To create an AF mapping:

1. Open the PI to OCS Agent Configuration Utility.

1. Select the pencil icon next to **AF Mapping**.
   
1. In the `Configure AF Mapping` window, for each mapping you want to add, select an identity and select **Save**.

  The AF mapping is created for the selected identity.
                                             
  **Note:** If an AF mapping has been created with another tool, a warning is displayed.
  
1. Select **Close** to return to the utility.

## Add a Data Archive

After adding an AF server, select the source Data Archive that contains the PI points you want to transfer. 

**Note:** There is a one-to-one (1:1) Data Archive to PI to OCS Agent constraint for PI to OCS transfers. If your AF server references multiple Data Archives, only one Data Archive can be selected and configured for the transfer.  

The list of available Data Archive servers is based on the servers referenced by AF elements on the AF server you selected. If you are upgrading an agent, the PI to OCS Agent Configuration Utility maintains the previously selected Data Archive configuration.  

**Note:** If you are not adding an AF server, select the Data Archive icon on the first screen of the PI to OCS Agent Configuration Utility.

To add a Data Archive:

1. Open the PI to OCS Agent Configuration Utility.

1. In the `PI to OCS Agent Configuration Utility` window, select the **Data Archive Server** button.

   **Note**: If an AF server was added first, select **Add Data Archive Server** on the left side of the window instead.
   
1. In the **Data Archive Server Name** field, enter the name of the Data Archive server, and then select **Add Server**.
   
   The Data Archive connection is added and details about the newly added Data Archive are displayed.

1. Review the following details for the Data Archive:
 
   * Server name, version, and server ID
   * IP address
   * Connection status and timeout
   
1. (Optional) To add an alternate name, select the **Alternate Display Name** pencil icon, type an alternate name, select **Set Display Name** and then select **Close**.

   **Note:** Setting an alternate display name for a Data Archive must be done *before* the initial start of a transfer. See [Usage of server names and alternate display names within OCS](#usage-of-server-names-and-alternate-display-names-within-ocs).

1. (Optional) To change the length of time the agent checks for a server connection before timing out, select the pencil icon next to **Connection Timeout (sec)**.

1. (Optional) To confirm that the connection to the Data Archive is working, select **Test Connection**.

1. (Optional) To remove the configured Data Archive, select **Remove Server**.

1. To retain the current Data Archive configuration, select **Save**.

## Create a PI mapping 

PI mappings enable access to data stored on a Data Archive by service accounts assigned to a PI identity. PI mappings can be created for a PI identity, user, or group. Accounts assigned to a PI identity can read and transfer PI point data to OCS. For more information, see ["What are PI identities and mappings?"](https://docs.osisoft.com/bundle/pi-server/page/what-are-pi-identities-and-mappings_new.html). You can also edit mappings with the utility.

**Note:** The user account used to launch the utility must have permissions to create mappings.

To create a PI mapping:

1. Open the PI to OCS Agent Configuration Utility.

1. Select the Data Archive server on the left side of the page.

1. Select the pencil icon next to **PI Mapping**.
 
   The `Configure Mapping` window opens.<!--AF 11/12/21 Why does PI Mapping have a screenshot, but AF mapping doesn't? Do we really need it?-->

    ![Configure Mapping dialog box](../../images/configure-mapping-window.png)

1. For each mapping you want to add, select an identities for the PI mapping, and then select **Create**.

   The PI mapping is created for the selected identity, group, or user.

   **Note:** If a PI mapping has already been created with another tool, a warning is displayed. 

1. Select **Close** to return to the utility, and then select **Save** in the utility.

## Set data privacy and add an agent description

Use the PI to OCS Agent Settings to add a descriptive name for the agent and to configure data privacy. This description appears where the agent is referenced and allows you to search by agent description. Data privacy settings control whether a host name of a Data Archive is published and displayed in OCS. By default, host names are not published. If you opt to have a host name published, it appears in the portal on the `PI to OCS Agents` page as shown below: 

![Agent description and hostname displayed in PI to OCS Agents page](../../images/pi-to-ocs-agents-hostname.png)

To configure data privacy and add an agent description:

1. Open the PI to OCS Agent Configuration Utility.

1. Select the pencil icon to the right of **Agent Service Account** to open the `PI to OCS Agent Settings` window.

1. To publish the hostname, select the **Opt-in to publishing PI to OCS Agent Hostname in OCS?** option under `Data Privacy`.

1. (Optional) In the **PI to OCS Agent Description** field, enter a descriptive name for the agent.

1. To save your selections, select **Ok**, and then select **Save** in the utility.

## List of agent states

It may take a few minutes for a PI System to register with OCS. The table below lists the various states that may appear under **Agent State** in the PI to OCS Configuration Utility.

| **State**                     | **Description**                                              |
| ----------------------------- | ------------------------------------------------------------ |
| Data Source Connection Issue  | Indicates the PI To OCS Agent cannot connect to the Data Archive. Some reasons for this status include the Data Archive is turned off, a firewall issue is preventing connections, or an incorrect name is configured for the Data Archive. For example, the agent is trying to connect to a machine that does not exist or was renamed. There may be additional reasons for this status. |
| Data Source Security Issue    | Indicates the Data Archive connection is unsecured and security settings need to be addressed. |
| Missing Configuration         | The Data Archive server has not been configured in the PI to OCS Agent. |
| Registration Failed           | Contact OSIsoft Customer support for assistance.             |
| Registering                   | The PI to OCS Cloud portion is creating the necessary resources for the PI to OCS Agent. |
| Shutdown                      | The last communication that the PI to OCS Cloud had with the agent was a shutdown message. |
