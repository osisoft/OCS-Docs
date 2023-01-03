---
uid: assets-assets-search

---

# Assets Search

## `Get Assets In Search Result Format`

<a id="opIdRequestManager_Get Assets In Search Result Format"></a>

Searches all assets and returns a list of asset Ids and their matched fields. Use this API to identify the fields in the asset that match your query string.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Search/Assets
?skip={skip}&count={count}&orderBy={orderBy}&query={query}&filter={filter}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>`[optional] string orderBy`
<br/>Optional parameter which returns assets ordered either by the asset `Id` or the asset `Name`. Specify `asc` or `desc` to return the results in ascending or descending order. If not specified, the default is ascending order.<br/><br/>`[optional] string query`
<br/>Query identifier.<br/><br/>`[optional] string filter`
<br/>String used to filter the asset search results. Filter strings are not case sensitive. The strings on which you can filter results are limited to the asset `AssetTypeName` property and the asset metadata properties (using the syntax filter[*property_name*]=*property_value*).<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SearchResultsOfSearchResult](#schemasearchresultsofsearchresult)|OK.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Count": 1,
  "Results": [
    {
      "MatchedProperties": [
        {
          "Field": "Name",
          "Value": "Asset Mine Truck 353e3cfe-f20b-4bef-b9c4-f75fbbdc0818"
        }
      ],
      "Id": "AssetId2b5f41ae-0929-4977-bfbd-1e046d8a66f4",
      "TypeId": "AssetMineTruckType",
      "Name": "Asset Mine Truck 353e3cfe-f20b-4bef-b9c4-f75fbbdc0818",
      "Description": "First mine truck used the mine diamond hands",
      "ETag": "1",
      "CreatedDate": "2021-05-26T19:05:33.8979442Z",
      "LastModifiedDate": "2021-05-26T19:05:33.8979442Z"
    }
  ]
}
```

> 400 Response ([ErrorTemplate](#schemaerrortemplate))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}
```

---

## `List Faceted List Results`

<a id="opIdRequestManager_List Faceted List Results"></a>

Searches for assets using facets. Asset facets are not case-sensitive. Only asset metadata can be used in faceted searches.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Search/Assets/Facets
?count={count}&name={name}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>`[optional] string name`
<br/>Name of the asset metadata for which you want to retrieve the facet values.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[FacetResult](#schemafacetresult)[]|OK.|
|204|None|No assets match your query.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "Name": "Location",
    "FacetValues": [
      {
        "Value": "California",
        "DocumentCount": 2
      },
      {
        "Value": "Philly",
        "DocumentCount": 1
      }
    ]
  }
]
```

> 400 Response ([ErrorTemplate](#schemaerrortemplate))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}
```

---

## `Get Autocomplete Results`

<a id="opIdRequestManager_Get Autocomplete Results"></a>

Returns a list of suggested assets based on your search criteria. The autocomplete feature can be used with the following asset properties: Name, Description, AssetTypeName, and Metadata.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Search/Assets/Autocomplete
?term={term}&termCount={termCount}&facetCount={facetCount}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string term`
<br/>Search term that you want to search for<br/><br/>`integer termCount`
<br/>Maximum number of facet autocompleted items to return. Default is 0.<br/><br/>`integer facetCount`
<br/>Maximum number of token autocompleted items to return. Default is 0.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SuggestionResults](#schemasuggestionresults)|Returns the suggestions|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Facets": [
    {
      "Value": "trackUnit1",
      "FacetCategories": [
        {
          "Name": "track",
          "DocumentCount": 1
        }
      ]
    },
    {
      "Value": "t1000",
      "FacetCategories": [
        {
          "Name": "tractorNumber",
          "DocumentCount": 1
        }
      ]
    }
  ],
  "Tokens": [
    {
      "Value": "tracerround",
      "DocumentCount": 2
    },
    {
      "Value": "t1000",
      "DocumentCount": 1
    }
  ]
}
```

