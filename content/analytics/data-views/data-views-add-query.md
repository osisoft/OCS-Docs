---
uid: data-views-add-query
---

# Step 2: Add a query

[!include[add-query](_includes/add-query.md)]

## To add a query

1. (Optional) From **Query Id**, overwrite the default value of `Query1` with a unique identifier.

1. From **Query Source**, select a namespace ![namespace](../../_icons/default/database.svg) or community ![community](../../_icons/default/share-variant.svg) to query operational data from. The source can either be a namespace from your own tenant or a community.

   You can filter the namespaces and communities that are listed using the slide toggles and the filter field.

   **Getting `This namespace does not allow data to be processed outside of the region where it resides` while adding a query?** See [Cross region processing disabled](xref:data-view-troubleshooting#cross-region-processing-disabled).

1. From **Query Type**, select the type of object that you want to search for in the query source: **Streams** or **Assets**.

1. From **Query Value**, enter a query to find the objects that you want to include in the data view. Then select **Search**.

   For more information on how to enter a query, see <xref:search>.

   When the query populates with objects, you can view more about each object by selecting it from the table. The object details display in the pane on the right.

   [!include[query-notes](_includes/query-notes.md)]

1. (Optional) To add additional queries to the data view, select **Add Query** and repeat the steps listed above.

1. Once you are satisfied with your queries and query results, select **Save**.

[!include[ineligible-data-items](_includes/ineligible-data-items.md)]

## Next steps

Continue to <xref:data-view-select-data-fields>.