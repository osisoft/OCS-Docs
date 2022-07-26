---
uid: ManageConfigurations
---

# Manage edge system configurations

You can import an edge system configuration from the field to its corresponding edge system digital twin as a record. You can also create a new configuration, using a default configuration or a configuration template. Once the configuration is complete, you can export the configuration file for each component or for the edge system to manually apply to the edge system. You can use an exported configuration file to configure other edge systems by importing it. The maximum size for a configuration file is 16 MB.

Configuration is available for the following edge system types:

 - Edge Data Store

 - PI Adapter for BACnet
 
 - PI Adapter for DNP3
 
 - PI Adapter for Modbus TCP
 
 - PI Adapter for OPC UA

**Note:** An edge system appears on the `Software Management Edge Systems` page once it is writing health data to OCS. For information on configuring health endpoints, see the specific edge system product documentation.

## Import an edge system configuration

To import an edge system configuration from the field to the corresponding edge system digital twin:

1. In the left pane, select **Data Collection** > **Software Management**.

1. Verify that the **Edge Systems/Base Configurations** selector is set to **Edge Systems**.

1. Find and select the edge device to configure.

## Edit an edge system configuration

To edit an edge system configuration and export it for use:

1. In the left pane, select **Data Collection** > **Software Management**.

1. Verify that the **Edge Systems/Base Configurations** selector is set to **Edge Systems**.

1. Find and select the edge device to configure.

1. In the right pane, select **Edit Edge System** or ![Edit](../../../_icons/default/pencil.svg).

1. To manage the tags for an edge system, select **Add Tag** ![Add Tag](../../../_icons/default/plus.svg) and then do the following:

   - To add a tag, enter the tag text in the **New Tag** field and press Enter.

   - To delete a tag, select **X** in the tag bubble.

1. To create the configuration, do one of the following:

   - To use the default configuration for the edge system type, select **Start With Default**. 
 
   - To select a JSON file that contains the configuration, select **Start With Default**. 

1. **Optional:** In the **Section Select** dropdown list, select the section of the configuration to modify. The default option of `JSON Configuration` shows the entire configuration.

1. Modify the JSON as needed. For configuration guidelines, refer to the specific edge system documentation. 

   Do not include secrets in the configuration. Secrets cannot be stored or exported in a configuration.

   Errors in the JSON syntax are underlined. To see an explanation of the issue, hold the mouse over the underlined text. The overall status of the JSON syntax is displayed over the right pane.  

1. To export the completed configuration, do one of the following:

   - To export just the selected section, select **Export Section** in the right pane.  

   - To export the entire configuration in one file, select **Export Configuration**.

   The JSON file is downloaded to your browser.

1. When you have finished, select **Save & Close**.

1. To confirm the changes, select **Save & Close**.  
