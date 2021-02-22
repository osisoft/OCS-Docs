---
uid: DataViewShape
---

# Data view shape

Data views may be set to resolve as a standard shape or a narrow shape. A data view shape is a portion of a data view definition that determines if the data should be returned in the standard grouped row format or a narrow view which is a pivot of the standard table.

With a standard shape, each row in the resolved data view includes all the data fields for a single event or observation. With a narrow shape, each row in the resolved data view includes only one data field. This results in a narrow output schema where one column contains all the data field values, so the schema remains fixed regardless of changes to the included data fields. Narrow shape may be used when an invariant output schema is required.

The shape concepts presented in this section apply to building all data view output formats; although the terminology used and examples shown, pertain to tabular output with [headers](xref:DataViewsQuickStartGetData#format) (form = csvh).
## Specify the shape
Set the [`DataViewShape`](xref:DataViewsQuickStartDefine#data-view-properties) property to a value of the [`DataViewShape` enumeration](xref:DataViewsQuickStartDefine#dataviewshape-enumeration), either `DataViewShape.Standard` (default) or `DataViewShape.Narrow`.

## Standard shape

The standard table column structure is built horizontally from left to right. The index field is first, followed by the grouping fields, if any exist.  Data field sets come next, in the order they are presented in the data view. Fields are presented in order of appearance within each data field set for each data item from the associated query.

Vertically, the standard structure depends on the inclusion of grouping fields. If grouping fields are not defined, each resultant index appears only once, and all interpolated data is in that row. If grouping fields are defined, then the resultant indexes will repeat vertically for each group. The groups are presented in alphabetical order.


##### Example: Get data response body for standard shape with no grouping field

Note, column labels contain a numerical suffix to ensure that each label is unique. Use grouping fields or an identifying field to create unique column labels.

```csv
Timestamp.0,Id.1,SolarRadiation.2,Temperature.3,Tags.4,Id.5,SolarRadiation.6,Temperature.7,Tags.8,Id.9,SolarRadiation.10,Temperature.11,Tags.12,Id.13,SolarRadiation.14,Temperature.15,Tags.16
2018-11-13T18:19:00.0000000Z,WS_BILT,229,28.042327888795327,"Gen1, High Resolution, Weather",WS_HRST,254,4.219790459247207,"Gen1, Low Resolution, Weather",WS_ROSE,31,31.23228568408279,"Gen1, Low Resolution, Weather",WS_WINT,184,,"Gen2, High Resolution, Weather"
2018-11-13T18:20:00.0000000Z,WS_BILT,229,28.042327888795327,"Gen1, High Resolution, Weather",WS_HRST,254,4.219790459247207,"Gen1, Low Resolution, Weather",WS_ROSE,31,31.23228568408279,"Gen1, Low Resolution, Weather",WS_WINT,184,,"Gen2, High Resolution, Weather"
```
<br />

##### Example: Get data response body for standard shape with grouping field (Site)

The use of a grouping field will restructure the table vertically. See [Grouping documentation](xref:DataViewsGrouping) for details.

```csv
Timestamp,Site,Id,SolarRadiation,Temperature,Tags
2018-11-13T18:19:00.0000000Z,Biltmore,WS_BILT,229,28.042327888795327,"Gen1, High Resolution, Weather"
2018-11-13T18:20:00.0000000Z,Biltmore,WS_BILT,229,28.042327888795327,"Gen1, High Resolution, Weather"
2018-11-13T18:21:00.0000000Z,Biltmore,WS_BILT,229,28.042327888795327,"Gen1, High Resolution, Weather"
2018-11-13T18:22:00.0000000Z,Biltmore,WS_BILT,229,28.042327888795327,"Gen1, High Resolution, Weather"
2018-11-13T18:19:00.0000000Z,Hearst Castle,WS_HRST,254,4.219790459247207,"Gen1, Low Resolution, Weather"
2018-11-13T18:20:00.0000000Z,Hearst Castle,WS_HRST,254,4.219790459247207,"Gen1, Low Resolution, Weather"
2018-11-13T18:21:00.0000000Z,Hearst Castle,WS_HRST,254,4.219790459247207,"Gen1, Low Resolution, Weather"
2018-11-13T18:22:00.0000000Z,Hearst Castle,WS_HRST,254,4.219790459247207,"Gen1, Low Resolution, Weather"
2018-11-13T18:19:00.0000000Z,Rosecliff,WS_ROSE,31,31.23228568408279,"Gen1, Low Resolution, Weather"
2018-11-13T18:20:00.0000000Z,Rosecliff,WS_ROSE,31,31.23228568408279,"Gen1, Low Resolution, Weather"
2018-11-13T18:21:00.0000000Z,Rosecliff,WS_ROSE,31,31.23228568408279,"Gen1, Low Resolution, Weather"
2018-11-13T18:22:00.0000000Z,Rosecliff,WS_ROSE,31,31.23228568408279,"Gen1, Low Resolution, Weather"
2018-11-13T18:19:00.0000000Z,Winterthur,WS_WINT,184,,"Gen2, High Resolution, Weather"
2018-11-13T18:20:00.0000000Z,Winterthur,WS_WINT,184,,"Gen2, High Resolution, Weather"
2018-11-13T18:21:00.0000000Z,Winterthur,WS_WINT,184,,"Gen2, High Resolution, Weather"
2018-11-13T18:22:00.0000000Z,Winterthur,WS_WINT,184,,"Gen2, High Resolution, Weather"
```
<br />

## Narrow shape

The narrow table pivots the standard table. Each data field becomes a row comprised of the following columns: 

* Index column 
* Grouping value column(s)
* Field column, which holds the resolved column label of the field
* Value column, which holds the field value such as the property or metadata value

The column label of the index and grouping value columns may vary depending on the resolved label. The Field and Value column labels are not modifiable.

The data view is built vertically by grouping field, if present, then by field. 

Data views resolving into multiple data items with the same property ids or names, should use a grouping field or an identifier in order to differentiate the data rows. 

##### Example: Get data response body for narrow shape with grouping field (Site)


```csv
Timestamp,Site,Field,Value
2018-11-13T18:19:00.0000000Z,Biltmore,Id,WS_BILT
2018-11-13T18:20:00.0000000Z,Biltmore,Id,WS_BILT
2018-11-13T18:19:00.0000000Z,Biltmore,SolarRadiation,229
2018-11-13T18:20:00.0000000Z,Biltmore,SolarRadiation,229
2018-11-13T18:19:00.0000000Z,Biltmore,Temperature,28.042327888795327
2018-11-13T18:20:00.0000000Z,Biltmore,Temperature,28.042327888795327
2018-11-13T18:19:00.0000000Z,Biltmore,Tags,"Gen1, High Resolution, Weather"
2018-11-13T18:20:00.0000000Z,Biltmore,Tags,"Gen1, High Resolution, Weather"
2018-11-13T18:19:00.0000000Z,Hearst Castle,Id,WS_HRST
2018-11-13T18:20:00.0000000Z,Hearst Castle,Id,WS_HRST
2018-11-13T18:19:00.0000000Z,Hearst Castle,SolarRadiation,254
2018-11-13T18:20:00.0000000Z,Hearst Castle,SolarRadiation,254
2018-11-13T18:19:00.0000000Z,Hearst Castle,Temperature,4.219790459247207
2018-11-13T18:20:00.0000000Z,Hearst Castle,Temperature,4.219790459247207
2018-11-13T18:19:00.0000000Z,Hearst Castle,Tags,"Gen1, Low Resolution, Weather"
2018-11-13T18:20:00.0000000Z,Hearst Castle,Tags,"Gen1, Low Resolution, Weather"
```
