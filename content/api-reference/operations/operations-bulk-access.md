---
uid: operations-bulk-access

---

# Bulk Access
Defines the public API endpoints for bulk access jobs.

## `List Bulk Access Job Summaries`

<a id="opIdBulkAccess_List Bulk Access Job Summaries"></a>

Retrieves all bulk access job summaries for a namespace.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/bulk/accesscontrol/jobs
```

<h4>Parameters</h4>

`string tenantId`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#tenantId<br/><br/>`string namespaceId`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#namespaceId<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[BulkAccessJobSummary](#schemabulkaccessjobsummary)[]|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#200|
|401|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#401|
|403|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#403|
|408|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#408|
|500|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#500|

<h4>Example response body</h4>

> 200 Response ([BulkAccessJobSummary](#schemabulkaccessjobsummary)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "OperationId": "string",
    "StartTime": "2019-08-24T14:15:22Z",
    "EndTime": "2019-08-24T14:15:22Z",
    "Status": 0,
    "Requester": {
      "Type": 1,
      "ObjectId": "string",
      "TenantId": "string"
    },
    "StepsSucceeded": 0,
    "StepsFailed": 0,
    "StepsProcessed": 0,
    "TotalSteps": 0
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Create Bulk Access Job`

<a id="opIdBulkAccess_Create Bulk Access Job"></a>

Creates a bulk access job for updating multiple access control lists.

<h3>Request</h3>

```text 
POST /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/bulk/accesscontrol/jobs
```

<h4>Parameters</h4>

`string tenantId`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#tenantId<br/><br/>`string namespaceId`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#namespaceId<br/><br/>

<h4>Request Body</h4>

Input containing information for the access control list update operation.<br/>

```json
{
  "AccessControlList": {
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
  },
  "Operation": 0,
  "Scope": 0,
  "ResourceIds": [
    "string"
  ],
  "RoleIds": [
    "string"
  ],
  "ResourceType": 0,
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[BulkAccessJobSummary](#schemabulkaccessjobsummary)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#200|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#400|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#401|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#403|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#408|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#500|

<h4>Example response body</h4>

> 200 Response ([BulkAccessJobSummary](#schemabulkaccessjobsummary))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "OperationId": "string",
  "StartTime": "2019-08-24T14:15:22Z",
  "EndTime": "2019-08-24T14:15:22Z",
  "Status": 0,
  "Requester": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "StepsSucceeded": 0,
  "StepsFailed": 0,
  "StepsProcessed": 0,
  "TotalSteps": 0
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Bulk Access Job Summary`

<a id="opIdBulkAccess_Get Bulk Access Job Summary"></a>

