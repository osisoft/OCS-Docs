---
uid: data-view-edit-data-view
---

# Edit a data view

After you have completed initial configuration of a data view, you will likely continue to iterate of the data view until it precisely shapes and selects your OSIsoft Cloud Services (OCS) data. 

## Data view tasks

You can perform the following tasks while editing a data view:

- <xref:data-view-edit-data-fields>

    You can include data fields that represent a particular source of information within your data view, such as the id for a data item or the values from one of its properties.

- <xref:data-view-configure-grouping-fields>

	You can organize the data items within a data view by grouping them, which is one method of producing a meaningful, consumable shape of data. Configure grouping fields using the **Grouping Fields** accordion panel. Grouping is optional when defining the data view.

- <xref:data-views-configure-identifying-fields>

	An identifying field can be used to uniquely identify data items within a group. For example, if a query contains a ambiguously named stream property such as `Value`, you might choose a metadata property that uniquely describes the stream as the identifying field.

- <xref:data-view-link-fields>

	Data items included in a data view may have slight differences in property naming, despite those properties representing the same logical thing. For example, data from one equipment manufacturer reports `Temperature`, while another reports `Temp` instead.

	Data views can overcome property naming differences by linking these similar properties into a single data field. This applies to stream properties referenced by id or by name, and to stream metadata keys. Asset properties can also be linked.

- <xref:data-view-configure-field-order>

	By default, fields added to a field set are listed alphabetically within your data view. However, you can manually edit the order that fields display. Fields will display in your data view in the configured order, immediately following grouping fields.

	