A data view is a declarative query and shape for OSIsoft Cloud Services (OCS) data. It includes the following objects, which you will configure as you complete the data view creation workflow:

- **Query**: Determines what data items are included in a data view. Queries can include streams or assets. A data view can have multiple queries.

- **Data field set**: Collections of fields originating from the same query.

- **Data view shape**: Determines if the data should be returned in the standard grouped row format or a narrow view, which is a pivot of the standard table.

- **Index field**: Determines the primary index type and label of the index. The index must be a timestamp and displays in the first column of the data view.

	**Note:** You can create data views with non-DateTime indexes using the REST API. For more information, see <xref:DataViewsQuickStartDefine>.

Data views also include other configurations such as grouping instructions and default date range and interval.
