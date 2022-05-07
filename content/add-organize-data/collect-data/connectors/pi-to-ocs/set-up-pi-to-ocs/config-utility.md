---
uid: pi-to-ocs-utility
---

# Run the PI to OCS Agent Configuration Utility

Use the PI to OCS Agent Configuration Utility to set up and configure AF server and Data Archive data sources before creating a data transfer. After installing or upgrading a PI to OCS Agent, use the utility to select a source AF server or Data Archive, view connection details, create AF and PI mappings, set data privacy settings, and register the agent. 

The following image shows the important elements of the utility and table below provides descriptions of the elements.<!--AF 11/12/21 why are there two comments on the image in addition to the numbered callouts? shouldn't they all be numbered callouts?-->  

   ![AF server details](../../images/utility-callouts.png)

| Number  | Description                                                  |
| :-----: | ------------------------------------------------------------ |
| 1  | Name of the host computer where the agent is installed.       |
| 2  | An optional name for an agent.                                |
| 3  | Displays the PI to OCS Agent's status.                        |
| 4  | Provides details about the agent's registration state.        |
| 5  | Currently running PI to OCS Agent version.                    |
| 6  | Type of agent service account.                               |
| 7  | Set data privacy options and assign an agent description.    |
| 8  | View information about the server connection and its configuration. |
| 9  | Source AF server name.                                        |
| 10 | Type of AF mapping configured for the service account. Select the pencil icon next to this field to assign an AF mapping to an AF identity. |

   **Note:** After a PI Data Archive server is added, similar information in the table above is displayed in the utility.

## Open the PI to OCS Agent Configuration Utility

The PI to OCS Agent Configuration Utility opens after you install or upgrade a PI to OCS Agent. You can open the PI to OCS Agent Configuration Utility at any time to change server connections and other settings after initial setup. 

**Note:** If you are not the user who installed the agent, authentication with your user account is required before access is granted to the utility. 

To open the PI to OCS Agent Configuration Utility, follow these steps:

1. Select **Start** > **OSIsoft** > **PI to OCS Agent Configuration Utility**, and then select **Yes** to confirm.

   Upon successful authentication, the PI to OCS Agent Configuration Utility opens.

1. Select **Connect to OSIsoft Cloud Services**.
   
## Add an AF server

Add an AF server to the utility to be able to use it in data transfers. The utility validates an AF server connection to ensure the following criteria is met:

* The AF server is not currently registered to any other agents under the same namespace as the current agent.

* The version of PI Asset Framework (AF) installed on the AF server supports the features required for transfers.

To add an AF server, follow these steps:

1. In the `PI to OCS Agent Configuration Utility` window, select the **AF** button.<!--Angela Flores 11/12/21 - I normally would not use button, but I can't tell from the screenshots what you actual need to select.-->

1. In the **AF Server Name** field, enter the name of the AF server, and then select **Add Server**.
 
   The utility displays the server details.

   ![Agent status and state after refresh](../../images/af-details-refreshed.png)

​   **Note:** Once an AF Server has been added, the utility searches for PI Data Archives that are referenced by the AF server. 

1. (Optional) Select one of the Data Archives listed under `Detected Data Archives`, and then select **Add Selected Data Archive**.

1. Review the AF source server details to ensure they are correct:

   * AF server name, version, and ID

   * IP address

   * Connection status and timeout

1. (Optional) To change the length of time the agent checks for a server connection before timing out, select the pencil icon next to the **Connection Timeout** field.

1. To keep the current AF server configuration settings and restart the agent, select **Save**.

1. (Optional) To check that the connection to the AF server is working, select **Test Connection**.

1. (Optional) To delete a server connection, select **Remove Server**, then select **Yes** to confirm. 

   **Note:** After you save the AF server configuration settings and restart and register the agent, you need to select a default Data Archive in PI System Explorer to resolve substitution references for AF element attributes.

## Select the default Data Archive in PI System Explorer

You need to specify the default Data Archive, also referred to as the default data server, for the PI system and PI AF database after setting an AF server. By default, PI AF databases inherit the PI AF Server's local default data server. See [Find the default PI Data Archive server](https://docs.osisoft.com/bundle/pi-server/page/find-the-default-pi-data-archive-server.html) for more information.

To select the default Data Archive, follow these steps:

1. Open PI System Explorer on the client machine.

1. Select **File** > **Server Properties**.

1. In the `PI AF Server Properties` window, select the **Default Data Server** down arrow, and then select the data server to be the default.<!--AF 11/12/21 what is Default Data Server down arrow???-->

1. Select **Apply**, then select **OK** to save the selection.
 
1. Close PI System Explorer.  
 
## Create an AF Mapping

You can assign an AF mapping to an AF identity. AF mappings enable a specific service account assigned to an AF identity in PI System Explorer to read and transfer AF element and attribute data. You can also edit mappings with the utility.

**Note:** The user account used to launch the utility must have permission to create mappings.

To create an AF mapping, follow these steps:

1. Open the PI to OCS Agent Configuration Utility.

1. Select the pencil icon next to the **AF Mapping** field.
   
