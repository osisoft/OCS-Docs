---
uid: assets-assets

---

# Assets

## `Get Asset Owner`

<a id="opIdAssets_Get Asset Owner"></a>

Returns the owner of specified asset.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|OK.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Type": 1,
  "TenantId": "55555555-5555-5555-5555-555555555555",
  "ObjectId": "44444444-4444-4444-4444-444444444444"
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

## `Update Asset Owner`

<a id="opIdAssets_Update Asset Owner"></a>

Updates the owner of specified asset.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h4>Request Body</h4>

Updated owner.<br/>

```json
{
  "Type": 1,
  "TenantId": "55555555-5555-5555-5555-555555555555",
  "ObjectId": "44444444-4444-4444-4444-444444444444"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Asset owner updated.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

---

## `Get Asset Acl`

<a id="opIdAssets_Get Asset Acl"></a>

Returns the access control list of the specified asset.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/AccessControl
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Access control list of the asset with given identifier.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessRights": 3
    },
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "22222222-2222-2222-1111-111111111111"
      }
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

## `Update Asset Access Control`

<a id="opIdAssets_Update Asset Access Control"></a>

Updates the access control of specified asset.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/AccessControl
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h4>Request Body</h4>

Updated ACL.<br/>

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessRights": 3
    },
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "22222222-2222-2222-1111-111111111111"
      }
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Update success.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

---

## `List Asset Access Rights`

<a id="opIdAssets_List Asset Access Rights"></a>

Returns the access rights of specified asset.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/AccessRights
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Access control list of the asset with given identifier.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response

```json
[
  "Read",
  "Write",
  "Delete",
  "ManageAccessControl"
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

## `Get Asset`

<a id="opIdAssets_Get Asset"></a>

Returns specified asset and the version ETag in the HTTP response header.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Asset](#schemaasset)|Assets with specified identifier.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|ETag|string|Version.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
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

## `Get Or Create Asset`

<a id="opIdAssets_Get Or Create Asset"></a>

Creates a new asset. If the asset you are trying to create references an asset type (through the AssetTypeId property) and if the corresponding asset type has a metadata value with the same identifier, then the name and SDS type code of the metadata value on the asset must be null. If the asset type does not have metadata value with a corresponding Id, the name and SDS type code on the asset cannot be null. To support flexibility on creation and update, the following rules and behaviors are executed for metadata and stream references on a given asset when that asset is created from an asset type.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h4>Request Body</h4>

Asset to create.<br/>

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Asset](#schemaasset)|OK.|
|201|[Asset](#schemaasset)|Asset created.|
|302|None|Asset you attempted to create is identical to one that already exists.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|409|[ErrorTemplate](#schemaerrortemplate)|Asset you attempted to create has a conflict. See the response body for additional details.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|ETag|string|Version.|
|201|ETag|string|Version.|
|302|Location|string|Location to get the identical resource.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
  ]
}
```

> 201 Response

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
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

## `Create Or Update Asset`

<a id="opIdAssets_Create Or Update Asset"></a>

Creates or updates an asset with a specified identifier. If the asset already exists, you can specify an If-Match property in the HTTP request header to ensure that the asset is modified only if its version matches. To support flexibility on creation and update, the following rules and behaviors are executed for metadata and stream references on a given asset when that asset is from an asset type.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h4>Request Body</h4>

Asset to create or update.<br/>

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Asset](#schemaasset)|OK.|
|201|[Asset](#schemaasset)|Asset created with specified identifier.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|409|[ErrorTemplate](#schemaerrortemplate)|Conflict.|
|412|[ErrorTemplate](#schemaerrortemplate)|Pre-Condition Failed.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|ETag|string|Version.|
|201|ETag|string|Version.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
  ]
}
```

> 201 Response

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
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

## `Patch Asset`

<a id="opIdAssets_Patch Asset"></a>

Performs a JSON Patch operation on the asset with the specified identifier.

<h3>Request</h3>

```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h4>Request Body</h4>

Asset patch document.<br/>

```json
{
  "Operations": [
    {
      "value": null,
      "path": "string",
      "op": "string",
      "from": "string"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Asset](#schemaasset)|OK.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|409|[ErrorTemplate](#schemaerrortemplate)|Conflict.|
|412|[ErrorTemplate](#schemaerrortemplate)|Pre-Condition Failed.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|ETag|string|Version.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
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

## `Delete Asset`

<a id="opIdAssets_Delete Asset"></a>

Deletes the asset with a specified identifier.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Asset with specified identifier has been deleted.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not Found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|409|[ErrorTemplate](#schemaerrortemplate)|Conflict.|
|412|[ErrorTemplate](#schemaerrortemplate)|Pre-Condition Failed.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

# Assets

## `List Assets`

<a id="opIdRequestManager_List Assets"></a>

Returns an array of assets in a given namespace and the total number of assets returned, specified as Total-Count in the HTTP response header.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets
?filter={filter}&skip={skip}&count={count}&orderBy={orderBy}&query={query}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string filter`
<br/>String used to filter the asset search results. Filter strings are not case-sensitive. Filters can be applied for the `AssetTypeName` property, the `Status` property, and the asset metadata properties, using the syntax filter[*property_name*]=*property_value*.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>`[optional] string orderBy`
<br/>Optional parameter which returns assets ordered either by the asset `Id` or the asset `Name`. Specify `asc` or `desc` to return the results in ascending or descending order. If not specified, the default is ascending order.<br/><br/>`[optional] string query`
<br/>Query identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Asset](#schemaasset)[]|List of assets in the system.|
|400|[ErrorTemplate](#schemaerrortemplate)|The request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|Total number of assets in the namespace.|
|200|ETag|string|Collection ETag. Changes whenever an asset is created, updated, or deleted.|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "Id": "SampleAsset",
    "Description": "This is a sample asset.",
    "Metadata": [
      {
        "Id": "fbd82b97-d29e-4022-968e-f8492cf86644",
        "Name": "ModelNumber",
        "Description": "This is a static attribute on the asset which represents the model number.",
        "SdsTypeCode": "Double",
        "Value": 0.01
      }
    ],
    "StreamReferences": [
      {
        "Id": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
        "Name": "Data",
        "Description": "This is reference to a stream. The stream Id is SdsStream_1.",
        "StreamId": "SdsStream_1"
      }
    ]
  },
  {
    "Id": "SecondSampleAsset",
    "Description": "This is a second sample asset.",
    "Metadata": [
      {
        "Id": "90ef6205-152b-40ed-8ffa-bac3feff6fa2",
        "Name": "ModelNumber",
        "Description": "This is a static attribute on the asset which represents the model number.",
        "SdsTypeCode": "Double",
        "Value": 900
      }
    ],
    "StreamReferences": [
      {
        "Id": "fdda0985-7dba-48aa-95fc-55620a9b59ad",
        "Name": "Data",
        "Description": "This is reference to a stream. The stream identifier is SdsStream_2.",
        "StreamId": "SdsStream_2"
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

## `Head Assets`

<a id="opIdRequestManager_Head Assets"></a>

Returns the Headers corresponding to the GET Assets call, including a collection ETag and, optionally, Total-Count. The collection ETag changes whenever an asset type is created, updated, or deleted.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets
?filter={filter}&query={query}&includeTotalCount={includeTotalCount}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string filter`
<br/>String used to filter the asset search results. Filter strings are not case-sensitive. Filters can be applied for the `AssetTypeName` property, the `Status` property, and the asset metadata properties, using the syntax filter[*property_name*]=*property_value*.<br/><br/>`[optional] string query`
<br/>Search query. Defaults to all assets if unspecified.<br/><br/>`[optional] boolean includeTotalCount`
<br/>Optional parameter. If set to false, Total-Count header will not be included.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Call succeeded.|
|400|[ErrorTemplate](#schemaerrortemplate)|Invalid query syntax.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|204|Total-Count|integer|Total number of assets in the matching the query and filter criteria and which the caller has permission to read.|
|204|ETag|string|Collection ETag. Changes whenever an asset is created, updated, or deleted.|

---

## `Create Asset`

<a id="opIdRequestManager_Create Asset"></a>

Creates a new asset. If the asset you are trying to create references an asset type (through the AssetTypeId property) and if the corresponding asset type has a metadata value with the same identifier, then the name and SDS type code of the metadata value on the asset must be null. If the asset type does not have metadata value with a corresponding Id, the name and SDS type code on the asset cannot be null. To support flexibility on creation and update, the following rules and behaviors are executed for metadata and stream references on a given asset when that asset is created from an asset type.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

Asset you want to create<br/>

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[Asset](#schemaasset)|Asset created|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|You are not authorized to create assets.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|201|ETag|string|Version.|

<h4>Example response body</h4>

> 201 Response

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
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

## `Bulk Create Assets`

<a id="opIdRequestManager_Bulk Create Assets"></a>

Creates assets in bulk. Creates multiple assets in a single call.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Assets
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

List of assets you want to create.<br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[MultiStatusResultOfAssetAndChildErrorTemplate](#schemamultistatusresultofassetandchilderrortemplate)|Assets as persisted, including values for optional parameters that were omitted in the request.|
|207|[MultiStatusResultOfAssetAndChildErrorTemplate](#schemamultistatusresultofassetandchilderrortemplate)|Partial success. Some assets were created. See response body for additional details.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response ([MultiStatusResultOfAssetAndChildErrorTemplate](#schemamultistatusresultofassetandchilderrortemplate))

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    {
      "Id": "SampleAsset",
      "Description": "This is a sample asset.",
      "Metadata": [
        {
          "Id": "Id-abcde",
          "Name": "ModelNumber",
          "Description": "This is a static attribute on the asset which represents the model number.",
          "SdsTypeCode": "Double",
          "Value": 0.01
        }
      ],
      "StreamReferences": [
        {
          "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
          "Name": "Data",
          "Description": "This is the description for this stream reference.",
          "StreamId": "SdsStream_1"
        }
      ],
      "Tags": [
        "Tag1",
        "Tag2"
      ]
    }
  ],
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Resolution": "string",
      "Reason": "string",
      "StatusCode": 0,
      "property1": null,
      "property2": null
    }
  ]
}
```

---

## `Bulk Delete Assets`

<a id="opIdRequestManager_Bulk Delete Assets"></a>

Deletes all assets with the specified identifiers. This API can delete up to a maximum of 1000 assets in one API call.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Assets
?id={id}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] array id`
<br/>Ampersand separated asset identifiers in the form of id={assetId_1}&amp;id={assetId_2}<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Assets with the specified ids has been deleted.|
|207|[MultiStatusResultOfStringAndChildErrorTemplate](#schemamultistatusresultofstringandchilderrortemplate)|Partial success. Not all assets were deleted. See response body for additional details.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 207 Response ([MultiStatusResultOfStringAndChildErrorTemplate](#schemamultistatusresultofstringandchilderrortemplate))

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    "string"
  ],
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Resolution": "string",
      "Reason": "string",
      "StatusCode": 0,
      "property1": null,
      "property2": null
    }
  ]
}
```

---
## Definitions

### Trustee

<a id="schematrustee"></a>
<a id="schema_Trustee"></a>
<a id="tocStrustee"></a>
<a id="tocstrustee"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Type|[TrusteeType](#schematrusteetype)|false|false|None|
|ObjectId|string|false|true|None|
|TenantId|string|false|true|None|

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}

```

---

### TrusteeType

<a id="schematrusteetype"></a>
<a id="schema_TrusteeType"></a>
<a id="tocStrusteetype"></a>
<a id="tocstrusteetype"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|User|1||
|Client|2||
|Role|3||

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

### AccessControlList

<a id="schemaaccesscontrollist"></a>
<a id="schema_AccessControlList"></a>
<a id="tocSaccesscontrollist"></a>
<a id="tocsaccesscontrollist"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|RoleTrusteeAccessControlEntries|[[AccessControlEntry](#schemaaccesscontrolentry)]|false|true|None|

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 1,
        "ObjectId": "string",
        "TenantId": "string"
      },
      "AccessType": 0,
      "AccessRights": 0
    }
  ]
}

```

---

### AccessControlEntry

<a id="schemaaccesscontrolentry"></a>
<a id="schema_AccessControlEntry"></a>
<a id="tocSaccesscontrolentry"></a>
<a id="tocsaccesscontrolentry"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Trustee|[Trustee](#schematrustee)|false|true|None|
|AccessType|[AccessType](#schemaaccesstype)|false|false|None|
|AccessRights|int64|false|false|None|

```json
{
  "Trustee": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "AccessType": 0,
  "AccessRights": 0
}

```

---

### AccessType

<a id="schemaaccesstype"></a>
<a id="schema_AccessType"></a>
<a id="tocSaccesstype"></a>
<a id="tocsaccesstype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Allowed|0|
|Denied|1|

---

### Asset

<a id="schemaasset"></a>
<a id="schema_Asset"></a>
<a id="tocSasset"></a>
<a id="tocsasset"></a>

Represents an asset object.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Identifier. If you do not provide an identifier, a random GUID will be assigned as the identifier.|
|Name|string|false|true|User-friendly name. If not specified, name will be set to the same value as the `Id` field.|
|Description|string|false|true|Description|
|CreatedDate|date-time|false|false|Created Date|
|ModifiedDate|date-time|false|false|Modified Date|
|Metadata|[[MetadataItem](#schemametadataitem)]|false|true|Metadata|
|AssetTypeId|string|false|true|Asset type identifier. Identifier for the asset type that this asset is derived from. To get the merged view of the asset, get the resolved asset through the /Assets/{assetId}/Resolved route.|
|StreamReferences|[[StreamReference](#schemastreamreference)]|false|true|Asset stream reference|
|Status|[StatusConfiguration](#schemastatusconfiguration)|false|true|Asset status|
|Tags|string[]|false|true|Asset tags|

```json
{
  "Id": "SampleAsset",
  "Description": "This is a sample asset.",
  "Metadata": [
    {
      "Id": "Id-abcde",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "StreamReferences": [
    {
      "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
      "Name": "Data",
      "Description": "This is the description for this stream reference.",
      "StreamId": "SdsStream_1"
    }
  ],
  "Tags": [
    "Tag1",
    "Tag2"
  ]
}

```

---

### MetadataItem

<a id="schemametadataitem"></a>
<a id="schema_MetadataItem"></a>
<a id="tocSmetadataitem"></a>
<a id="tocsmetadataitem"></a>

An asset or asset type metadata is static information associated with a given asset. A given metadata contains a list of individual metadata values. There is no limit on the number of metadata values defined by an asset. An asset or asset type metadata does not stand alone. It must be specified within an asset or asset type object and, therefore, there are no direct API routes to asset or asset type metadata.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Metadata identifier|
|Name|string|false|true|User-friendly name for the metadata value. If not null, must be unique within an asset or asset type.|
|Description|string|false|true|Metadata item description.|
|SdsTypeCode|[SdsTypeCode2](#schemasdstypecode2)|false|false|This integer corresponds to the SdsTypeCode. Asset metadata support the following integer or string values: 11 ("Int64"), 14 ("Double"), 16 ("DateTime"), and 18 ("String").|
|Value|any|false|true|String representation of the metadata value.|
|Uom|string|false|true|Asset metadata unit of measurement. Select from the list of supported Uom types.|

```json
{
  "Id": "Sample Metadata identifier",
  "Name": "Max Pressure",
  "Description": "This metadata represents the maximum pressure of a given asset.",
  "SdsTypeCode": "Double",
  "Value": 11.2,
  "Uom": "newton"
}

```

---

### SdsTypeCode

<a id="schemasdstypecode"></a>
<a id="schema_SdsTypeCode"></a>
<a id="tocSsdstypecode"></a>
<a id="tocssdstypecode"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Empty|0|
|Object|1|
|Boolean|3|
|Char|4|
|SByte|5|
|Byte|6|
|Int16|7|
|UInt16|8|
|Int32|9|
|UInt32|10|
|Int64|11|
|UInt64|12|
|Single|13|
|Double|14|
|Decimal|15|
|DateTime|16|
|String|18|
|Guid|19|
|DateTimeOffset|20|
|TimeSpan|21|
|Version|22|
|NullableBoolean|103|
|NullableChar|104|
|NullableSByte|105|
|NullableByte|106|
|NullableInt16|107|
|NullableUInt16|108|
|NullableInt32|109|
|NullableUInt32|110|
|NullableInt64|111|
|NullableUInt64|112|
|NullableSingle|113|
|NullableDouble|114|
|NullableDecimal|115|
|NullableDateTime|116|
|NullableGuid|119|
|NullableDateTimeOffset|120|
|NullableTimeSpan|121|
|BooleanArray|203|
|CharArray|204|
|SByteArray|205|
|ByteArray|206|
|Int16Array|207|
|UInt16Array|208|
|Int32Array|209|
|UInt32Array|210|
|Int64Array|211|
|UInt64Array|212|
|SingleArray|213|
|DoubleArray|214|
|DecimalArray|215|
|DateTimeArray|216|
|StringArray|218|
|GuidArray|219|
|DateTimeOffsetArray|220|
|TimeSpanArray|221|
|VersionArray|222|
|Array|400|
|IList|401|
|IDictionary|402|
|IEnumerable|403|
|SdsType|501|
|SdsTypeProperty|502|
|SdsStreamView|503|
|SdsStreamViewProperty|504|
|SdsStreamViewMap|505|
|SdsStreamViewMapProperty|506|
|SdsStream|507|
|SdsStreamIndex|508|
|SdsTable|509|
|SdsColumn|510|
|SdsValues|511|
|SdsObject|512|
|SByteEnum|605|
|ByteEnum|606|
|Int16Enum|607|
|UInt16Enum|608|
|Int32Enum|609|
|UInt32Enum|610|
|Int64Enum|611|
|UInt64Enum|612|
|NullableSByteEnum|705|
|NullableByteEnum|706|
|NullableInt16Enum|707|
|NullableUInt16Enum|708|
|NullableInt32Enum|709|
|NullableUInt32Enum|710|
|NullableInt64Enum|711|
|NullableUInt64Enum|712|

---

### SdsTypeCode2

<a id="schemasdstypecode2"></a>
<a id="schema_SdsTypeCode2"></a>
<a id="tocSsdstypecode2"></a>
<a id="tocssdstypecode2"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Empty|Empty|
|Object|Object|
|Boolean|Boolean|
|Char|Char|
|SByte|SByte|
|Byte|Byte|
|Int16|Int16|
|UInt16|UInt16|
|Int32|Int32|
|UInt32|UInt32|
|Int64|Int64|
|UInt64|UInt64|
|Single|Single|
|Double|Double|
|Decimal|Decimal|
|DateTime|DateTime|
|String|String|
|Guid|Guid|
|DateTimeOffset|DateTimeOffset|
|TimeSpan|TimeSpan|
|Version|Version|
|NullableBoolean|NullableBoolean|
|NullableChar|NullableChar|
|NullableSByte|NullableSByte|
|NullableByte|NullableByte|
|NullableInt16|NullableInt16|
|NullableUInt16|NullableUInt16|
|NullableInt32|NullableInt32|
|NullableUInt32|NullableUInt32|
|NullableInt64|NullableInt64|
|NullableUInt64|NullableUInt64|
|NullableSingle|NullableSingle|
|NullableDouble|NullableDouble|
|NullableDecimal|NullableDecimal|
|NullableDateTime|NullableDateTime|
|NullableGuid|NullableGuid|
|NullableDateTimeOffset|NullableDateTimeOffset|
|NullableTimeSpan|NullableTimeSpan|
|BooleanArray|BooleanArray|
|CharArray|CharArray|
|SByteArray|SByteArray|
|ByteArray|ByteArray|
|Int16Array|Int16Array|
|UInt16Array|UInt16Array|
|Int32Array|Int32Array|
|UInt32Array|UInt32Array|
|Int64Array|Int64Array|
|UInt64Array|UInt64Array|
|SingleArray|SingleArray|
|DoubleArray|DoubleArray|
|DecimalArray|DecimalArray|
|DateTimeArray|DateTimeArray|
|StringArray|StringArray|
|GuidArray|GuidArray|
|DateTimeOffsetArray|DateTimeOffsetArray|
|TimeSpanArray|TimeSpanArray|
|VersionArray|VersionArray|
|Array|Array|
|IList|IList|
|IDictionary|IDictionary|
|IEnumerable|IEnumerable|
|SdsType|SdsType|
|SdsTypeProperty|SdsTypeProperty|
|SdsStreamView|SdsStreamView|
|SdsStreamViewProperty|SdsStreamViewProperty|
|SdsStreamViewMap|SdsStreamViewMap|
|SdsStreamViewMapProperty|SdsStreamViewMapProperty|
|SdsStream|SdsStream|
|SdsStreamIndex|SdsStreamIndex|
|SdsTable|SdsTable|
|SdsColumn|SdsColumn|
|SdsValues|SdsValues|
|SdsObject|SdsObject|
|SByteEnum|SByteEnum|
|ByteEnum|ByteEnum|
|Int16Enum|Int16Enum|
|UInt16Enum|UInt16Enum|
|Int32Enum|Int32Enum|
|UInt32Enum|UInt32Enum|
|Int64Enum|Int64Enum|
|UInt64Enum|UInt64Enum|
|NullableSByteEnum|NullableSByteEnum|
|NullableByteEnum|NullableByteEnum|
|NullableInt16Enum|NullableInt16Enum|
|NullableUInt16Enum|NullableUInt16Enum|
|NullableInt32Enum|NullableInt32Enum|
|NullableUInt32Enum|NullableUInt32Enum|
|NullableInt64Enum|NullableInt64Enum|
|NullableUInt64Enum|NullableUInt64Enum|

---

### StreamReference

<a id="schemastreamreference"></a>
<a id="schema_StreamReference"></a>
<a id="tocSstreamreference"></a>
<a id="tocsstreamreference"></a>

An asset stream reference represents dynamic stream data associated with an asset. The references must either be an SDS stream or an SDS stream view. Asset-centric data routes provide direct access to dynamic data for a given asset. There are no limitations on the number of references an asset may contain. However, an asset cannot contain multiple references to the same SDS stream. An asset stream reference does not stand alone. It must be specified within an asset object and, therefore, asset references do not have direct API routes.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Stream Reference identifier|
|Name|string|false|true|User-friendly name for stream reference|
|Description|string|false|true|Description of the stream reference|
|StreamId|string|true|false|SDS stream identifier that is being referenced.|

```json
{
  "Id": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
  "Name": "Data",
  "Description": "This is reference to a stream. The stream identifier is SdsStream_1.",
  "StreamId": "SdsStream_1"
}

```

---

### StatusConfiguration

<a id="schemastatusconfiguration"></a>
<a id="schema_StatusConfiguration"></a>
<a id="tocSstatusconfiguration"></a>
<a id="tocsstatusconfiguration"></a>

Status configuration is a property of an asset or asset type that defines the simple status of an asset or asset type.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|DefinitionType|[StatusDefinitionType](#schemastatusdefinitiontype)|false|false|Status definition type. Only "StreamPropertyMapping" is supported.|
|Definition|any|false|true|Status definition|

```json
{
  "DefinitionType": "StreamPropertyMapping",
  "Definition": {
    "StreamReferenceId": "StatusMappingOnAssetTypeCrudFunctionalTest_streamRef",
    "StreamPropertyId": "Value",
    "ValueStatusMappings": [
      {
        "Value": 3,
        "Status": "Bad",
        "DisplayName": "Bad"
      },
      {
        "Value": 1,
        "Status": "Good",
        "DisplayName": "Good"
      }
    ]
  }
}

```

---

### StatusDefinitionType

<a id="schemastatusdefinitiontype"></a>
<a id="schema_StatusDefinitionType"></a>
<a id="tocSstatusdefinitiontype"></a>
<a id="tocsstatusdefinitiontype"></a>

Status definition type. Currently, only StreamPropertyMapping is supported.

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Unspecified|0|
|StreamPropertyMapping|1|

---

### JsonPatchDocumentOfPatchAsset

<a id="schemajsonpatchdocumentofpatchasset"></a>
<a id="schema_JsonPatchDocumentOfPatchAsset"></a>
<a id="tocSjsonpatchdocumentofpatchasset"></a>
<a id="tocsjsonpatchdocumentofpatchasset"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Operations|[[OperationOfPatchAsset](#schemaoperationofpatchasset)]|false|true|None|

```json
{
  "Operations": [
    {
      "value": null,
      "path": "string",
      "op": "string",
      "from": "string"
    }
  ]
}

```

---

### OperationOfPatchAsset

<a id="schemaoperationofpatchasset"></a>
<a id="schema_OperationOfPatchAsset"></a>
<a id="tocSoperationofpatchasset"></a>
<a id="tocsoperationofpatchasset"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|value|any|false|true|None|
|path|string|false|true|None|
|op|string|false|true|None|
|from|string|false|true|None|

```json
{
  "value": null,
  "path": "string",
  "op": "string",
  "from": "string"
}

```

---

### MultiStatusResultOfAssetAndChildErrorTemplate

<a id="schemamultistatusresultofassetandchilderrortemplate"></a>
<a id="schema_MultiStatusResultOfAssetAndChildErrorTemplate"></a>
<a id="tocSmultistatusresultofassetandchilderrortemplate"></a>
<a id="tocsmultistatusresultofassetandchilderrortemplate"></a>

A multi status result is returned to indicate a partial success.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Reason|string|false|true|Failure reason.|
|Error|string|false|true|Error string|
|OperationId|string|false|true|Operational identifier of the call. Used for support.|
|Data|[[Asset](#schemaasset)]|false|true|Requested information from call.|
|ChildErrors|[[ChildErrorTemplate](#schemachilderrortemplate)]|false|true|Child error pertaining to specific resources.|

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    {
      "Id": "SampleAsset",
      "Description": "This is a sample asset.",
      "Metadata": [
        {
          "Id": "Id-abcde",
          "Name": "ModelNumber",
          "Description": "This is a static attribute on the asset which represents the model number.",
          "SdsTypeCode": "Double",
          "Value": 0.01
        }
      ],
      "StreamReferences": [
        {
          "Id": "5345e98d-dc43-4f9d-a666-158a3baaf244",
          "Name": "Data",
          "Description": "This is the description for this stream reference.",
          "StreamId": "SdsStream_1"
        }
      ],
      "Tags": [
        "Tag1",
        "Tag2"
      ]
    }
  ],
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Resolution": "string",
      "Reason": "string",
      "StatusCode": 0,
      "property1": null,
      "property2": null
    }
  ]
}

```

---

### ChildErrorTemplate

<a id="schemachilderrortemplate"></a>
<a id="schema_ChildErrorTemplate"></a>
<a id="tocSchilderrortemplate"></a>
<a id="tocschilderrortemplate"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation identifier|
|Error|string|false|true|Error string|
|Resolution|string|false|true|Resolution string|
|Reason|string|false|true|Error reason string|
|StatusCode|int32|false|false|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Resolution": "string",
  "Reason": "string",
  "StatusCode": 0,
  "property1": null,
  "property2": null
}

```

---

### MultiStatusResultOfStringAndChildErrorTemplate

<a id="schemamultistatusresultofstringandchilderrortemplate"></a>
<a id="schema_MultiStatusResultOfStringAndChildErrorTemplate"></a>
<a id="tocSmultistatusresultofstringandchilderrortemplate"></a>
<a id="tocsmultistatusresultofstringandchilderrortemplate"></a>

A multi status result is returned to indicate a partial success.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Reason|string|false|true|Failure reason.|
|Error|string|false|true|Error string|
|OperationId|string|false|true|Operational identifier of the call. Used for support.|
|Data|string[]|false|true|Requested information from call.|
|ChildErrors|[[ChildErrorTemplate](#schemachilderrortemplate)]|false|true|Child error pertaining to specific resources.|

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    "string"
  ],
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Resolution": "string",
      "Reason": "string",
      "StatusCode": 0,
      "property1": null,
      "property2": null
    }
  ]
}

```

---

