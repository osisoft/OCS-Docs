---
uid: sds-types
---

# Types
The REST APIs provide programmatic access to read and write SDS data. The APIs in this section 
interact with types. For more information, see [Types](xref:sdsTypes).

## `List Types`

<a id="opIdType_List Types"></a>

Gets a list of `SdsType` objects. If the optional parameters are not set, this call will return up to the first 100 SdsTypes

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types?query={query}&skip={skip}&count={count}&orderby={orderby}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>
`[Optional] string query`  
Query identifier. 
See [Search in SDS](xref:sdsSearching) for information about specifying the search parameter.
<br/><br/>
`[Optional] int skip`  
Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.
<br/><br/>
`[Optional] int count`  
Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.
<br/><br/>
`[Optional] string orderby`  
Parameter representing sorted order.
A field name is required.
The sorting is based on the stored values for a given field (of type `string`). 
For example, ``orderby=name`` would sort the returned results by the ``name`` values (ascending by default). 
Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values ``asc`` or ``desc``, respectively.
For example, ``orderby=name desc`` would sort the returned results by the ``name`` values, descending. 
If no value is specified, there is no sorting of results.
<br/><br/>
### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsType](#schemasdstype)[]|Returns a list of `SdsType` objects|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response

```json
HTTP/1.1 200
Content-Type: application/json

[    
    {
    "Id": "Simple",
    "Name": "Simple",
    "SdsTypeCode": 1,
    "Properties": [
        {
            "Id": "Time",
            "Name": "Time",
            "IsKey": true,
            "SdsType": {
                "Id": "19a87a76-614a-385b-ba48-6f8b30ff6ab2",
                "Name": "DateTime",
                "SdsTypeCode": 16
            }
        },
        {
            "Id": "State",
            "Name": "State",
            "SdsType": {
                "Id": "e20bdd7e-590b-3372-ab39-ff61950fb4f3",
                "Name": "State",
                "SdsTypeCode": 609,
                "Properties": [
                    {
                        "Id": "Ok",
                        "Value": 0
                    },
                    {
                        "Id": "Warning",
                        "Value": 1
                    },
                    {
                        "Id": "Alarm",
                        "Value": 2
                    }
                ]
            }
        },
        {
            "Id": "Measurement",
            "Name": "Measurement",
            "SdsType": {
                "Id": "6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
                "Name": "Double",
                "SdsTypeCode": 14
            }
        }
    ]
    },
   
]
```
> 401 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Get Type`

<a id="opIdType_Get Type"></a>

Gets the specified `SdsType`.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsType](#schemasdstype)|Returns the `SdsType`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response

```json
HTTP/1.1 200
Content-Type: application/json

{
"Id":"Simple",
"Name":"Simple",
"SdsTypeCode":1,
"Properties":[
    {
        "Id":"Time",
        "Name":"Time",
        "IsKey":true,
        "SdsType":{
            "Id":"19a87a76-614a-385b-ba48-6f8b30ff6ab2",
            "Name":"DateTime",
            "SdsTypeCode":16
        }
    },
    {
        "Id":"State",
        "Name":"State",
        "SdsType":{
            "Id":"e20bdd7e-590b-3372-ab39-ff61950fb4f3",
            "Name":"State",
            "SdsTypeCode":609,
            "Properties":[
                {
                    "Id":"Ok",
                    "Value":0
                },
                {
                    "Id":"Warning",
                    "Value":1
                },
                {
                    "Id":"Alarm",
                    "Value":2
                }
            ]
        }
    },
    {
        "Id":"Measurement",
        "Name":"Measurement",
        "SdsType":{
            "Id":"6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
            "Name":"Double",
            "SdsTypeCode":14
        }
    }
]
}
```
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Get Or Create Type`

<a id="opIdType_Get Or Create Type"></a>

