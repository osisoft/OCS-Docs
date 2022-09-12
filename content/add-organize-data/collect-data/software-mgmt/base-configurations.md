---
uid: AddBaseConfiguration
---

# Add and edit base configurations

You can create and edit base configurations for edge systems in OCS. Once the configuration is complete, you can export the configuration file by each component or edge system to manually apply to the edge system in the field. You can also use an exported configuration file as a template for configuring other edge systems by importing it during configuration. Default configurations are available for supported edge system types. The maximum size for a configuration file is 16 MB.

**Note:** You can create configuration templates for the following edge system types:

 - Edge Data Store

 - PI Adapter for BACnet
 
 - PI Adapter for DNP3
 
 - PI Adapter for Modbus TCP
 
 - PI Adapter for OPC UA
 
 - PI Adapter for MQTT
 
The `namespaceId` in the data and health endpoint URLs defaults to the namespace where the base configuration is created. For example, if the namespace of the base configuration is MyData, the endpoint URL would be `https://website.com/api/v1/Tenants/{tenantId}/Namespaces/MyData/Omf`.

Use mustache tokens, in the format `{{SecretA}}`, to denote secrets in configuration files. Secrets are managed using clients. The token name must match an Edge Management System property defined for the edge system. Tokens must be used in fields where `isEncrypted=true`. After deploying the configuration to the device, you must manually update the configuration on the device with the secret.

## Add a new base configuration

To create a edge system base configuration and export it for use:

1. In the left pane, select **Data Collection** > **Software Management**.

1. Verify that the **Edge Systems/Base Configurations** selector is set to **Base Configurations**.

1. Select **New Base Configuration**.

1. In the **Base Configuration Name** field, enter a name to identify the configuration.

1. In the **Type** and **Version** fields, select the edge system type and version for which to create the configuration.

   The default configuration for the selected edge system type displays.

1. To import a configuration, select **Import Configuration**, then browse to the JSON file that contains the configuration, and select **Import**.

1. (Optional) In the **Section Select** dropdown list, select the section of the configuration to modify. The default option of `JSON Configuration` shows the entire configuration.

1. Modify the JSON as needed. For configuration guidelines, refer to the specific edge system documentation.

   **WARNING:** For security reasons, do not include secrets in the configuration. Secrets cannot be stored or exported in a configuration. Client secrets and passwords must be applied directly on the device.

   Errors in the JSON syntax are underlined. To see an explanation of the issue, hold the mouse over the underlined text. The overall status of the JSON syntax is displayed over the right pane.  

1. To export the completed configuration, do one of the following:

   - To export just the selected section, select **Export Section** in the right pane. 

   - To export the entire configuration in one file, select **Export Configuration**.

   The JSON file is downloaded to your browser.

1. When you have finished, select **Save & Close**.

1. Select **Save & Close** to confirm the changes. 

## Edit an existing template

To modify a base configuration and export it for use:

1. In the left pane, select **Data Collection** > **Software Management**.

1. Verify that the **Edge Systems/Base Configurations** selector is set to **Base Configurations**.

1. Find and select the template to modify.

1. In the right pane, select the edit icon ![Edit](../../../_icons/default/pencil.svg).

1. Modify the template name, **Type**, and **Version** as needed.

1. **Optional:** In the **Section Select** dropdown list, select the section of the configuration to modify. The default option of `JSON Configuration` shows the entire configuration.

1. Modify the JSON as needed. For configuration guidelines, refer to the specific edge system documentation.

  **WARNING:** For security reasons, do not include secrets in the configuration. Secrets cannot be stored or exported in a configuration. Client secrets and passwords must be applied directly on the device.

  Errors in the JSON syntax are underlined. To see an explanation of the issue, hold the mouse over the underlined text. The overall status of the JSON syntax is displayed over the right pane.  

1. To export the completed configuration, do one of the following:

   - To export just the selected section, select **Export Section** in the right pane. 

   - To export the entire configuration in one file, select **Export Configuration**. 

   The JSON file is downloaded to your browser.

1. When you have finished, select **Save & Close**.

1. To confirm the changes, select **Save & Close**. 
