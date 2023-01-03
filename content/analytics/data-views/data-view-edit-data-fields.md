---
uid: data-view-edit-data-fields
---

# Edit data field labels

Edit data field labels to create a friendly for a field that displays in your data view.

## Data field labels

[!include[data-view-label](../../_includes/data-view-label.md)]

To edit data field labels, enter `{` to display tokens to use as a data field label. [!include[field-label-tokens](../../_includes/data-view-field-label-tokens.md)]

## To edit data field labels

1. From the **Data Field Label** field, enter one or more tokens to use as a label. At the time of data view resolution, the labels resolve to values pulled from the data item (stream or asset). For more information on each available token, see [Data field labels](#data-field-labels).

1. (Optional) Select the **Include UOM as a Column** checkbox. This option includes the unit of measure as a column in your data view.

1. (Optional) Select a **Summary direction**. This option controls whether the start or end index of the summary is used by the data view to calculate the summary values. For more information, see <xref:DataViewsSummaries>.

1. Review the **Data Field Preview**. This preview lists each data field and property included within the affected data view queries.

1. Select **Apply**
