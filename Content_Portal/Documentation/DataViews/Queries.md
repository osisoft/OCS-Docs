---
uid: DataViewsQueries
---

# Queries

Queries determine what data items are included in a data view.

## Query

Each `Query` must be uniquely identified with an `.Id`. The identifier should be meaningful. The query's results will be referenced by this identifier when you include fields in the data view.

The query text is the same [stream query syntax](xref:sdsSearching) used by the Sequential Data Store.

|Property| Type | Optionality  | Default  | Details |
|--|--|--|--|--|
| Id  | string | Required |  | Unique identifier. Used by `FieldSet` to link to the query's results. |
| Value | string | Optional | null | A query for streams, in SDS query syntax. A null or empty query will not match any streams. 

## Using queries

### Querying streams of differing nature
To include streams of completely different nature (like power inverters and weather stations), use one query for each. 

For example:
```json
"Queries": [
  {
    "Id": "inverter power measurements",
    "Value": "inverter:* AND measurement:power*"
  },
  {
    "Id": "weather stations",
    "Value": "tags:weather"
  },
]
```
Using separate queries means the streams will be available in separate field sets. This is good, because a power inverter has completely different fields versus a weather station.

### Querying streams of a common nature
Streams that originate from an OSIsoft PI System represent only one fundamental measurement (e.g. Power In), unlike the more general case where a stream may represent several measurements (e.g. Temperature, Solar Radiation, and Cloud Cover). This means that multiple streams refer to the same physical or logical asset.

In the example scenario, each power inverter is associated with two streams. It makes sense to structure our query around the physical asset, returning all "power*" measurements of all inverters:
```json
"Queries": [
  {
    "Id": "inverter power measurements",
    "Value": "inverter:* AND measurement:power*"
  }
]
```

These streams will be available in one single field set. This is good, because our data view can operate in terms of physical assets, and not be bound by how the stream data was recorded.