Creates the specified type. If a type with a matching identifier already exists, SDS compares the existing type with the type that was sent.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsType](#schemasdstype)|Returns the `SdsType`|
|201|[SdsType](#schemasdstype)|Returns the `SdsType`|
|302|None|The `SdsType` already exists|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([SdsType](#schemasdstype))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SdsTypeCode": 0,
  "IsGenericType": true,
  "IsReferenceType": true,
  "GenericArguments": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "IsGenericType": true,
      "IsReferenceType": true,
      "GenericArguments": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": null,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {}
          ],
          "Properties": [
            {}
          ],
          "BaseType": null,
          "DerivedTypes": [
            {}
          ],
          "InterpolationMode": null,
          "ExtrapolationMode": null
        }
      ],
      "Properties": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "Order": 0,
          "IsKey": true,
          "FixedSize": 0,
          "SdsType": null,
          "Value": null,
          "Uom": "string",
          "InterpolationMode": null,
          "IsQuality": true
        }
      ],
      "BaseType": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      },
      "DerivedTypes": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": null,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {}
          ],
          "Properties": [
            {}
          ],
          "BaseType": null,
          "DerivedTypes": [
            {}
          ],
          "InterpolationMode": null,
          "ExtrapolationMode": null
        }
      ],
      "InterpolationMode": 0,
      "ExtrapolationMode": 0
    }
  ],
  "Properties": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "Order": 0,
      "IsKey": true,
      "FixedSize": 0,
      "SdsType": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      },
      "Value": null,
      "Uom": "string",
      "InterpolationMode": 0,
      "IsQuality": true
    }
  ],
  "BaseType": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SdsTypeCode": 0,
    "IsGenericType": true,
    "IsReferenceType": true,
    "GenericArguments": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      }
    ],
    "Properties": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "Order": 0,
        "IsKey": true,
        "FixedSize": 0,
        "SdsType": null,
        "Value": null,
        "Uom": "string",
        "InterpolationMode": null,
        "IsQuality": true
      }
    ],
    "BaseType": {
      "Id": null,
      "Name": null,
      "Description": null,
      "SdsTypeCode": null,
      "IsGenericType": null,
      "IsReferenceType": null,
      "GenericArguments": null,
      "Properties": null,
      "BaseType": null,
      "DerivedTypes": null,
      "InterpolationMode": null,
      "ExtrapolationMode": null
    },
    "DerivedTypes": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      }
    ],
    "InterpolationMode": 0,
    "ExtrapolationMode": 0
  },
  "DerivedTypes": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "IsGenericType": true,
      "IsReferenceType": true,
      "GenericArguments": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": null,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {}
          ],
          "Properties": [
            {}
          ],
          "BaseType": null,
          "DerivedTypes": [
            {}
          ],
          "InterpolationMode": null,
          "ExtrapolationMode": null
        }
      ],
      "Properties": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "Order": 0,
          "IsKey": true,
          "FixedSize": 0,
          "SdsType": null,
          "Value": null,
          "Uom": "string",
          "InterpolationMode": null,
          "IsQuality": true
        }
      ],
      "BaseType": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      },
      "DerivedTypes": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": null,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {}
          ],
          "Properties": [
            {}
          ],
          "BaseType": null,
          "DerivedTypes": [
            {}
          ],
          "InterpolationMode": null,
          "ExtrapolationMode": null
        }
      ],
      "InterpolationMode": 0,
      "ExtrapolationMode": 0
    }
  ],
  "InterpolationMode": 0,
  "ExtrapolationMode": 0
}
```

> 201 Response

```json
HTTP/1.1 201
Content-Type: application/json