Retrieves the summary of a bulk access job.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/bulk/accesscontrol/jobs/{jobId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#tenantId<br/><br/>`string namespaceId`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#namespaceId<br/><br/>`string jobId`
<br/>Job identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[BulkAccessJobSummary](#schemabulkaccessjobsummary)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#200|
|401|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#401|
|403|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#403|
|408|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#408|
|500|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#500|

<h4>Example response body</h4>

> 200 Response ([BulkAccessJobSummary](#schemabulkaccessjobsummary))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "OperationId": "string",
  "StartTime": "2019-08-24T14:15:22Z",
  "EndTime": "2019-08-24T14:15:22Z",
  "Status": 0,
  "Requester": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "StepsSucceeded": 0,
  "StepsFailed": 0,
  "StepsProcessed": 0,
  "TotalSteps": 0
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `List Bulk Access Job Steps`

<a id="opIdBulkAccess_List Bulk Access Job Steps"></a>

Retrieves the job steps of a completed bulk access job. No steps are returned if the job has not completed.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/namespaces/{namespaceId}/bulk/accesscontrol/jobs/{jobId}/jobsteps
?filterBy={filterBy}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#tenantId<br/><br/>`string namespaceId`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#namespaceId<br/><br/>`string jobId`
<br/>Job identifier.<br/><br/>
`[optional] any filterBy`
<br/>Filter to specify if successful, failed, or all job steps are returned.<br/><br/>`[optional] integer skip`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#skip<br/><br/>`[optional] integer count`
<br/>#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#count<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[BulkAccessJobStep](#schemabulkaccessjobstep)[]|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#200|
|401|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#401|
|403|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#403|
|408|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#408|
|500|[ErrorResponse](#schemaerrorresponse)|#https://raw.githubusercontent.com/osisoft/OCS-Docs/main/content/external-references/common.yaml#500|

<h4>Example response body</h4>

> 200 Response ([BulkAccessJobStep](#schemabulkaccessjobstep)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "StartTime": "2019-08-24T14:15:22Z",
    "EndTime": "2019-08-24T14:15:22Z",
    "Status": 0,
    "Errors": [
      {
        "OperationId": "string",
        "Error": "string",
        "Reason": "string",
        "Resolution": "string"
      }
    ],
    "ResourceId": "string"
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---
## Definitions

### BulkAccessJobSummary

<a id="schemabulkaccessjobsummary"></a>
<a id="schema_BulkAccessJobSummary"></a>
<a id="tocSbulkaccessjobsummary"></a>
<a id="tocsbulkaccessjobsummary"></a>

Provides summary information for the job.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Identifier of the job.|
|Name|string|false|true|Name of the job.|
|Description|string|false|true|Description of the job.|
|OperationId|string|false|true|Operation identifier of the job.|
|StartTime|date-time|false|true|Start time of the job.|
|EndTime|date-time|false|true|End time of the job.|
|Status|[Status](#schemastatus)|false|false|Status of the job.|
|Requester|[Trustee](#schematrustee)|false|true|Requester of the job.|
|StepsSucceeded|int32|false|false|Number of succeeded steps of the job.|
|StepsFailed|int32|false|false|Number of failed steps of the job.|
|StepsProcessed|int32|false|false|Number of steps of the job that have finished, regardless of status.|
|TotalSteps|int32|false|false|Total count of steps of the job.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "OperationId": "string",
  "StartTime": "2019-08-24T14:15:22Z",
  "EndTime": "2019-08-24T14:15:22Z",
  "Status": 0,
  "Requester": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "StepsSucceeded": 0,
  "StepsFailed": 0,
  "StepsProcessed": 0,
  "TotalSteps": 0
}

```

---

### Status

<a id="schemastatus"></a>
<a id="schema_Status"></a>
<a id="tocSstatus"></a>
<a id="tocsstatus"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Invalid|0||
|NotStarted|1||
|InProgress|2||
|Succeeded|3||
|Cancelled|4||
|Failed|5||
|PartiallySucceeded|6||

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

|Property|Value|
|---|---|
|User|1|
|Client|2|
|Role|3|

---

### ErrorResponseBody

<a id="schemaerrorresponsebody"></a>
<a id="schema_ErrorResponseBody"></a>
<a id="tocSerrorresponsebody"></a>
<a id="tocserrorresponsebody"></a>

```json
{}

```

---

### BulkAccessUpdateInput

<a id="schemabulkaccessupdateinput"></a>
<a id="schema_BulkAccessUpdateInput"></a>
<a id="tocSbulkaccessupdateinput"></a>
<a id="tocsbulkaccessupdateinput"></a>

Specifies the behavior of a bulk access job.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|AccessControlList|[AccessControlList](#schemaaccesscontrollist)|false|true|The access control list to be applied to the specified resources. If Operation is UpdateAll, this access control list will replace the entire access control list of each resource. If Operation is UpdateRoleAccess, it will replace only the access control entries within the access control list whose trustees match those provided in RoleIds.|
|Operation|[Operation](#schemaoperation)|false|false|Operation type of the bulk access job.|
|Scope|[Scope](#schemascope)|false|false|Scope of the bulk access job.|
|ResourceIds|string[]|false|true|Identifiers of resources to update. Only required when Scope is Resource.|
|RoleIds|string[]|false|true|Role identifiers of trustee whose access control entries are being updated. Only required when Operation is UpdateRoleAccess.|
|ResourceType|[ResourceType](#schemaresourcetype)|false|false|Type of resource to update.|
|Description|string|false|true|Optional description of the bulk access job.|

```json
{
  "AccessControlList": {
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
  },
  "Operation": 0,
  "Scope": 0,
  "ResourceIds": [
    "string"
  ],
  "RoleIds": [
    "string"
  ],
  "ResourceType": 0,
  "Description": "string"
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

### Operation

<a id="schemaoperation"></a>
<a id="schema_Operation"></a>
<a id="tocSoperation"></a>
<a id="tocsoperation"></a>

Operation being performed during a bulk access job.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|UpdateRoleAccess|0|Operation being performed during a bulk access job.|
|UpdateAll|1|Operation being performed during a bulk access job.|

---

### Scope

<a id="schemascope"></a>
<a id="schema_Scope"></a>
<a id="tocSscope"></a>
<a id="tocsscope"></a>

Scope of a bulk access job.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Namespace|0|Scope of a bulk access job.|
|Resource|1|Scope of a bulk access job.|

---

### ResourceType

<a id="schemaresourcetype"></a>
<a id="schema_ResourceType"></a>
<a id="tocSresourcetype"></a>
<a id="tocsresourcetype"></a>

Type of resource whose access is being bulk updated.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Stream|0|Type of resource whose access is being bulk updated.|

---

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

### BulkAccessJobStep

<a id="schemabulkaccessjobstep"></a>
<a id="schema_BulkAccessJobStep"></a>
<a id="tocSbulkaccessjobstep"></a>
<a id="tocsbulkaccessjobstep"></a>

Job step of a bulk access job. Each job step corresponds to a resource being updated during the job.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|StartTime|date-time|false|true|None|
|EndTime|date-time|false|true|None|
|Status|[Status](#schemastatus)|false|false|None|
|Errors|[[ErrorResponse2](#schemaerrorresponse2)]|false|true|None|
|ResourceId|string|false|true|Identifier of resource being updated.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "StartTime": "2019-08-24T14:15:22Z",
  "EndTime": "2019-08-24T14:15:22Z",
  "Status": 0,
  "Errors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Reason": "string",
      "Resolution": "string"
    }
  ],
  "ResourceId": "string"
}

```

---

### ErrorResponse2

<a id="schemaerrorresponse2"></a>
<a id="schema_ErrorResponse2"></a>
<a id="tocSerrorresponse2"></a>
<a id="tocserrorresponse2"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string"
}

```

---

### JobStepFilter

<a id="schemajobstepfilter"></a>
<a id="schema_JobStepFilter"></a>
<a id="tocSjobstepfilter"></a>
<a id="tocsjobstepfilter"></a>

Filter to be applied to bulk access job steps.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Success|0|Returns job steps with status of success.|
|Failure|1|Returns job steps with status of failed.|
|All|2|Returns all job steps.|

---

