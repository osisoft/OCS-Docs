---
uid: community-search

---

# Search
API that returns information about the streams that are shared with communities

## `Search Streams By Community`

<a id="opIdCommunitySearch_Search Streams By Community"></a>

Searches for streams within a community by query

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/search/communities/{communityId}/streams
?query={query}&skip={skip}&count={count}&pageSize={pageSize}&maxPages={maxPages}&continuationToken={continuationToken}&orderBy={orderBy}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Calling tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>
`[optional] string query`
<br/>Query to execute. The query uses the same format as SDS. See [Search in SDS](xref:sdsSearching).<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>The maximum number of results to return.<br/><br/>`[optional] integer pageSize`
<br/>The number of results to return per page. Supercedes 'count' if specified. Will also cause a Link response header to be created with links to subsequent result sets. Those result sets are first, last, next or previous.<br/><br/>`[optional] integer maxPages`
<br/>The maximum number of result records that can be returned. This is used in conjunction with pageSize.<br/><br/>`[optional] string continuationToken`
<br/>If specified, this call retrieves a set of results as specified within the token. The possible result sets are first, last, next or previous.<br/><br/>`[optional] string orderBy`
<br/>The search result order specification. If not specified, the results are ordered by ascending stream name. If a search result order is specified, it should consist of one stream result attribute name (attribute-name) with an optional sort order (sort-order). The sort-order, if specified, is separated from the attribute-name by a space. The supported stream result attribute names are Id, Name, TypeId, Description, Self, TenantId, NamespaceId, TenantName, and CommunityId. The sort order values are ASC, for ascending, which is the default, and DESC, for descending. Attribute names and sort order values are not case sensitive. Example: NamespaceID DESC<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[StreamSearchResult](#schemastreamsearchresult)|Returns the stream information that matches the search criteria. This is a set of objects of type `StreamSearchResult`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request due to invalid syntax.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 200 Response ([StreamSearchResult](#schemastreamsearchresult))

```json
{
  "Id": "string",
  "Name": "string",
  "TypeId": "string",
  "Description": "string",
  "Self": "string",
  "TenantId": "string",
  "TenantName": "string",
  "NamespaceId": "string",
  "CommunityId": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
<li>Tenant Member</li>
</ul>

---

## `List Streams By Namespace (GET Method)`

<a id="opIdCommunitySearch_List Streams By Namespace (GET Method)"></a>

Searches for shared streams within a namespace by query.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/shared/streams
?query={query}&skip={skip}&count={count}&orderBy={orderBy}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Calling tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string query`
<br/>Query to execute. The query uses the same format as SDS. See [Search in SDS](xref:sdsSearching).<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Maximum total results.<br/><br/>`[optional] string orderBy`
<br/>The search result order specification. If not specified, the results are ordered by ascending stream name. If a search result order is specified, it should consist of one stream result attribute name (attribute-name) with an optional sort order (sort-order). The sort-order, if specified, is separated from the attribute-name by a space. The supported stream result attribute names are Id, Name, TypeId, and Description. The sort order values are ASC, for ascending, which is the default, and DESC, for descending. Attribute names and sort order values are not case sensitive. Example: TypeID DESC<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[StreamFromSearchByNamespace](#schemastreamfromsearchbynamespace)[]|Returns the streams that matches the search criteria. This is a set of objects of type `StreamFromSearchByNamespace`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request due to invalid syntax.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 200 Response ([StreamFromSearchByNamespace](#schemastreamfromsearchbynamespace)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "TypeId": "string",
    "Description": "string"
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
<li>Tenant Member</li>
</ul>

---

## `Search Streams By Namespace (POST Method)`

<a id="opIdCommunitySearch_Search Streams By Namespace (POST Method)"></a>

Searches for shared streams within a namespace by query.

<h3>Request</h3>

```text 
POST /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/shared/streams
?query={query}&skip={skip}&count={count}&orderBy={orderBy}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Calling tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string query`
<br/>Query to execute. The query uses the same format as SDS. See [Search in SDS](xref:sdsSearching).<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Maximum total results.<br/><br/>`[optional] string orderBy`
<br/>The search result order specification. If not specified, the results are ordered by ascending stream name. If a search result order is specified, it should consist of one stream result attribute name (attribute-name) with an optional sort order (sort-order). The sort-order, if specified, is separated from the attribute-name by a space. The supported stream result attribute names are Id, Name, TypeId, and Description. The sort order values are ASC, for ascending, which is the default, and DESC, for descending. Attribute names and sort order values are not case sensitive. Example: TypeID DESC<br/><br/>

<h4>Request Body</h4>

Input used to search namespace.<br/>

```json
{
  "CommunityIds": [
    "string"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[StreamFromSearchByNamespace](#schemastreamfromsearchbynamespace)[]|Returns the streams that matches the search criteria. This is a set of objects of type `StreamFromSearchByNamespace`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request due to invalid syntax.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested namespace was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 200 Response ([StreamFromSearchByNamespace](#schemastreamfromsearchbynamespace)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "TypeId": "string",
    "Description": "string"
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
<li>Tenant Member</li>
</ul>

---
## Definitions

### StreamSearchResult

<a id="schemastreamsearchresult"></a>
<a id="schema_StreamSearchResult"></a>
<a id="tocSstreamsearchresult"></a>
<a id="tocsstreamsearchresult"></a>

The StreamSearchResult object. This is the model representation exposed to callers of controller endpoints.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|The Id|
|Name|string|false|true|The name|
|TypeId|string|false|true|The type Id|
|Description|string|false|true|The description|
|Self|string|false|true|The base URL for shared access self link to access community data. For more information, see [Shared Access Requests](xref:shared-access-routes).|
|TenantId|string|false|true|The Tenant Id of stream|
|TenantName|string|false|true|The Tenant name of stream|
|NamespaceId|string|false|true|The Namespace ID of stream|
|CommunityId|string|false|true|The Community Id|

```json
{
  "Id": "string",
  "Name": "string",
  "TypeId": "string",
  "Description": "string",
  "Self": "string",
  "TenantId": "string",
  "TenantName": "string",
  "NamespaceId": "string",
  "CommunityId": "string"
}

```

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|OperationId of the action that caused the error|
|Error|string|false|true|Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|Resolution for the Error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string"
}

```

---

### StreamFromSearchByNamespace

<a id="schemastreamfromsearchbynamespace"></a>
<a id="schema_StreamFromSearchByNamespace"></a>
<a id="tocSstreamfromsearchbynamespace"></a>
<a id="tocsstreamfromsearchbynamespace"></a>

The StreamFromSearchByNamespace object. This is the model representation exposed to called of controller endpoints.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|The Stream Id.|
|Name|string|false|true|The Stream Name.|
|TypeId|string|false|true|The Stream TypeId.|
|Description|string|false|true|The Stream Description.|

```json
{
  "Id": "string",
  "Name": "string",
  "TypeId": "string",
  "Description": "string"
}

```

---

### SearchStreamsByNamespaceInput

<a id="schemasearchstreamsbynamespaceinput"></a>
<a id="schema_SearchStreamsByNamespaceInput"></a>
<a id="tocSsearchstreamsbynamespaceinput"></a>
<a id="tocssearchstreamsbynamespaceinput"></a>

The SearchStreamsByNamespaceInput object.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|CommunityIds|string[]|false|true|List of CommunityIds to filter in for search.|

```json
{
  "CommunityIds": [
    "string"
  ]
}

```

---