{
"Id": "Simple",
"Name": "Simple",
"Description": null,
"SdsTypeCode": 1,
"IsGenericType": false,
"IsReferenceType": false,
"GenericArguments": null,
"Properties": [
    {
        "Id": "Time",
        "Name": "Time",
        "Description": null,
        "Order": 0,
        "IsKey": true,
        "FixedSize": 0,
        "SdsType": {
            "Id": "19a87a76-614a-385b-ba48-6f8b30ff6ab2",
            "Name": "DateTime",
            "Description": null,
            "SdsTypeCode": 16,
            "IsGenericType": false,
            "IsReferenceType": false,
            "GenericArguments": null,
            "Properties": null,
            "BaseType": null,
            "DerivedTypes": null,
            "InterpolationMode": 0,
            "ExtrapolationMode": 0
        },
        "Value": null,
        "Uom": null,
        "InterpolationMode": null
    },
    {
        "Id": "State",
        "Name": "State",
        "Description": null,
        "Order": 0,
        "IsKey": false,
        "FixedSize": 0,
        "SdsType": {
            "Id": "e20bdd7e-590b-3372-ab39-ff61950fb4f3",
            "Name": "State",
            "Description": null,
            "SdsTypeCode": 609,
            "IsGenericType": false,
            "IsReferenceType": false,
            "GenericArguments": null,
            "Properties": [
                {
                    "Id": "Ok",
                    "Name": null,
                    "Description": null,
                    "Order": 0,
                    "IsKey": false,
                    "FixedSize": 0,
                    "SdsType": null,
                    "Value": 0,
                    "Uom": null,
                    "InterpolationMode": null
                },
                {
                    "Id": "Warning",
                    "Name": null,
                    "Description": null,
                    "Order": 0,
                    "IsKey": false,
                    "FixedSize": 0,
                    "SdsType": null,
                    "Value": 1,
                    "Uom": null,
                    "InterpolationMode": null
                },
                {
                    "Id": "Alarm",
                    "Name": null,
                    "Description": null,
                    "Order": 0,
                    "IsKey": false,
                    "FixedSize": 0,
                    "SdsType": null,
                    "Value": 2,
                    "Uom": null,
                    "InterpolationMode": null
                }
            ],
            "BaseType": null,
            "DerivedTypes": null,
            "InterpolationMode": 0,
            "ExtrapolationMode": 0
        },
        "Value": null,
        "Uom": null,
        "InterpolationMode": null
    },
    {
        "Id": "Measurement",
        "Name": "Measurement",
        "Description": null,
        "Order": 0,
        "IsKey": false,
        "FixedSize": 0,
        "SdsType": {
            "Id": "6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
            "Name": "Double",
            "Description": null,
            "SdsTypeCode": 14,
            "IsGenericType": false,
            "IsReferenceType": false,
            "GenericArguments": null,
            "Properties": null,
            "BaseType": null,
            "DerivedTypes": null,
            "InterpolationMode": 0,
            "ExtrapolationMode": 0
        },
        "Value": null,
        "Uom": null,
        "InterpolationMode": null
    }
    ],
    "BaseType": null,
    "DerivedTypes": null,
    "InterpolationMode": 0,
    "ExtrapolationMode": 0
    }
```

---

## `Delete Type`

<a id="opIdType_Delete Type"></a>

Deletes a type from the specified tenant and namespace. Note that a type cannot be deleted if any streams, stream views, or other types reference it.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The `SdsType` was successfully deleted|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Get Type Reference Count`

<a id="opIdType_Get Type Reference Count"></a>

Returns a dictionary mapping the object name to the number of references held by streams, stream views and parent types for the specified type.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}/ReferenceCount
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns a dictionary mapping with object name to number of references|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response

```json
 {
"SdsStream":3,
"SdsStreamView":2,
"SdsType":1
}
```
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---
## Definitions

### SdsType

<a id="schemasdstype"></a>
<a id="schema_SdsType"></a>
<a id="tocSsdstype"></a>
<a id="tocssdstype"></a>

