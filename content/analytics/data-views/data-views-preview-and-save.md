---
uid: data-views-preview-and-save
---

# Step 5: Preview and save the data view

[!include[preview-and-save](_includes/preview-and-save.md)] You can also use the preview to select a default date and time for your index for when you launch the data view in the API console.

## Index configuration

Before retrieving your data view with third-party software for the purposes of data science, you can preview what it will look like by configuring a start and end index that limits the data included in the data view.

All data in a data view is associated with a index value derived from a timestamp. If there are multiple groups in the data view, the index and grouping field values together form a unique identifier for each data record.

**Note:** The index configuration settings available on the `Data View` page are primarily for preview purposes. When working with the data view in third-party software, you can modify the index configuration programmatically—the data view preview index configurations can be edited freely.

## To configure the index and preview the data view

To configure the index, select an index start and end value. Then generate the preview.

1. From the **Configure Data View Retrieval Type** dropdown, select a retrieval type:

	| Type | Description |
	|--|--|
	| **Interpolated** | Returns data between specified intervals. Streams in SDS may be configured to have non-default interpolation and extrapolation behavior. These behaviors are observed when stream data is included in data views. Data view data is always treated as dense, even if SDS returns sparse data. |
	| **Stored** | Returns stored or window data. The resulting data view data will include only index values that exist in the underlying data from the data items. |

1. Select the **Configure Data View Index Configuration** dropdown and define the following settings:

	| Setting | Description | 
	|--|--|
	| **Start Index** | The timestamp for the starting data point of the index. |
	| **End Index** | The timestamp for the ending data point of the index.<br>**Tip:** Select **Now** to set the current date and time. |
	| **Time Interval**<sup>1</sup> | The interval between data points. |
	| **Save Defaults with Data View** | If checked, the index configuration parameters are saved as defaults and used when these parameters are not explicitly included in an API request. |

	<sup>1</sup>This setting is only available for the **Interpolated** retrieval type. 

1. Select **Apply**.

	The data view preview is updated according to your index configuration. When you are done editing your data view, select **Save and Close** to finish initial configuration of your data view.

## Next steps

Launch you data view in the API console and retrieve it with a data-driven application. For more information, see <xref:data-views-retrieve>. 
