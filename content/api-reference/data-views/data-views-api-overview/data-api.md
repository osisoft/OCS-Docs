---
uid: DataViewsDataAPI
---

# Data API
The Data API allows users to [retrieve data](xref:DataViewsQuickStartGetData) for a specified data view.  This API is one portion of the [data views API](xref:DataViewsAPIOverview).

## `Get Data View Interpolated Data`
Returns interpolated data for the provided index parameters with paging. See [documentation on paging](xref:DataViewsQuickStartGetData#paging) for further information.

### Request
```text
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{dataViewId}/data/interpolated?startIndex={startIndex}&endIndex={endIndex}&interval={interval}&form={form}&continuationToken={continuationToken}&cache={cache}&count={count}

```
### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

`[optional] string startIndex`  
The requested start index, inclusive. The default value is the `.DefaultStartIndex` of the data view. Optional if a default value is specified.

`[optional] string endIndex`  
The requested end index, inclusive. The default value is the `.DefaultEndIndex` of the data view. Optional if a default value is specified.

`[optional] string interval`  
The requested interval between index values. The default value is the `.DefaultInterval` of the data view. Optional if a default is specified.

`[optional] string form`  
The requested data [output format](xref:DataViewsQuickStartGetData#format). Output formats: `default`, `table`, `tableh`, `csv`, `csvh`.

`[optional] string continuationToken`  
Used only when [paging](xref:DataViewsQuickStartGetData#paging). Not specified when requesting the first page of data.

`[optional] string cache`  
Controls when the data view backing resources are to be refreshed. Used only when requesting the first page of data. Ignored if used with the continuationToken. Values are:

| Value | Description | 
|--|--|
| `Refresh` | Force the resource to re-resolve.  This is the default value for this API route.  
| `Preserve`| Use cached information, if available.   

`[optional] int count`  
The requested page size. The maximum is 250,000. If the parameter is not provided, [an optimal page size will be calculated](xref:DataViewsQuickStartGetData#page-size).

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK                    | data in the requested format  | Successfully retrieved data  |
| 400 Bad request           | error | The request could not be understood by the server due to malformed syntax
| 403 Forbidden             | error | User is not authorized for this operation
| 404 Not found             | error | The specified data view identifier is not found
| 500 Internal server error | error | An error occurred while processing the request: see the response body for details |

#### Response headers
Successful (200 OK) responses include:

| Header | Description |
|--|--|
| Link | Hyperlinks to the first page and next page of data as applicable. Absence of the next link indicates that there is no additional data to be retrieved. |
| Next-Page | Hyperlink to the next page of data |
| First-Page | Hyperlink to the first page of data |

#### Example response body in default format
An array of json values: each json property corresponds to a field mapping. Property names are the field mapping `.Id`s.

```json
HTTP 200 OK
Content-Type: application/json
[
    {
        "Time": "2018-01-01T00:00:00Z",
        "Temperature": 24,
        "Flowrate": 44,
        "Volume": 245
    },
    {
        "Time": "2018-01-01T00:00:01Z",
        "Temperature": 24,
        "Flowrate": 44,
        "Volume": 245
    },
    {
        "Time": "2018-01-01T00:00:02Z",
        "Temperature": 24,
        "Flowrate": 44,
        "Volume": 245
    }
]
```

#### Example response body with `form=table`

```json
HTTP 200 OK
Content-Type: application/json
{
   "Columns": [
      {
          "Name": "Time",
          "Type": "DateTime"
      },
      {
          "Name": "Temperature",
          "Type": "Int32"
      },
      {
          "Name": "Flowrate",
          "Type": "Int32"
      },
      {
          "Name": "Volume",
          "Type": "Int32"
      }
  ],
  "Rows": [
    [
      "2018-01-01T00:00:00Z",
      24,
      44,
      245
    ],
    [
      "2018-01-01T00:00:01Z",
      24,
      44,
      245
    ],
    [
      "2018-01-01T00:00:02Z",
      24,
      44,
      245
    ]
  ]
}
```

#### Example response body with `form=tableh`

```json
HTTP 200 OK
Content-Type: application/json
{
  "Columns": [
      {
          "Name": "Time",
          "Type": "DateTime"
      },
      {
          "Name": "Temperature",
          "Type": "Int32"
      },
      {
          "Name": "Flowrate",
          "Type": "Int32"
      },
      {
          "Name": "Volume",
          "Type": "Int32"
      }
  ],
  "Rows": [
      [
          "Time",
          "Temperature",
          "Flowrate",
          "Volume"
      ],
      [
          "2018-01-01T00:00:00Z",
          24,
          44,
          245
      ],
      [
          "2018-01-01T00:00:01Z",
          24,
          44,
          245
      ],
      [
          "2018-01-01T00:00:02Z",
          24,
          44,
          245
      ]
   ]
}
```

#### Example response body with `form=csv`

```csv
HTTP 200 OK
Content-Type: text/csv
2018-01-01T00:00:00Z,24,44,245
2018-01-01T00:00:01Z,24,44,245
2018-01-01T00:00:02Z,24,44,245
```

#### Example response body with `form=csvh`

```csv
HTTP 200 OK
Content-Type: text/csv
Time,Temperature,Flowrate,Volume
2018-01-01T00:00:00Z,24,44,245
2018-01-01T00:00:01Z,24,44,245
2018-01-01T00:00:02Z,24,44,245
```

### .NET client libraries method
```csharp
   IAsyncEnumerable<string> GetDataInterpolatedAsync(
            string id,
            OutputFormat format = OutputFormat.Default,
            object startIndex = null,
            object endIndex = null,
            object interval = null,
            int? backingPageSize = null,
            CacheBehavior cache = CacheBehavior.Refresh,
            CancellationToken cancellationToken = default);
```

## `Get Data View Stored Data`
Returns stored data for the provided index parameters with paging. See [documentation on paging](xref:DataViewsQuickStartGetData#paging) for further information.

### Request
```text
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{dataViewId}/data/stored?startIndex={startIndex}&endIndex={endIndex}&form={form}&continuationToken={continuationToken}&cache={cache}&count={count}

```
### Parameters
`string tenantId`
The tenant identifier

`string namespaceId`
The namespace identifier

`string dataViewId`
The data view identifier

`[optional] string startIndex`
The requested start index, inclusive. The default value is the `.DefaultStartIndex` of the data view. Optional if a default value is specified.

`[optional] string endIndex`
The requested end index, inclusive. The default value is the `.DefaultEndIndex` of the data view. Optional if a default value is specified.

`[optional] string form`
The requested data [output format](xref:DataViewsQuickStartGetData#format). Output formats: `default`, `table`, `tableh`, `csv`, `csvh`.

`[optional] string continuationToken`
Used only when [paging](xref:DataViewsQuickStartGetData#paging). Not specified when requesting the first page of data.

`[optional] string cache`
Controls when the data view backing resources are to be refreshed. Used only when requesting the first page of data. Ignored if used with the continuationToken. Values are:

| Value | Description |
|--|--|
| `Refresh` | Force the resource to re-resolve.  This is the default value for this API route.
| `Preserve`| Use cached information, if available.

`[optional] int count`
The requested page size. The maximum is 250,000. If the parameter is not provided, [an optimal page size will be calculated](xref:DataViewsQuickStartGetData#page-size).

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK                    | data in the requested format  | Successfully retrieved data  |
| 400 Bad request           | error | The request could not be understood by the server due to malformed syntax
| 403 Forbidden             | error | User is not authorized for this operation
| 404 Not found             | error | The specified data view identifier is not found
| 500 Internal server error | error | An error occurred while processing the request: see the response body for details |

#### Response headers
Successful (200 OK) responses include:

| Header | Description |
|--|--|
| Link | Hyperlinks to the first page and next page of data as applicable. Absence of the next link indicates that there is no additional data to be retrieved. |
| Next-Page | Hyperlink to the next page of data |
| First-Page | Hyperlink to the first page of data |

#### Example response body in default format
An array of json values: each json property corresponds to a field mapping. Property names are the field mapping `.Id`s.

```json
HTTP 200 OK
Content-Type: application/json
[
    {
        "Time": "2018-01-01T00:00:03Z",
        "Temperature": 24,
        "Flowrate": null,
        "Volume": 245
    },
    {
        "Time": "2018-01-01T00:00:14Z",
        "Temperature": 24,
        "Flowrate": 44,
        "Volume": null
    },
    {
        "Time": "2018-01-01T00:00:32Z",
        "Temperature": null,
        "Flowrate": null,
        "Volume": 245
    }
]
```

#### Example response body with `form=table`

```json
HTTP 200 OK
Content-Type: application/json
{
   "Columns": [
      {
          "Name": "Time",
          "Type": "DateTime"
      },
      {
          "Name": "Temperature",
          "Type": "Int32"
      },
      {
          "Name": "Flowrate",
          "Type": "Int32"
      },
      {
          "Name": "Volume",
          "Type": "Int32"
      }
  ],
  "Rows": [
    [
      "2018-01-01T00:00:03Z",
      24,
      null,
      245
    ],
    [
      "2018-01-01T00:00:14Z",
      24,
      44,
      null
    ],
    [
      "2018-01-01T00:00:32Z",
      null,
      null,
      245
    ]
  ]
}
```

#### Example response body with `form=tableh`

```json
HTTP 200 OK
Content-Type: application/json
{
  "Columns": [
      {
          "Name": "Time",
          "Type": "DateTime"
      },
      {
          "Name": "Temperature",
          "Type": "Int32"
      },
      {
          "Name": "Flowrate",
          "Type": "Int32"
      },
      {
          "Name": "Volume",
          "Type": "Int32"
      }
  ],
  "Rows": [
      [
          "Time",
          "Temperature",
          "Flowrate",
          "Volume"
      ],
      [
          "2018-01-01T00:00:03Z",
          24,
          null,
          245
      ],
      [
          "2018-01-01T00:00:14Z",
          24,
          44,
          null
      ],
      [
          "2018-01-01T00:00:32Z",
          null,
          null,
          245
      ]
   ]
}
```

#### Example response body with `form=csv`

```csv
HTTP 200 OK
Content-Type: text/csv
2018-01-01T00:00:03Z,24,,245
2018-01-01T00:00:14Z,24,44,
2018-01-01T00:00:32Z,,,245
```

#### Example response body with `form=csvh`

```csv
HTTP 200 OK
Content-Type: text/csv
Time,Temperature,Flowrate,Volume
2018-01-01T00:00:03Z,24,,245
2018-01-01T00:00:14Z,24,44,
2018-01-01T00:00:32Z,,,245
```

### .NET client libraries method
```csharp
   IAsyncEnumerable<string> GetDataStoredAsync(
            string id,
            OutputFormat format = OutputFormat.Default,
            object startIndex = null,
            object endIndex = null,
            int? backingPageSize = null,
            CacheBehavior cache = CacheBehavior.Refresh,
            CancellationToken cancellationToken = default);
```