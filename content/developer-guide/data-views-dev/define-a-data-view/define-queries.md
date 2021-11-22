---
uid: DataViewsQueries
---

# Define queries

Queries determine what data items are included in a data view.

## Query

Each `Query` must be uniquely identified with an `.Id`. The identifier should be meaningful. The query's results will be referenced by this identifier when you include fields in the data view.

The query text is the same as the corresponding data item's query syntax. For example, queries of kind Stream use [stream query syntax](xref:sdsSearching) and queries of kind Asset use [asset query strings](xref:assets-assets-search).

|Property| Type | Optionality  | Default  | Details |
|--|--|--|--|--|
| Id  | string | Required |  | Unique identifier. Used by `FieldSet` to link to the query's results. |
| Kind  | DataItemResourceType | Optional | Stream | Type of resource to be queried. |
| Value | string | Optional | null | A query for OCS resources in the corresponding query syntax.

## Using queries

### Querying data items of differing nature
To include data items of completely different nature (like power inverters and weather stations), use one query for each. 

For example:
```json
"Queries": [
  {
    "Id": "inverter power measurements",
    "Kind": "Stream",
    "Value": "inverter:* AND measurement:power*"
  },
  {
    "Id": "weather stations",
    "Kind": "Stream",
    "Value": "tags:weather"
  }
]
```
Using separate queries means the data items will be available in separate field sets. This is good, because a power inverter has completely different fields versus a weather station.

### Querying data items of a common nature
In the example scenario, streams that originate from an OSIsoft PI System represent only one fundamental measurement (e.g. Power In), unlike the more general case where the stream may represent several measurements (e.g. Temperature, Solar Radiation, and Cloud Cover). This means that multiple streams refer to the same physical or logical asset. 

In the example scenario, each power inverter is associated with two streams. It makes sense to structure our query around the physical asset, returning all "power*" measurements of all inverters:
```json
"Queries": [
  {
    "Id": "inverter power measurements",
    "Kind": "Stream",
    "Value": "inverter:* AND measurement:power*"
  }
]
```

These streams will be available in one single field set. This is good, because our data view can operate in terms of physical assets, and not be bound by how the stream data was recorded.

## Asset queries

Users can create a data view by querying directly for assets, as long as the assets have stream references defined.

An asset query looks identical to a stream query with the exception that query kind (set using the [DataItemResourceType enumeration](xref:DataViewsQuickStartDefine#dataitemresourcetype-enumeration)) is equal to Asset, and query value uses [asset search syntax](xref:assets-assets-search).

```json
"Queries": [
    {
        "Id": "inverter power measurements",
        "Kind": "Asset",
        "Value": "Metadata/Name:Inverter"
    }
]
```

Note that query kind defaults to Stream if not included in the query definition. A single query cannot contain both streams and assets. However, a single data view can contain both stream queries and asset queries.

```json
"Queries": [
    {
        "Id": "inverter power measurements",
        "Kind": "Asset",
        "Value": "Metadata/Name:Inverter"
    },
    {
      "Id": "weather stations",
      "Kind": "Stream",
      "Value": "tags:weather"
    }
]
```
