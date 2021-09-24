---
uid: ConfigureEdgeSystem
---

# Configure an edge system

You can create and manage edge system configurations within OCS. Once the configuration is complete, you can export configuration files by component or edge system to manually apply to the edge system. You can also use an exported configuration file as a template for configuring other edge systems by importing it during configuration.

Use the following procedure to create an edge system configuration and export it for use:

1. In the left pane, select **Data Management** > **Edge Systems**.

1. Find and click on the edge device to configure.

1. In the right pane, click **Edit Edge System** or ![Edit Edge System](/images/pencil-icon.png "Edit Edge System").

1. To manage the tags for an edge system, click **Add Tag** ![Alt](/images/edge-system-add-tag.png "Add") and then do the following:

 1. To add a tag, enter the tag text in the **New Tag** field and press Enter.

 1. To delete a tag, click **X** in the tag bubble.

1. To create the configuration, do one of the following:

 - Click **Start With Default** to use the default configuration for the edge system type.
 
 - Click **Import Configuration** to select a JSON file that contains the configuration.

1. In the **Section Select** field, select the section of the configuration to modify or select `JSON Configuration` to see the entire configuration.

1. Modify the JSON as needed.

 **Note:** Errors in the JSON syntax are underlined. Hold the mouse over the underlined text to see an explanation of the issue. The overall status of the JSON syntax is displayed over the right pane.  

1. To export the completed configuration, do one of the following:

 - Click **Export Section** in the right pane to export just the selected section. 

 - Click **Export Configuration** to export the entire configuration in one file.

 The JSON file is downloaded to your browser.

1. When you have finished configuring the edge system, click **Save & Close**.

1. Click **Save & Close** to confirm the changes. 
