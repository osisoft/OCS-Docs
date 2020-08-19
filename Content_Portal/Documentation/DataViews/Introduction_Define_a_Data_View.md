---
uid: DataViewsIntroductionDefine
---

# Introduction - Define a data view

This is an introduction to the recommended workflow for defining data views. The [Quick Start - Define a Data View](xref:DataViewsQuickStartDefine) shows these concepts in action. For details, see [Data View](xref:DataView) and [Resolved Data View](xref:ResolvedDataView).

Designing and tweaking a data view is expected to be an iterative process. You are not expected to "get it right the first time," nor to be an expert at the streams available in the Sequential Data Store. Data views provide an interactive way to select, identify, and arrange the data you and your applications need.

There are three main steps required to define a data view: 
1. Including data items (streams)
2. Including specific data fields
3. Arranging them within the data view.

This is not a one-way street. You are likely to keep adjusting the data fields included in the view even after you have begun working on how the fields are arranged in the data view.

## Prerequisite: Create a data view
Very little information is required to create a new data view. In fact, if you request that the system generate an identifier for the new data view, no information at all is necessary. However, it is recommended to specify a meaningful `.Id`, because the identifier cannot be changed later without recreating the data view. All other properties are modifiable.

## Include data items
Complete the following to define data items to include in a data view:

1. Define (or modify) `.Queries` for SDS streams to be included as data items in the data view. View the collection data items found by each query.
2. Use a distinct query for each general type of data item, such as streams about assets and streams about the weather where each asset is located.

You can return at any time to modify or add queries.

## Include specific data fields
Complete the following to define data fields to include in a data view:

1. View the information on which data fields resolve as available to include in the data view. Choose the fields you want, and add them to your data view's `.DataFieldSets`
2. If your streams have slight variations in property naming (e.g. a property called either `temperature` or `ambient_temperature`), combine fields so that they can match alternate values.

You can return at any time to adjust which fields are included in the data view.

## Group and identify data items

### Group items globally
You may wish to globally *group* the data items by some common factor (e.g. site or asset id).  Complete the following to group data items in a data view:

1. Define one or more fields as `.GroupingFields` of the data view. Data items will be grouped by these fields. The available field sets now include field(s) that link to the grouping field values.

2. Include the newly-available grouping value fields in the data view, so those values are included in the data view data.

### Identifying items locally within a data field set
If a group contains multiple data items from the same query, you may wish to *identify* those data items so that they are not ambiguous and so they will be aligned across groups.  Complete the following to identify data items within a data field set:

1. On the data field set in question, assign a field as the `.IdentifyingField` to tell the data items apart.
2. Ensure that each data field's label includes the {IdentifyingValue} token so the field labels are unique. The default field labels already include it.

You can return at any time to change the grouping fields and identifying fields.
