---
uid: softwaremgmt-edge-system

---

# Edge System

## `List Edge Systems (Edge path)`

<a id="opIdEdgeSystem_List Edge Systems (Edge path)"></a>

Returns a list of Edge Systems.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems
?skip={skip}&count={count}&orderBy={orderBy}&query={query}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first Edge System to retrieve. If unspecified, a default value of 0 is used. Value must be greater than 0.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used. Value cannot be less than 1 or greater than 1000.<br/><br/>`[optional] string orderBy`
<br/>Query parameter to specify sort order. Valid sort order properties are EdgeSystemId, DeviceName, Name, Type, Tags, Status, StatusDescription, LastContactedTime, and SoftwareVersion. If unspecified, a default value of 'name asc' is used.<br/><br/>`[optional] string query`
<br/>Query parameter to specify filter. Valid filter properties are EdgeSystemId, DeviceName, Name, Type, Tags, Status, StatusDescription, LastContactedTime, and SoftwareVersion.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EdgeSystem](#schemaedgesystem)[]|List of edge systems.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total number of edge systems.|

<h4>Example response body</h4>

> 200 Response ([EdgeSystem](#schemaedgesystem)[])

```json
[
  {
    "Id": "string",
    "DeviceName": "string",
    "Name": "string",
    "Type": "string",
    "SoftwareVersion": "string",
    "CreatedDate": "2019-08-24T14:15:22Z",
    "LastContactedTime": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z",
    "ModifiedBy": "string",
    "ModifiedByType": 1,
    "Status": 1,
    "StatusDescription": "string",
    "SystemDiagnosticsStreamId": "string",
    "Components": [
      {
        "Id": "string",
        "ComponentType": "string",
        "DeviceStatusStreamId": "string",
        "NextHealthMessageExpectedStreamId": "string",
        "DiagnosticsStreams": [
          {
            "Id": "string",
            "NamespaceId": "string",
            "TypeId": "string"
          }
        ],
        "Status": 1,
        "StatusDescription": "string",
        "Errors": [
          "string"
        ]
      }
    ],
    "Tags": [
      "string"
    ],
    "IsVisible": true
  }
]
```

---

## `Get Edge Systems Summary (Edge path)`

<a id="opIdEdgeSystem_Get Edge Systems Summary (Edge path)"></a>

Returns header information for Edge Systems.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems
?query={query}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string query`
<br/>Query parameter to specify a filter. Valid filter properties are EdgeSystemId, DeviceName, Name, Type, Tags, Status, StatusDescription, LastContactedTime, and SoftwareVersion.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Headers for Edge Systems found.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|204|Total-Count|integer|The total number of edge systems.|

---

## `List Edge Systems 1`

<a id="opIdEdgeSystem_List Edge Systems 1"></a>

Returns a list of Edge Systems.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems
?skip={skip}&count={count}&orderBy={orderBy}&query={query}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first Edge System to retrieve. If unspecified, a default value of 0 is used. Value must be greater than 0.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used. Value cannot be less than 1 or greater than 1000.<br/><br/>`[optional] string orderBy`
<br/>Query parameter to specify sort order. Valid sort order properties are EdgeSystemId, DeviceName, Name, Type, Tags, Status, StatusDescription, LastContactedTime, and SoftwareVersion. If unspecified, a default value of 'name asc' is used.<br/><br/>`[optional] string query`
<br/>Query parameter to specify filter. Valid filter properties are EdgeSystemId, DeviceName, Name, Type, Tags, Status, StatusDescription, LastContactedTime, and SoftwareVersion.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EdgeSystem](#schemaedgesystem)[]|List of edge systems.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total number of edge systems.|

<h4>Example response body</h4>

> 200 Response ([EdgeSystem](#schemaedgesystem)[])

```json
[
  {
    "Id": "string",
    "DeviceName": "string",
    "Name": "string",
    "Type": "string",
    "SoftwareVersion": "string",
    "CreatedDate": "2019-08-24T14:15:22Z",
    "LastContactedTime": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z",
    "ModifiedBy": "string",
    "ModifiedByType": 1,
    "Status": 1,
    "StatusDescription": "string",
    "SystemDiagnosticsStreamId": "string",
    "Components": [
      {
        "Id": "string",
        "ComponentType": "string",
        "DeviceStatusStreamId": "string",
        "NextHealthMessageExpectedStreamId": "string",
        "DiagnosticsStreams": [
          {
            "Id": "string",
            "NamespaceId": "string",
            "TypeId": "string"
          }
        ],
        "Status": 1,
        "StatusDescription": "string",
        "Errors": [
          "string"
        ]
      }
    ],
    "Tags": [
      "string"
    ],
    "IsVisible": true
  }
]
```

---

## `Get Edge Systems Summary 1`

<a id="opIdEdgeSystem_Get Edge Systems Summary 1"></a>

Returns header information for Edge Systems.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems
?query={query}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string query`
<br/>Query parameter to specify a filter. Valid filter properties are EdgeSystemId, DeviceName, Name, Type, Tags, Status, StatusDescription, LastContactedTime, and SoftwareVersion.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Headers for Edge Systems found.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|204|Total-Count|integer|The total number of edge systems.|

---

## `Get Edge System (Edge path)`

<a id="opIdEdgeSystem_Get Edge System (Edge path)"></a>

Returns a specific Edge System.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems/{edgeSystemId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EdgeSystem](#schemaedgesystem)|Edge System with the specified identifier.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Edge System not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([EdgeSystem](#schemaedgesystem))

```json
{
  "Id": "string",
  "DeviceName": "string",
  "Name": "string",
  "Type": "string",
  "SoftwareVersion": "string",
  "CreatedDate": "2019-08-24T14:15:22Z",
  "LastContactedTime": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "ModifiedBy": "string",
  "ModifiedByType": 1,
  "Status": 1,
  "StatusDescription": "string",
  "SystemDiagnosticsStreamId": "string",
  "Components": [
    {
      "Id": "string",
      "ComponentType": "string",
      "DeviceStatusStreamId": "string",
      "NextHealthMessageExpectedStreamId": "string",
      "DiagnosticsStreams": [
        {
          "Id": "string",
          "NamespaceId": "string",
          "TypeId": "string"
        }
      ],
      "Status": 1,
      "StatusDescription": "string",
      "Errors": [
        "string"
      ]
    }
  ],
  "Tags": [
    "string"
  ],
  "IsVisible": true
}
```

---

## `Show Or Hide System (Edge path)`

<a id="opIdEdgeSystem_Show Or Hide System (Edge path)"></a>

Reactivates a specific System.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems/{edgeSystemId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier.<br/><br/>

<h4>Request Body</h4>

object to reactivate.<br/>

```json
{
  "Id": "string",
  "DeviceName": "string",
  "Name": "string",
  "Type": "string",
  "SoftwareVersion": "string",
  "CreatedDate": "2019-08-24T14:15:22Z",
  "LastContactedTime": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "ModifiedBy": "string",
  "ModifiedByType": 1,
  "Status": 1,
  "StatusDescription": "string",
  "SystemDiagnosticsStreamId": "string",
  "Components": [
    {
      "Id": "string",
      "ComponentType": "string",
      "DeviceStatusStreamId": "string",
      "NextHealthMessageExpectedStreamId": "string",
      "DiagnosticsStreams": [
        {
          "Id": "string",
          "NamespaceId": "string",
          "TypeId": "string"
        }
      ],
      "Status": 1,
      "StatusDescription": "string",
      "Errors": [
        "string"
      ]
    }
  ],
  "Tags": [
    "string"
  ],
  "IsVisible": true
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success.|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|None|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Get Edge System 1`

<a id="opIdEdgeSystem_Get Edge System 1"></a>

Returns a specific Edge System.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems/{edgeSystemId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EdgeSystem](#schemaedgesystem)|Edge System with the specified identifier.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Edge System not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([EdgeSystem](#schemaedgesystem))

```json
{
  "Id": "string",
  "DeviceName": "string",
  "Name": "string",
  "Type": "string",
  "SoftwareVersion": "string",
  "CreatedDate": "2019-08-24T14:15:22Z",
  "LastContactedTime": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "ModifiedBy": "string",
  "ModifiedByType": 1,
  "Status": 1,
  "StatusDescription": "string",
  "SystemDiagnosticsStreamId": "string",
  "Components": [
    {
      "Id": "string",
      "ComponentType": "string",
      "DeviceStatusStreamId": "string",
      "NextHealthMessageExpectedStreamId": "string",
      "DiagnosticsStreams": [
        {
          "Id": "string",
          "NamespaceId": "string",
          "TypeId": "string"
        }
      ],
      "Status": 1,
      "StatusDescription": "string",
      "Errors": [
        "string"
      ]
    }
  ],
  "Tags": [
    "string"
  ],
  "IsVisible": true
}
```

---

## `Show Or Hide System 1`

<a id="opIdEdgeSystem_Show Or Hide System 1"></a>

Reactivates a specific System.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems/{edgeSystemId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier.<br/><br/>

<h4>Request Body</h4>

object to reactivate.<br/>

```json
{
  "Id": "string",
  "DeviceName": "string",
  "Name": "string",
  "Type": "string",
  "SoftwareVersion": "string",
  "CreatedDate": "2019-08-24T14:15:22Z",
  "LastContactedTime": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "ModifiedBy": "string",
  "ModifiedByType": 1,
  "Status": 1,
  "StatusDescription": "string",
  "SystemDiagnosticsStreamId": "string",
  "Components": [
    {
      "Id": "string",
      "ComponentType": "string",
      "DeviceStatusStreamId": "string",
      "NextHealthMessageExpectedStreamId": "string",
      "DiagnosticsStreams": [
        {
          "Id": "string",
          "NamespaceId": "string",
          "TypeId": "string"
        }
      ],
      "Status": 1,
      "StatusDescription": "string",
      "Errors": [
        "string"
      ]
    }
  ],
  "Tags": [
    "string"
  ],
  "IsVisible": true
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success.|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|None|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `List Tags (Edge path)`

<a id="opIdEdgeSystem_List Tags (Edge path)"></a>

Returns a list of tags present on Edge Systems.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Tags
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|List of tags|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total number of tags.|

---

## `List Tags 1`

<a id="opIdEdgeSystem_List Tags 1"></a>

Returns a list of tags present on Edge Systems.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Tags
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|List of tags|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total number of tags.|

---

## `Update Tags (Edge path)`

<a id="opIdEdgeSystem_Update Tags (Edge path)"></a>

Creates or updates the tags of a specific Edge System.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems/{edgeSystemId}/Tags
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier.<br/><br/>

<h4>Request Body</h4>

Serialized list of tags.<br/>

```json
[
  "string"
]
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Update Tags 1`

<a id="opIdEdgeSystem_Update Tags 1"></a>

Creates or updates the tags of a specific Edge System.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems/{edgeSystemId}/Tags
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier.<br/><br/>

<h4>Request Body</h4>

Serialized list of tags.<br/>

```json
[
  "string"
]
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

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
|OperationId|string|true|false|None|
|Error|string|true|false|None|
|Reason|string|true|false|None|
|Resolution|string|true|false|None|
|DynamicProperties|object|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
  "property1": null,
  "property2": null
}

```

---

### EdgeSystem

<a id="schemaedgesystem"></a>
<a id="schema_EdgeSystem"></a>
<a id="tocSedgesystem"></a>
<a id="tocsedgesystem"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Edge system unique identifier.|
|DeviceName|string|false|true|Device name for this edge system.|
|Name|string|false|true|Edge system name.|
|Type|string|false|true|Type name for this edge system.|
|SoftwareVersion|string|false|true|Version for this edge system.|
|CreatedDate|date-time|false|false|Time at which the edge system was created.|
|LastContactedTime|date-time|false|false|Time at which the edge system was last contacted.|
|ModifiedDate|date-time|false|true|Time at which the edge system was last modified.|
|ModifiedBy|string|false|true|Identifier for who modified the edge system most recently.|
|ModifiedByType|[TrusteeType](#schematrusteetype)|false|true|Type identifier for who modified the edge system most recently.|
|Status|[StatusCategory](#schemastatuscategory)|false|false|Value of the component's status for the component with the highest priority status.|
|StatusDescription|string|false|true|Value of the component's status description for the component with the highest priority status description.|
|SystemDiagnosticsStreamId|string|false|true|System diagnostics stream identifier for this edge system.|
|Components|[[Component](#schemacomponent)]|false|true|List of components for this edge system.|
|Tags|string[]|false|true|List of tags for this edge system.|
|IsVisible|boolean|false|false|Identifier iindicated if the system should be visible to the user/client.|

```json
{
  "Id": "string",
  "DeviceName": "string",
  "Name": "string",
  "Type": "string",
  "SoftwareVersion": "string",
  "CreatedDate": "2019-08-24T14:15:22Z",
  "LastContactedTime": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "ModifiedBy": "string",
  "ModifiedByType": 1,
  "Status": 1,
  "StatusDescription": "string",
  "SystemDiagnosticsStreamId": "string",
  "Components": [
    {
      "Id": "string",
      "ComponentType": "string",
      "DeviceStatusStreamId": "string",
      "NextHealthMessageExpectedStreamId": "string",
      "DiagnosticsStreams": [
        {
          "Id": "string",
          "NamespaceId": "string",
          "TypeId": "string"
        }
      ],
      "Status": 1,
      "StatusDescription": "string",
      "Errors": [
        "string"
      ]
    }
  ],
  "Tags": [
    "string"
  ],
  "IsVisible": true
}

```

---

### TrusteeType

<a id="schematrusteetype"></a>
<a id="schema_TrusteeType"></a>
<a id="tocStrusteetype"></a>
<a id="tocstrusteetype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|User|1|
|Client|2|
|Role|3|

---

### StatusCategory

<a id="schemastatuscategory"></a>
<a id="schema_StatusCategory"></a>
<a id="tocSstatuscategory"></a>
<a id="tocsstatuscategory"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Bad|1|
|Warning|2|
|Discovered|3|
|Good|4|
|Stopped|5|

---

### Component

<a id="schemacomponent"></a>
<a id="schema_Component"></a>
<a id="tocScomponent"></a>
<a id="tocscomponent"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Component unique identifier.|
|ComponentType|string|false|true|Type name for this component.|
|DeviceStatusStreamId|string|false|true|Stream identifier used to retrieve the component's status.|
|NextHealthMessageExpectedStreamId|string|false|true|Stream identifier used to retrieve the next health message expected time.|
|DiagnosticsStreams|[[DiagnosticsStream](#schemadiagnosticsstream)]|false|true|List of diagnostics streams.|
|Status|[StatusCategory](#schemastatuscategory)|false|false|Last known status for this component.|
|StatusDescription|string|false|true|Last known status description for this component.|
|Errors|string[]|false|true|List of errors for this component.|

```json
{
  "Id": "string",
  "ComponentType": "string",
  "DeviceStatusStreamId": "string",
  "NextHealthMessageExpectedStreamId": "string",
  "DiagnosticsStreams": [
    {
      "Id": "string",
      "NamespaceId": "string",
      "TypeId": "string"
    }
  ],
  "Status": 1,
  "StatusDescription": "string",
  "Errors": [
    "string"
  ]
}

```

---

### DiagnosticsStream

<a id="schemadiagnosticsstream"></a>
<a id="schema_DiagnosticsStream"></a>
<a id="tocSdiagnosticsstream"></a>
<a id="tocsdiagnosticsstream"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Unique identifier for this diagnostics stream.|
|NamespaceId|string|false|true|Namespace identifier for this diagnostics stream.|
|TypeId|string|false|true|Type name for this diagnostics stream.|

```json
{
  "Id": "string",
  "NamespaceId": "string",
  "TypeId": "string"
}

```

---