1. In the `Configure AF Mapping` window, for each mapping you want to add, select an identity and select **Save**.

  The AF mapping is created for the selected identity.
                                             
  **Note:** If an AF mapping has been created with another tool, a warning is displayed.
  
1. Select **Close** to return to the utility.

## Add a PI Data Archive

After adding an AF server, select the source PI Data Archive that contains the PI points you want to transfer. 

**Note:** There is a one-to-one (1:1) Data Archive to PI to OCS Agent constraint for PI to OCS transfers. If your AF server references multiple Data Archives, only one Data Archive can be selected and configured for the transfer.  

The list of available PI Data Archive servers is based on the servers referenced by AF elements on the AF server you selected. If you are upgrading an agent, the PI to OCS Agent Configuration Utility maintains the previously selected PI Data Archive configuration.  

**Note:** If you are not adding an AF server, select the PI Data Archive icon on the first screen of the PI to OCS Agent Configuration Utility.

To add a PI Data Archive, follow these steps:

1. Open the PI to OCS Agent Configuration Utility.
   
1. Select **Data Archive Server**, then enter the name of the Data Archive server, and then select **Add Server**.
   
   The PI Data Archive connection is added and details about the newly added PI Data Archive are displayed.

1. Review the following details for the PI Data Archive:
 
   * Server name, version, and server ID

   * IP address

   * Connection status and timeout
   
1. (Optional) To change the length of time the agent checks for a server connection before timing out, select the pencil icon next to the **Connection Timeout (sec)** field.

1. (Optional) To confirm that the connection to the Data Archive is working, select **Test Connection**.

1. (Optional) To remove the configured PI Data Archive, select **Remove Server**.

1. To retain the current PI Data Archive configuration, select **Save**.

## Create a PI mapping 

PI mappings enable access to data stored on a PI Data Archive by service accounts assigned to a PI identity. PI mappings can be created for a PI identity, user, or group. Accounts assigned to a PI identity can read and transfer PI point data to OCS. For more information, see ["What are PI identities and mappings?"](https://docs.osisoft.com/bundle/pi-server/page/what-are-pi-identities-and-mappings_new.html). You can also edit mappings with the utility.

**Note:** The user account used to launch the utility must have permissions to create mappings.

To create a PI mapping, follow these steps:

1. Open the PI to OCS Agent Configuration Utility.

1. Navigate to the `PI Data Archive details` page.

1. Select the pencil icon next to the **PI Mapping** field.
 
   The `Configure Mapping` window opens.<!--AF 11/12/21 Why does PI Mapping have a screenshot, but AF mapping doesn't? Do we really need it?-->

    ![Configure Mapping dialog box](../../images/configure-mapping-window.png)

1. For each mapping you want to add, select an identities for the PI mapping, and then select **Create**.

   The PI mapping is created for the selected identity, group, or user.

   **Note:** If a PI mapping has already been created with another tool, a warning is displayed. 

1. Select **Close** to return to the utility.

## Set data privacy and add an agent description

Use the PI to OCS Agent Settings to add a descriptive name for the agent and to configure data privacy. This description appears where the agent is referenced and allows you to search by agent description. Data privacy settings control whether a host name of a PI Data Archive is published and displayed in OCS. By default, host names are not published. If you opt to have a host name published, it appears in the portal on the `PI to OCS Agents` window as shown below: 

![Agent description and hostname displayed in PI to OCS Agents window](../../images/pi-to-ocs-agents-hostname.png)
<!--AF 11/12/21 I would change the callouts in the image to be minimal, like "Agent description" and "host name". Then add any additional explanation here in text. It will be easier to read and easier to maintain. -->

To configure data privacy and add an agent description, follow these steps:

1. Open the PI to OCS Agent Configuration Utility.

1. To open the `PI to OCS Agent Settings` window, select the pencil icon to the right of **Agent Service Account**.

1. To publish the hostname, select the **Opt-in to publishing PI to OCS Agent Hostname in OCS?** option under `Data Privacy`.

1. (Optional) In the **PI to OCS Agent Description** field, enter a descriptive name for the agent.

1. To save your selections, select **Ok** , and then select **Save** in the utility.

## List of agent status states

It may take a few minutes for a PI System to register with OCS. The table below lists the various states that may appear under the **Agent Status** field in the PI to OCS Configuration Utility.

| **State**                     | **Description**                                              |
| ----------------------------- | ------------------------------------------------------------ |
| Data Source Connection Issue | Indicates the PI To OCS Agent cannot connect to the PI Data Archive. Some reasons for this status include the PI Data Archive is turned off, a firewall issue is preventing connections, or an incorrect name is configured for the Data Archive. For example, the agent is trying to connect to a machine that does not exist or was renamed. There may be additional reasons for this status. |
| Data Source Security Issue   | Indicates the PI Data Archive connection is unsecured and security settings need to be addressed. |
| Missing Configuration         | The PI Data Archive server has not been configured in the PI to OCS Agent. |
| Registration Failed           | Contact OSIsoft Customer support for assistance.             |
| Registering                   | The PI to OCS Cloud portion is creating the necessary resources for the PI to OCS Agent. |
| Shutdown                      | The last communication that the PI to OCS Cloud had with the agent was a shutdown message. |
