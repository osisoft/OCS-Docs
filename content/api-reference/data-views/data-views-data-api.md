---
uid: DataViewsDataAPI

---

# Data views data

The data API allows users to [retrieve data](xref:DataViewsQuickStartGetData) for a specified data view. This API is one portion of the [data views API](xref:DataViewsAPIOverview).

## `Get Data View Interpolated Data`

<a id="opIdDataViewsData_Get Data View Interpolated Data"></a>

Returns interpolated data for the provided index parameters with paging. See [documentation on paging](xref:DataViewsQuickStartGetData#paging) for further information.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/data/interpolated
?startIndex={startIndex}&endIndex={endIndex}&interval={interval}&form={form}&continuationToken={continuationToken}&count={count}&cache={cache}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string id`
<br/>Data view identifier.<br/><br/>`string startIndex`
<br/>The requested start index, inclusive. The default value is the ```.DefaultStartIndex``` of the data view. Optional if a default value is specified.
<br/><br/>`string endIndex`
<br/>The requested end index, inclusive. The default value is the ```.DefaultEndIndex``` of the data view. Optional if a default value is specified.
<br/><br/>`string interval`
<br/>The requested interval between index values. The default value is the ```.DefaultInterval``` of the data view. Optional if a default is specified.<br/><br/>`string form`
<br/>The requested data [output format](xref:DataViewsQuickStartGetData#format). Output formats: `default`, `table`, `tableh`, `csv`, `csvh`.
<br/><br/>`string continuationToken`
<br/>Used only when [paging](xref:DataViewsQuickStartGetData#paging). Not specified when requesting the first page of data.
<br/><br/>`integer count`
<br/>The requested page size. The maximum is 250,000. If the parameter is not provided, [an optimal page size will be calculated](xref:DataViewsQuickStartGetData#page-size).
<br/><br/>
`[optional] string cache`
<br/>Controls when the data view backing resources are to be refreshed. Used only when requesting the first page of data. Ignored if used with the continuationToken. Values are:

| Value | Description | 
|--|--|
| `Refresh` | Force the resource to re-resolve.  This is the default value for this API route.  
| `Preserve`| Use cached information, if available.
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|string|Successfully retrieved data.|
|400|[ErrorResponse](#schemaerrorresponse)|The request could not be understood by the server due to malformed syntax.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|404|[ErrorResponse](#schemaerrorresponse)|The specified data view identifier is not found.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Link|string|Hyperlinks to the first page and next page of data as applicable. Absence of the next link indicates that there is no additional data to be retrieved.|
|200|Next-Page|string|Hyperlink to the next page of results.|
|200|First-Page|string|Hyperlink to the first page of results.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "ERROR": "Parameter \"data-interpolated-get-multiple-formats\" could not be found in external reference file"
}
```

> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Data View Stored Data`

<a id="opIdDataViewsData_Get Data View Stored Data"></a>

Returns stored data for the provided index parameters with paging. See [documentation on paging](xref:DataViewsQuickStartGetData#paging) for further information.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/data/stored
?startIndex={startIndex}&endIndex={endIndex}&form={form}&continuationToken={continuationToken}&count={count}&cache={cache}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string id`
<br/>Data view identifier.<br/><br/>`string startIndex`
<br/>The requested start index, inclusive. The default value is the ```.DefaultStartIndex``` of the data view. Optional if a default value is specified.
<br/><br/>`string endIndex`
<br/>The requested end index, inclusive. The default value is the ```.DefaultEndIndex``` of the data view. Optional if a default value is specified.
<br/><br/>`string form`
<br/>The requested data [output format](xref:DataViewsQuickStartGetData#format). Output formats: `default`, `table`, `tableh`, `csv`, `csvh`.
<br/><br/>`string continuationToken`
<br/>Used only when [paging](xref:DataViewsQuickStartGetData#paging). Not specified when requesting the first page of data.
<br/><br/>`integer count`
<br/>The requested page size. The maximum is 250,000. If the parameter is not provided, [an optimal page size will be calculated](xref:DataViewsQuickStartGetData#page-size).
<br/><br/>
`[optional] string cache`
<br/>Controls when the data view backing resources are to be refreshed. Used only when requesting the first page of data. Ignored if used with the continuationToken. Values are:

| Value | Description | 
|--|--|
| `Refresh` | Force the resource to re-resolve.  This is the default value for this API route.  
| `Preserve`| Use cached information, if available.
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|string|Successfully retrieved data.|
|400|[ErrorResponse](#schemaerrorresponse)|The request could not be understood by the server due to malformed syntax.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|404|[ErrorResponse](#schemaerrorresponse)|The specified data view identifier is not found.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Link|string|Hyperlinks to the first page and next page of data as applicable. Absence of the next link indicates that there is no additional data to be retrieved.|
|200|Next-Page|string|Hyperlink to the next page of results.|
|200|First-Page|string|Hyperlink to the first page of results.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "ERROR": "Parameter \"data-stored-get-multiple-formats\" could not be found in external reference file"
}
```

> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---
## Definitions

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|
|Parameters|object|false|true|None|
|ChildErrors|object|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}

```

---

