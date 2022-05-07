---
uid: MetadataMaintenance
---

# Maintain a metadata rule

## Edit a metadata rule

To edit an existing metadata rule:

1. In the left pane, select **Data Management** > **Stream Metadata Rules**.

1. Select an existing metadata rule.

1. Select **Edit metadata rule**.

1. To reset the pattern and all mappings, select **Reset Pattern**, then proceed as when creating a new rule. See [Create a metadata rule](xref:gpMetadataRules).

1. To update the mappings, on the `Update Mappings` page do one of the following for each metadata key:

     - To display the raw stream data for the specified metadata key, select **Copy Values** under **Mapping Type**.

     - To assign a label to data values:

       - Select **Map Values** and select **Generate Mappings**.

       - In the **Map To** field, enter the label to display for each defined metadata key.

       - (Optional) Select **Add Mapping** to define a mapping for any other stream name part.

    When you have defined mappings for a metadata key, a green check mark appears next to the key.

1. Select **Next**. All matching streams for the rule are displayed.

1. On the `Preview and Run` page, edit the **Name** and **Description**, if needed.

1. Select **Save & Execute**.

## Remove a metadata rule

To remove an existing metadata rule:

1. In the left pane, select **Data Management** > **Stream Metadata Rules**.

1. Select an existing metadata rule.

1. Select **Remove metadata rule**.

1. If you do not wish to remove all stream metadata written by this rule, uncheck **Remove Associated Metadata**.

1. Select **Remove** to confirm.

## Set permissions for a metadata rule

Once a metadata rule has been created, you can set permissions to manage access to it.

To set permissions for a metadata rule:

1. In the left pane, select **Data Management** > **Stream Metadata Rules**.

1. Select a metadata rule and select **Manage Permissions**.

1. On the `Manage Permissions` page, select a role from the **Selected role** dropdown list.

1. Select **Allow** or **Deny** for each of the following permissions: **Read**, **Write**, **Delete**, and **Manage Permissions**.

1. Select **Save**.
