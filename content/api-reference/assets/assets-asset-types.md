---
uid: assets-asset-types

---

# Asset Types
The asset types API allows you to create, read, update, and delete asset types.

## `List Asset Types`

<a id="opIdAssetTypes_List Asset Types"></a>

Returns an array of asset types in a given namespace and the total number of asset types returned, specified as Total-Count in the HTTP response header.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes
?skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AssetType](#schemaassettype)[]|List of asset types in the given namespace.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|Total number of asset types in the namespace.|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "Id": "SampleAssetType",
    "Description": "This is a sample asset type.",
    "Metadata": [
      {
        "Id": "fbd82b97-d29e-4022-968e-f8492cf86644",
        "Name": "ModelNumber",
        "Description": "This is a static attribute on the asset type which represents the model number.",
        "SdsTypeCode": "Double",
        "Value": 0.01
      }
    ],
    "TypeReferences": [
      {
        "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
        "StreamReferenceName": "ReferenceName",
        "TypeId": "PI-Float32"
      }
    ]
  },
  {
    "Id": "SecondSampleAssetType",
    "Description": "This is a second sample asset type.",
    "Metadata": [
      {
        "Id": "e79cdc54-5d94-4e78-ae1e-eb507c40737d",
        "Name": "ReleaseNumber",
        "Description": "This is a static attribute on the asset type which represents the model number.",
        "SdsTypeCode": "Double",
        "Value": 54.5
      }
    ],
    "TypeReferences": [
      {
        "StreamReferenceId": "d4f0f8b7-208a-4a6c-8a08-aec3577e0640",
        "StreamReferenceName": "ReferenceName",
        "TypeId": "PI-Int32"
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

## `Head Asset Types`

<a id="opIdAssetTypes_Head Asset Types"></a>

Returns the Headers corresponding to the GET AssetTypes call, including a collection ETag and, optionally, Total-Count. The collection ETag changes whenever an asset type is created, updated, or deleted.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes
?includeTotalCount={includeTotalCount}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] boolean includeTotalCount`
<br/>Optional Parameter. Default value is false. If set to true, Total-count header will be included in the returned headers. Total-Count refers to the number of asset types that the user has permission to access corresponding to an optional query.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Call succeeded.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|204|Total-Count|integer|Total number of asset types accessible to the caller and that match the specified query.|
|204|ETag|string|Collection ETag. Changes whenever an asset type is created, updated, or deleted.|

---

## `Create Asset Type`

<a id="opIdAssetTypes_Create Asset Type"></a>

Create or update an asset type with a specified identifier.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

Asset type to create.<br/>

```json
{
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[AssetType](#schemaassettype)|Asset type created.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|412|[ErrorTemplate](#schemaerrortemplate)|Pre-Condition Failed. See response body for additional details.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|201|ETag|string|Version.|

<h4>Example response body</h4>

> 201 Response

```json
{
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
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

## `Get Asset Type`

<a id="opIdAssetTypes_Get Asset Type"></a>

Returns an array of asset types in a given namespace and the total number of asset types returned, specified as Total-Count in the HTTP response header.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AssetType](#schemaassettype)|Asset type with specified identifier.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|ETag|string|Version.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
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

## `Get Or Create Asset Type`

<a id="opIdAssetTypes_Get Or Create Asset Type"></a>

Creates or updates an asset type with a specified identifier.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>

<h4>Request Body</h4>

Asset type to create.<br/>

```json
{
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AssetType](#schemaassettype)|OK.|
|201|[AssetType](#schemaassettype)|Asset type created.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|409|[ErrorTemplate](#schemaerrortemplate)|Conflict. See response body for additional details.|
|412|[ErrorTemplate](#schemaerrortemplate)|Pre-Condition Failed. See response body for additional details.|
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
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
    }
  ]
}
```

> 201 Response

```json
{
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
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

## `Create Or Update Asset Type`

<a id="opIdAssetTypes_Create Or Update Asset Type"></a>

Creates or updates an asset type with a specified identifier.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>

<h4>Request Body</h4>

Asset type to create or update.<br/>

```json
{
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AssetType](#schemaassettype)|Asset type with specified identifier.|
|201|[AssetType](#schemaassettype)|Asset type created.|
|400|[ErrorTemplate](#schemaerrortemplate)|The request is not valid. See the response body for additional details.|
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
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
    }
  ]
}
```

> 201 Response

```json
{
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
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

## `Delete Asset Type`

<a id="opIdAssetTypes_Delete Asset Type"></a>

Deletes asset type with a specified identifier.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}
?deleteAssets={deleteAssets}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>
`[optional] boolean deleteAssets`
<br/>Call should also delete all assets of this asset type. Default is false.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Asset type with specified identifier has been deleted.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not Found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|409|[ErrorTemplate](#schemaerrortemplate)|Conflict. See response body for additional details.|
|412|[ErrorTemplate](#schemaerrortemplate)|Pre-Condition Failed. See response body for additional details.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

---

## `Bulk Create Asset Types`

<a id="opIdAssetTypes_Bulk Create Asset Types"></a>

Bulk creates asset types. Creates multiple asset types in a single call.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/AssetTypes
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

List of asset types you want to create.<br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[MultiStatusResultOfAssetTypeAndChildErrorTemplate](#schemamultistatusresultofassettypeandchilderrortemplate)|Asset types as persisted, including values for optional parameters that were omitted in request.|
|207|[MultiStatusResultOfAssetTypeAndChildErrorTemplate](#schemamultistatusresultofassettypeandchilderrortemplate)|Partial success. Some asset types were created. See response body for additional details.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

<h4>Example response body</h4>

> 200 Response ([MultiStatusResultOfAssetTypeAndChildErrorTemplate](#schemamultistatusresultofassettypeandchilderrortemplate))

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    {
      "Id": "SampleAssetType01",
      "Description": "This is a sample asset type.",
      "Metadata": [
        {
          "Id": "Id-fbd82b97-d29e-4022-968e",
          "Name": "ModelNumber",
          "Description": "This is a static attribute on the asset type which represents the model number.",
          "SdsTypeCode": "Double",
          "Value": 0.01
        }
      ],
      "TypeReferences": [
        {
          "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
          "StreamReferenceName": "ReferenceName",
          "TypeId": "PI-Float32"
        }
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

## `Get Asset Type Owner`

<a id="opIdAssetTypes_Get Asset Type Owner"></a>

Returns the owner of specified asset type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}/Owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|OK.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
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

## `Update Asset Type Owner`

<a id="opIdAssetTypes_Update Asset Type Owner"></a>

Updates the owner of specified asset type.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}/Owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>

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
|204|None|Asset type owner updated.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
|503|[ErrorTemplate](#schemaerrortemplate)|Service unavailable.|

---

## `Get Asset Type Acl`

<a id="opIdAssetTypes_Get Asset Type Acl"></a>

Returns the access control list of the specified asset type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}/AccessControl
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Access control list of the asset type with given identifier.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
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

## `Update Asset Type Access Control`

<a id="opIdAssetTypes_Update Asset Type Access Control"></a>

Updates the access control of the specified asset type.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}/AccessControl
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>

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

## `List Asset Type Access Rights`

<a id="opIdAssetTypes_List Asset Type Access Rights"></a>

Returns the access rights of specified asset type.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AssetTypes/{assetTypeId}/AccessRights
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetTypeId`
<br/>Asset type identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Access control list of the asset type with given identifier.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|[ErrorTemplate](#schemaerrortemplate)|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|
|408|[ErrorTemplate](#schemaerrortemplate)|Request Timeout.|
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
## Definitions

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

### AssetType

<a id="schemaassettype"></a>
<a id="schema_AssetType"></a>
<a id="tocSassettype"></a>
<a id="tocsassettype"></a>

An asset type can be used to create multiple similar assets. A change to the asset type is reflected in all assets that are derived from the asset type.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Identifier. If you do not provide an identifier, a random GUID will be assigned as the identifier.|
|Name|string|false|true|User-friendly name. If not specified, name will be set to the same value as the `Id` field.|
|Description|string|false|true|Description|
|Metadata|[[MetadataItem](#schemametadataitem)]|false|true|Metadata|
|TypeReferences|[[TypeReference](#schematypereference)]|false|true|Asset type description|
|Status|[StatusConfiguration](#schemastatusconfiguration)|false|true|Asset type status. If an asset of an this asset type, asset type statuses will take precedence over asset status.|

```json
{
  "Id": "SampleAssetType01",
  "Description": "This is a sample asset type.",
  "Metadata": [
    {
      "Id": "Id-fbd82b97-d29e-4022-968e",
      "Name": "ModelNumber",
      "Description": "This is a static attribute on the asset type which represents the model number.",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "TypeReferences": [
    {
      "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
      "StreamReferenceName": "ReferenceName",
      "TypeId": "PI-Float32"
    }
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

### TypeReference

<a id="schematypereference"></a>
<a id="schema_TypeReference"></a>
<a id="tocStypereference"></a>
<a id="tocstypereference"></a>

An asset type type reference represents dynamic stream data associated with an asset. The references must either be an SDS stream or an SDS stream view. Asset-centric data routes provide direct access to dynamic data for a given asset. There are no limitations on the number of references an asset may contain. However, an asset cannot contain multiple references to the same SDS stream. An asset reference does not stand alone. It must be specified within an asset object and, therefore, asset references do not have direct API routes.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StreamReferenceId|string|false|true|The identifier for this type reference. If an asset is derived from this asset type, this identifier must be referenced in the asset reference type object. This identifier must be unique within asset types.|
|StreamReferenceName|string|false|true|User-friendly name for type reference|
|Description|string|false|true|Type reference description|
|TypeId|string|true|false|Referenced SdsType identifier|

```json
{
  "StreamReferenceId": "Reference1",
  "StreamReferenceName": "ReferenceName",
  "TypeId": "PI-Float32"
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

### MultiStatusResultOfAssetTypeAndChildErrorTemplate

<a id="schemamultistatusresultofassettypeandchilderrortemplate"></a>
<a id="schema_MultiStatusResultOfAssetTypeAndChildErrorTemplate"></a>
<a id="tocSmultistatusresultofassettypeandchilderrortemplate"></a>
<a id="tocsmultistatusresultofassettypeandchilderrortemplate"></a>

A multi status result is returned to indicate a partial success.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Reason|string|false|true|Failure reason.|
|Error|string|false|true|Error string|
|OperationId|string|false|true|Operational identifier of the call. Used for support.|
|Data|[[AssetType](#schemaassettype)]|false|true|Requested information from call.|
|ChildErrors|[[ChildErrorTemplate](#schemachilderrortemplate)]|false|true|Child error pertaining to specific resources.|

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    {
      "Id": "SampleAssetType01",
      "Description": "This is a sample asset type.",
      "Metadata": [
        {
          "Id": "Id-fbd82b97-d29e-4022-968e",
          "Name": "ModelNumber",
          "Description": "This is a static attribute on the asset type which represents the model number.",
          "SdsTypeCode": "Double",
          "Value": 0.01
        }
      ],
      "TypeReferences": [
        {
          "StreamReferenceId": "f1bf9da2-3858-4bcd-bf93-e7c26ab0d28e",
          "StreamReferenceName": "ReferenceName",
          "TypeId": "PI-Float32"
        }
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