> 400 Response ([ErrorTemplate](#schemaerrortemplate))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}
```

---
## Definitions

### SearchResultsOfSearchResult

<a id="schemasearchresultsofsearchresult"></a>
<a id="schema_SearchResultsOfSearchResult"></a>
<a id="tocSsearchresultsofsearchresult"></a>
<a id="tocssearchresultsofsearchresult"></a>

The set of search results matching search query.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TotalCount|int32|false|false|The total number of items in the assets database that matches the search query. This may be more than the number of Results returned.|
|Results|[[SearchResult](#schemasearchresult)]|false|true|The search results that corresponds to the current page.|
|ContinuationTokens|string[]|false|true|The list of continuation tokens. Each continuation token corresponds to a page of results.|

```json
{
  "Count": 1,
  "Results": [
    {
      "MatchedProperties": [
        {
          "Field": "Name",
          "Value": "Asset Mine Truck 353e3cfe-f20b-4bef-b9c4-f75fbbdc0818"
        }
      ],
      "Id": "AssetId2b5f41ae-0929-4977-bfbd-1e046d8a66f4",
      "TypeId": "AssetMineTruckType",
      "Name": "Asset Mine Truck 353e3cfe-f20b-4bef-b9c4-f75fbbdc0818",
      "Description": "First mine truck used the mine diamond hands",
      "ETag": "1",
      "CreatedDate": "2021-05-26T19:05:33.8979442Z",
      "LastModifiedDate": "2021-05-26T19:05:33.8979442Z"
    }
  ]
}

```

---

### SearchResult

<a id="schemasearchresult"></a>
<a id="schema_SearchResult"></a>
<a id="tocSsearchresult"></a>
<a id="tocssearchresult"></a>

Search results

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|MatchedFields|[[MatchedField](#schemamatchedfield)]|false|true|A list of matched field objects. Each MatchedFields object contains the matched fields and their values.|
|Score|double|false|false|Calculated score of the match. For internal use.|
|Id|string|false|true|Identifier of the matched asset.|
|TypeId|string|false|true|Asset type identifier of the matched asset. If the asset does not have an asset type, then this field will be null.|
|Name|string|false|true|Name of the matched asset.|
|Description|string|false|true|Description of the matched asset. If the description of the matched asset is null, the description from the asset type is returned.|
|LastStatus|[StatusData](#schemastatusdata)|false|true|Last status of the matched asset. If a status is not defined for the asset, this field will be null. If a status is defined, this field will correspond to Unknown, Good, Warning, or Bad.|
|ETag|string|false|true|Etag of the matched asset.|
|CreatedDate|date-time|false|false|Created date of the matched asset.|
|LastModifiedDate|date-time|false|false|Modified date of the matched asset.|

```json
{
  "TotalCount": 2,
  "Results": [
    {
      "MatchedFields": [
        {
          "Field": "Description",
          "Terms": [
            "searchedDescription"
          ]
        },
        {
          "Field": "Name",
          "Terms": [
            "searchedName"
          ]
        }
      ],
      "Score": 0.07410964510231982,
      "Id": "AssetsSearchDemo1",
      "Name": "SearchedName 1",
      "Description": "SearchedDescription 1",
      "ETag": "1",
      "CreatedDate": "2021-06-28T05:57:13.4249707Z",
      "LastModifiedDate": "2021-06-28T05:57:13.4249707Z"
    },
    {
      "MatchedFields": [
        {
          "Field": "Description",
          "Terms": [
            "searchedDescription"
          ]
        },
        {
          "Field": "Name",
          "Terms": [
            "searchedName"
          ]
        }
      ],
      "Score": 0.062210717451675585,
      "Id": "AssetsSearchDemo2",
      "Name": "SearchResultName 2",
      "Description": "SearchResultDescription 2",
      "ETag": "6",
      "CreatedDate": "2021-06-28T05:57:13.5965826Z",
      "LastModifiedDate": "2021-06-28T05:57:13.5965826Z"
    }
  ]
}

```

---

### MatchedField

<a id="schemamatchedfield"></a>
<a id="schema_MatchedField"></a>
<a id="tocSmatchedfield"></a>
<a id="tocsmatchedfield"></a>

Matched fields. Includes the matched property and matched terms.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Field|string|false|true|Matching property|
|Terms|string[]|false|true|Matching terms|

```json
"\"MatchedFields\": [\n{\n    \"Field\": \"Description\",\n    \"Terms\": [\n        \"searchedDescription\"\n    ]\n    },{\n    \"Field\": \"Name\",\n    \"Terms\": [\n        \"searchedName\"\n    ]\n}]"

```

---

### StatusData

<a id="schemastatusdata"></a>
<a id="schema_StatusData"></a>
<a id="tocSstatusdata"></a>
<a id="tocsstatusdata"></a>

Status data that is assocated with asset.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Index|any|false|true|Index which the status was last updated|
|Status|[StatusEnum](#schemastatusenum)|false|false|Status enumeration. Valid values are: Unknown, Good, Warning and Bad.|
|Value|any|false|true|Value of the last data retrieved|
|DisplayName|string|false|true|Status display name|

```json
{
  "Index": "2019-01-02T00:00:00Z",
  "Status": "Warning",
  "Value": 2,
  "DisplayName": "AssetInWarning"
}

```

---

### StatusEnum

<a id="schemastatusenum"></a>
<a id="schema_StatusEnum"></a>
<a id="tocSstatusenum"></a>
<a id="tocsstatusenum"></a>

Pre-defined asset status values.

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Unknown|0|
|Good|1|
|Warning|2|
|Bad|3|

---

### ErrorTemplate

<a id="schemaerrortemplate"></a>
<a id="schema_ErrorTemplate"></a>
<a id="tocSerrortemplate"></a>
<a id="tocserrortemplate"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation identifier|
|Error|string|false|true|Error string|
|Resolution|string|false|true|Resolution string|
|Reason|string|false|true|Error reason string|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "property1": null,
  "property2": null
}

```

---

### FacetResult

<a id="schemafacetresult"></a>
<a id="schema_FacetResult"></a>
<a id="tocSfacetresult"></a>
<a id="tocsfacetresult"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|None|
|FacetValues|[[FacetValue](#schemafacetvalue)]|false|true|None|

```json
{
  "Name": "string",
  "FacetValues": [
    {
      "Value": "string",
      "DocumentCount": 0
    }
  ]
}

```

---

### FacetValue

<a id="schemafacetvalue"></a>
<a id="schema_FacetValue"></a>
<a id="tocSfacetvalue"></a>
<a id="tocsfacetvalue"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|string|false|true|None|
|DocumentCount|int32|false|false|None|

```json
{
  "Value": "string",
  "DocumentCount": 0
}

```

---

### SuggestionResults

<a id="schemasuggestionresults"></a>
<a id="schema_SuggestionResults"></a>
<a id="tocSsuggestionresults"></a>
<a id="tocssuggestionresults"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Facets|[[FacetSuggestion](#schemafacetsuggestion)]|false|true|None|
|Tokens|[[TokenSuggestion](#schematokensuggestion)]|false|true|None|

```json
{
  "Facets": [
    {
      "Value": "string",
      "FacetCategories": [
        {
          "Name": "string",
          "DocumentCount": 0
        }
      ]
    }
  ],
  "Tokens": [
    {
      "Value": "string",
      "DocumentCount": 0
    }
  ]
}

```

---

### FacetSuggestion

<a id="schemafacetsuggestion"></a>
<a id="schema_FacetSuggestion"></a>
<a id="tocSfacetsuggestion"></a>
<a id="tocsfacetsuggestion"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|string|false|true|None|
|FacetCategories|[[FacetCategory](#schemafacetcategory)]|false|true|None|

```json
{
  "Value": "string",
  "FacetCategories": [
    {
      "Name": "string",
      "DocumentCount": 0
    }
  ]
}

```

---

### FacetCategory

<a id="schemafacetcategory"></a>
<a id="schema_FacetCategory"></a>
<a id="tocSfacetcategory"></a>
<a id="tocsfacetcategory"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|None|
|DocumentCount|int32|false|false|None|

```json
{
  "Name": "string",
  "DocumentCount": 0
}

```

---

### TokenSuggestion

<a id="schematokensuggestion"></a>
<a id="schema_TokenSuggestion"></a>
<a id="tocStokensuggestion"></a>
<a id="tocstokensuggestion"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|string|false|true|None|
|DocumentCount|int32|false|false|None|

```json
{
  "Value": "string",
  "DocumentCount": 0
}

```

---