A contract defining the type of data to read or write in a SdsStream

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|A unique identifier for the SdsType object|
|Name|string|false|true|An optional user-friendly name for the SdsType object|
|Description|string|false|true|A brief description of the SdsType object|
|SdsTypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|The SdsTypeCode of the SdsType object|
|IsGenericType|boolean|false|false|A boolean value indicating whether the current SdsType is a generic type This property is only used when using templates or generics. It will be automatically set if the SdsType is generated using SdsTypeBuilder. For further information on generics, please refer, https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/generics/index|
|IsReferenceType|boolean|false|false|Enabling this property preserves objects as references during serialization/de-serialization of the SdsType data while using the SdsFormatter This property behaves similar to IsReference property for DataContractSerializer and is only valid for serialization if SdsFormatter is used.|
|GenericArguments|[[SdsType](#schemasdstype)]|false|true|Contains the parameterized SdsTypes of the current generic SdsType This property is only used when using templates or generics. It will be automatically set if the SdsType is generated using SdsTypeBuilder. For further information on generics, please refer to https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/generics/index|
|Properties|[[SdsTypeProperty](#schemasdstypeproperty)]|false|true|List of SdsTypePropertys of the SdsType|
|BaseType|[SdsType](#schemasdstype)|false|true|Defines the base type of the SdsType Commonly used by SdsTypeBuilder to generate SdsType from contracts not explicitly defined and maintained by the user.|
|DerivedTypes|[[SdsType](#schemasdstype)]|false|true|List of SdsTypes that should be recognized by SdsFormatter during serialization/de-serialization. This property behaves similar to KnownTypeAttribute attribute for DataContractSerializer and only valid for serialization if SdsFormatter is used.|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|false|Defines the SdsInterpolationMode of the SdsType. This property is only valid for the root SdsType and invalid for SdsTypes of SdsTypePropertys.|
|ExtrapolationMode|[SdsExtrapolationMode](#schemasdsextrapolationmode)|false|false|Defines the SdsExtrapolationMode of the SdsType. This property is only valid for the root SdsType and invalid for SdsTypes of SdsTypePropertys.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SdsTypeCode": 0,
  "IsGenericType": true,
  "IsReferenceType": true,
  "GenericArguments": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "IsGenericType": true,
      "IsReferenceType": true,
      "GenericArguments": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": null,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {}
          ],
          "Properties": [
            {}
          ],
          "BaseType": null,
          "DerivedTypes": [
            {}
          ],
          "InterpolationMode": null,
          "ExtrapolationMode": null
        }
      ],
      "Properties": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "Order": 0,
          "IsKey": true,
          "FixedSize": 0,
          "SdsType": null,
          "Value": null,
          "Uom": "string",
          "InterpolationMode": null,
          "IsQuality": true
        }
      ],
      "BaseType": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      },
      "DerivedTypes": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": null,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {}
          ],
          "Properties": [
            {}
          ],
          "BaseType": null,
          "DerivedTypes": [
            {}
          ],
          "InterpolationMode": null,
          "ExtrapolationMode": null
        }
      ],
      "InterpolationMode": 0,
      "ExtrapolationMode": 0
    }
  ],
  "Properties": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "Order": 0,
      "IsKey": true,
      "FixedSize": 0,
      "SdsType": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      },
      "Value": null,
      "Uom": "string",
      "InterpolationMode": 0,
      "IsQuality": true
    }
  ],
  "BaseType": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SdsTypeCode": 0,
    "IsGenericType": true,
    "IsReferenceType": true,
    "GenericArguments": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      }
    ],
    "Properties": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "Order": 0,
        "IsKey": true,
        "FixedSize": 0,
        "SdsType": null,
        "Value": null,
        "Uom": "string",
        "InterpolationMode": null,
        "IsQuality": true
      }
    ],
    "BaseType": {
      "Id": null,
      "Name": null,
      "Description": null,
      "SdsTypeCode": null,
      "IsGenericType": null,
      "IsReferenceType": null,
      "GenericArguments": null,
      "Properties": null,
      "BaseType": null,
      "DerivedTypes": null,
      "InterpolationMode": null,
      "ExtrapolationMode": null
    },
    "DerivedTypes": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      }
    ],
    "InterpolationMode": 0,
    "ExtrapolationMode": 0
  },
  "DerivedTypes": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "IsGenericType": true,
      "IsReferenceType": true,
      "GenericArguments": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": null,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {}
          ],
          "Properties": [
            {}
          ],
          "BaseType": null,
          "DerivedTypes": [
            {}
          ],
          "InterpolationMode": null,
          "ExtrapolationMode": null
        }
      ],
      "Properties": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "Order": 0,
          "IsKey": true,
          "FixedSize": 0,
          "SdsType": null,
          "Value": null,
          "Uom": "string",
          "InterpolationMode": null,
          "IsQuality": true
        }
      ],
      "BaseType": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      },
      "DerivedTypes": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": null,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {}
          ],
          "Properties": [
            {}
          ],
          "BaseType": null,
          "DerivedTypes": [
            {}
          ],
          "InterpolationMode": null,
          "ExtrapolationMode": null
        }
      ],
      "InterpolationMode": 0,
      "ExtrapolationMode": 0
    }
  ],
  "InterpolationMode": 0,
  "ExtrapolationMode": 0
}

