---
uid: DataViewsDataAPI
---

# Data API
The Data API allows users to [retrieve data](xref:DataViewsGettingData) for a specified data view.  This API is one portion of the [data views API](xref:DataViewsAPIOverview).

## `Get Data View Data`
Get data for the provided index parameters with paging. See [documentation on paging](xref:DataViewsGettingData#paging) for further information.

### Request
```text
GET /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{dataViewId}/data/interpolated?startIndex={startIndex}&endIndex={endIndex}&interval={interval}&form={form}&continuationToken={continuationToken}&cache={cache}&count={count}

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
The requested data [output format](xref:DataViewsGettingData#format). Output formats: `default`, `table`, `tableh`, `csv`, `csvh`.

`[optional] string continuationToken`  
Used only when [paging](xref:DataViewsGettingData#paging). Not specified when requesting the first page of data.

`[optional] string cache`  
Controls when the data view backing resources are to be refreshed. Used only when requesting the first page of data. Ignored if used with the continuationToken. Values are:

| Value | Description | 
|--|--|
| `Refresh` | Force the resource to re-resolve.  This is the default value for this API route.  
| `Preserve`| Use cached information, if available.   

`[optional] int count`  
The requested page size. The default value is 1000. The maximum is 250,000.

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK                    | data in the requested format  | Successfully retrieved data.  |
| 400 Bad Request           | error | The request could not be understood by the server due to malformed syntax.
| 403 Forbidden             | error | User is not authorized for this operation.
| 404 Not Found             | error | The specified data view identifier is not found.
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include one or more header values related to paging.

| Header | Description |
|--|--|
| FirstPage | Hyperlink to the first page of data |
| NextPage | Hyperlink to the next page of data, if the data spans into an additional page. Absence of this header indicates that there are no additional pages to be retrieved. |

#### Example response body in default format
An array of json values. Each json property corresponds to a field mapping. Property names are the field mapping `.Id`s.

```json
HTTP 200 OK
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
2018-01-01T00:00:00Z,24,44,245
2018-01-01T00:00:01Z,24,44,245
2018-01-01T00:00:02Z,24,44,245
```

#### Example response body with `form=csvh`

```csv
HTTP 200 OK
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