---
uid: DataViewShape
---

# Data view shape

[!include[choose-data-shape](../../../analytics/data-views/_includes/choose-data-shape.md)]

[!include[data-shape-intro](../../../analytics/data-views/_includes/data-shape-intro.md)]

The shape concepts presented in this section apply to building all data view output formats; although the terminology used and examples shown, pertain to tabular output with [headers](xref:DataViewsQuickStartGetData#format) (form = csvh).

## Specify the shape

Set the [`DataViewShape`](xref:DataViewsQuickStartDefine#data-view-properties) property to a value of the [`DataViewShape` enumeration](xref:DataViewsQuickStartDefine#dataviewshape-enumeration), either `DataViewShape.Standard` (default) or `DataViewShape.Narrow`.

## Standard shape

[!include[standard-shape](../../..//analytics/data-views/_includes/standard-shape.md)]

### Example: Get data response body for standard shape with no grouping field

**Note:** Column labels contain a numerical suffix to ensure that each label is unique. Use grouping fields or an identifying field to create unique column labels.

```csv
Timestamp.0,Id.1,SolarRadiation.2,Temperature.3,Tags.4,Id.5,SolarRadiation.6,Temperature.7,Tags.8,Id.9,SolarRadiation.10,Temperature.11,Tags.12,Id.13,SolarRadiation.14,Temperature.15,Tags.16
2018-11-13T18:19:00.0000000Z,WS_BILT,229,28.042327888795327,"Gen1, High Resolution, Weather",WS_HRST,254,4.219790459247207,"Gen1, Low Resolution, Weather",WS_ROSE,31,31.23228568408279,"Gen1, Low Resolution, Weather",WS_WINT,184,,"Gen2, High Resolution, Weather"
2018-11-13T18:20:00.0000000Z,WS_BILT,229,28.042327888795327,"Gen1, High Resolution, Weather",WS_HRST,254,4.219790459247207,"Gen1, Low Resolution, Weather",WS_ROSE,31,31.23228568408279,"Gen1, Low Resolution, Weather",WS_WINT,184,,"Gen2, High Resolution, Weather"
```

### Example: Get data response body for standard shape with grouping field (site)

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

## Narrow shape

![include[narrow-shape](../../../analytics/data-views/_includes/narrow-shape.md)]

### Example: Get data response body for narrow shape with grouping field (site)

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