```

---

### SdsTypeCode

<a id="schemasdstypecode"></a>
<a id="schema_SdsTypeCode"></a>
<a id="tocSsdstypecode"></a>
<a id="tocssdstypecode"></a>

#### Enumerated Values

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

### SdsTypeProperty

<a id="schemasdstypeproperty"></a>
<a id="schema_SdsTypeProperty"></a>
<a id="tocSsdstypeproperty"></a>
<a id="tocssdstypeproperty"></a>

A contract defining a property of a SdsType

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|An unique identifier for the SdsTypeProperty object|
|Name|string|false|true|An optional user-friendly name for the SdsTypeProperty object|
|Description|string|false|true|A brief description of the SdsTypeProperty object|
|Order|int32|false|false|The order used for comparison among SdsTypePropertys if a compound index is specified for SdsType|
|IsKey|boolean|false|false|A boolean value indicating whether the current SdsTypeProperty must be used for indexing Used in combination with property to enable compound indexing|
|FixedSize|int32|false|false|An optional property specifying the length of string Exclusively used for that is of|
|SdsType|[SdsType](#schemasdstype)|false|true|SdsType of the current SdsTypeProperty|
|Value|any|false|true|An enum value of the current SdsTypeProperty. Exclusively used for a of an enum|
|Uom|string|false|true|Indicates the Unit of Measure of the current SdsTypeProperty|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|true|An InterpolationMode that overrides the root SdsType's InterpolationMode for this SdsTypeProperty|
|IsQuality|boolean|false|false|Indicates whether this property marks data quality|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "Order": 0,
  "IsKey": true,
  "FixedSize": 0,
  "SdsType": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SdsTypeCode": 0,
    "IsGenericType": true,
    "IsReferenceType": true,
    "GenericArguments": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      }
    ],
    "Properties": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "Order": 0,
        "IsKey": true,
        "FixedSize": 0,
        "SdsType": null,
        "Value": null,
        "Uom": "string",
        "InterpolationMode": null,
        "IsQuality": true
      }
    ],
    "BaseType": {
      "Id": null,
      "Name": null,
      "Description": null,
      "SdsTypeCode": null,
      "IsGenericType": null,
      "IsReferenceType": null,
      "GenericArguments": null,
      "Properties": null,
      "BaseType": null,
      "DerivedTypes": null,
      "InterpolationMode": null,
      "ExtrapolationMode": null
    },
    "DerivedTypes": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": null,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          null
        ],
        "Properties": [
          null
        ],
        "BaseType": null,
        "DerivedTypes": [
          null
        ],
        "InterpolationMode": null,
        "ExtrapolationMode": null
      }
    ],
    "InterpolationMode": 0,
    "ExtrapolationMode": 0
  },
  "Value": null,
  "Uom": "string",
  "InterpolationMode": 0,
  "IsQuality": true
}

```

---

### SdsInterpolationMode

<a id="schemasdsinterpolationmode"></a>
<a id="schema_SdsInterpolationMode"></a>
<a id="tocSsdsinterpolationmode"></a>
<a id="tocssdsinterpolationmode"></a>

Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects

#### Enumerated Values

|Property|Value|
|---|---|
|Default|0|
|Continuous|0|
|StepwiseContinuousLeading|1|
|StepwiseContinuousTrailing|2|
|Discrete|3|
|ContinuousNullableLeading|4|
|ContinuousNullableTrailing|5|

---

### SdsExtrapolationMode

<a id="schemasdsextrapolationmode"></a>
<a id="schema_SdsExtrapolationMode"></a>
<a id="tocSsdsextrapolationmode"></a>
<a id="tocssdsextrapolationmode"></a>

Defines how a stream responds to requests with indexes that precede or follow all data in the stream. Behavior also depends on the SdsInterpolationMode for a stream. If SdsInterpolationMode is set to Discrete, extrapolation won't occur. If SdsInterpolationMode is set to ContinuousNullableLeading or ContinuousNullableTrailing, default values will be returned instead of actual data.

#### Enumerated Values

|Property|Value|
|---|---|
|All|0|
|None|1|
|Forward|2|
|Backward|3|

---

### ErrorResponseBody

<a id="schemaerrorresponsebody"></a>
<a id="schema_ErrorResponseBody"></a>
<a id="tocSerrorresponsebody"></a>
<a id="tocserrorresponsebody"></a>

Contains the error message format that follows the OCS error standards

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation unique identifier of action that caused the error|
|Error|string|false|true|Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|Resolution to resolve the error|
|Parameters|object|false|true|IDs or values that are creating or are affected by the error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}

```

---

