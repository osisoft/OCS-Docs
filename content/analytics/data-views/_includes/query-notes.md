Each query is executed independently to generate the list of data items. It is possible to have duplicate data items resulting from different queries. This can be desirable or undesirable depending on the use case.

There is a maximum of 100,000 data items that can be included in a data view. Note that each stream included will generate a data item, and as such a single asset may contribute multiple data items if it contains multiple stream references. Data items are ordered alphabetically by data item id within the data items collection.
