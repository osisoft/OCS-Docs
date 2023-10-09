---
uid: ""

---

# Agents
The Agents controller is used to manage agent interaction.

## `List All Agents`

<a id="opIdAgents_List All Agents"></a>

Get all `AgentDto` objects associated with the specified Namespace.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/sync/agents
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AgentDto](#schemaagentdto)[]|The requested collection of `DataSourceDto`.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([AgentDto](#schemaagentdto)[])

```json
[
  {
    "Id": "string",
    "LastCommTime": "2019-08-24T14:15:22Z",
    "Version": "string",
    "Status": 0,
    "Description": "string",
    "HostName": "string",
    "PISystem": {
      "ServerId": "string",
      "Name": "string",
      "Version": "string",
      "AFServerId": "string",
      "AFName": "string",
      "AFVersion": "string",
      "LastCommunicationTime": "2019-08-24T14:15:22Z",
      "Transfers": [
        {
          "Id": "string",
          "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
          "Description": "string",
          "Status": 0,
          "LatestStreamingRead": "2019-08-24T14:15:22Z",
          "OnPremTransferStatus": 0,
          "PIPointCount": 0,
          "Metrics": {
            "StreamingEventCountPerSecond": 0,
            "HistoricalEventCountPerSecond": 0,
            "SuccessfulCreations": 0,
            "FailedCreations": 0,
            "SuccessfulStreamEdits": 0,
            "FailedStreamEdits": 0,
            "PointEdits": 0,
            "TotalPointsInTransfer": 0,
            "AssetsCreatedPerSecond": 0,
            "AssetsProcessedCount": 0,
            "TotalAssetsInTransfer": 0,
            "FailedCreationPointIds": [
              0
            ],
            "SuccessfulStreamDeletions": 0,
            "FailedStreamDeletions": 0,
            "SuccessfulAssetDeletions": 0,
            "FailedAssetDeletions": 0,
            "SuccessfulAssetCreations": 0,
            "FailedAssetCreationsAndUpdates": 0,
            "IsModified": true,
            "SuccessfulAssetUpdates": 0
          },
          "Name": "string",
          "MetadataPrivacy": 0,
          "TransferRevisionNumber": 0,
          "LastEditDate": "2019-08-24T14:15:22Z",
          "LastEditBy": "string",
          "AutoDeleteCloudObjects": true,
          "TotalPointsInTransfer": 0,
          "PIPointsWithHealthEvents": {
            "property1": {
              "MaxSeverity": 0,
              "EventId": "string"
            },
            "property2": {
              "MaxSeverity": 0,
              "EventId": "string"
            }
          },
          "AFElementsWithHealthEvents": {
            "property1": {
              "MaxSeverity": 0,
              "EventId": "string"
            },
            "property2": {
              "MaxSeverity": 0,
              "EventId": "string"
            }
          },
          "StreamCreationStatus": {
            "TransferId": "string",
            "Status": 0,
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": 0
          },
          "HistTransferProgress": {
            "TransferId": "string",
            "TotalArchives": 0,
            "CurrentArchive": 0,
            "TotalPointsInArchive": 0,
            "TransferredPointsForArchive": 0
          }
        }
      ],
      "AFIndexProgress": 0,
      "PIPointCacheProgress": 0,
      "ElementsIndexed": 0,
      "TotalElements": 0,
      "PointsIndexed": 0,
      "TotalPoints": 0
    },
    "Namespace": "string",
    "Region": "string",
    "IsDeprecated": true,
    "TransferMetrics": {
      "StreamingEventCountPerSecond": 0,
      "HistoricalEventCountPerSecond": 0,
      "SuccessfulCreations": 0,
      "FailedCreations": 0,
      "SuccessfulStreamEdits": 0,
      "FailedStreamEdits": 0,
      "PointEdits": 0,
      "TotalPointsInTransfer": 0,
      "AssetsCreatedPerSecond": 0,
      "AssetsProcessedCount": 0,
      "TotalAssetsInTransfer": 0,
      "FailedCreationPointIds": [
        0
      ],
      "SuccessfulStreamDeletions": 0,
      "FailedStreamDeletions": 0,
      "SuccessfulAssetDeletions": 0,
      "FailedAssetDeletions": 0,
      "SuccessfulAssetCreations": 0,
      "FailedAssetCreationsAndUpdates": 0,
      "IsModified": true,
      "SuccessfulAssetUpdates": 0
    }
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `List All Deleted Agents`

<a id="opIdAgents_List All Deleted Agents"></a>

Get all `AgentDto` objects from the specified timestamp onwards.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/sync/deletedagents
?fromTime={fromTime}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string fromTime`
<br/>Start timestamp for the query to get deleted agents<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AgentDto](#schemaagentdto)[]|The requested collection of `AgentDto`.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([AgentDto](#schemaagentdto)[])

```json
[
  {
    "Id": "string",
    "LastCommTime": "2019-08-24T14:15:22Z",
    "Version": "string",
    "Status": 0,
    "Description": "string",
    "HostName": "string",
    "PISystem": {
      "ServerId": "string",
      "Name": "string",
      "Version": "string",
      "AFServerId": "string",
      "AFName": "string",
      "AFVersion": "string",
      "LastCommunicationTime": "2019-08-24T14:15:22Z",
      "Transfers": [
        {
          "Id": "string",
          "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
          "Description": "string",
          "Status": 0,
          "LatestStreamingRead": "2019-08-24T14:15:22Z",
          "OnPremTransferStatus": 0,
          "PIPointCount": 0,
          "Metrics": {
            "StreamingEventCountPerSecond": 0,
            "HistoricalEventCountPerSecond": 0,
            "SuccessfulCreations": 0,
            "FailedCreations": 0,
            "SuccessfulStreamEdits": 0,
            "FailedStreamEdits": 0,
            "PointEdits": 0,
            "TotalPointsInTransfer": 0,
            "AssetsCreatedPerSecond": 0,
            "AssetsProcessedCount": 0,
            "TotalAssetsInTransfer": 0,
            "FailedCreationPointIds": [
              0
            ],
            "SuccessfulStreamDeletions": 0,
            "FailedStreamDeletions": 0,
            "SuccessfulAssetDeletions": 0,
            "FailedAssetDeletions": 0,
            "SuccessfulAssetCreations": 0,
            "FailedAssetCreationsAndUpdates": 0,
            "IsModified": true,
            "SuccessfulAssetUpdates": 0
          },
          "Name": "string",
          "MetadataPrivacy": 0,
          "TransferRevisionNumber": 0,
          "LastEditDate": "2019-08-24T14:15:22Z",
          "LastEditBy": "string",
          "AutoDeleteCloudObjects": true,
          "TotalPointsInTransfer": 0,
          "PIPointsWithHealthEvents": {
            "property1": {
              "MaxSeverity": 0,
              "EventId": "string"
            },
            "property2": {
              "MaxSeverity": 0,
              "EventId": "string"
            }
          },
          "AFElementsWithHealthEvents": {
            "property1": {
              "MaxSeverity": 0,
              "EventId": "string"
            },
            "property2": {
              "MaxSeverity": 0,
              "EventId": "string"
            }
          },
          "StreamCreationStatus": {
            "TransferId": "string",
            "Status": 0,
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": 0
          },
          "HistTransferProgress": {
            "TransferId": "string",
            "TotalArchives": 0,
            "CurrentArchive": 0,
            "TotalPointsInArchive": 0,
            "TransferredPointsForArchive": 0
          }
        }
      ],
      "AFIndexProgress": 0,
      "PIPointCacheProgress": 0,
      "ElementsIndexed": 0,
      "TotalElements": 0,
      "PointsIndexed": 0,
      "TotalPoints": 0
    },
    "Namespace": "string",
    "Region": "string",
    "IsDeprecated": true,
    "TransferMetrics": {
      "StreamingEventCountPerSecond": 0,
      "HistoricalEventCountPerSecond": 0,
      "SuccessfulCreations": 0,
      "FailedCreations": 0,
      "SuccessfulStreamEdits": 0,
      "FailedStreamEdits": 0,
      "PointEdits": 0,
      "TotalPointsInTransfer": 0,
      "AssetsCreatedPerSecond": 0,
      "AssetsProcessedCount": 0,
      "TotalAssetsInTransfer": 0,
      "FailedCreationPointIds": [
        0
      ],
      "SuccessfulStreamDeletions": 0,
      "FailedStreamDeletions": 0,
      "SuccessfulAssetDeletions": 0,
      "FailedAssetDeletions": 0,
      "SuccessfulAssetCreations": 0,
      "FailedAssetCreationsAndUpdates": 0,
      "IsModified": true,
      "SuccessfulAssetUpdates": 0
    }
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Capability Updates`

<a id="opIdAgents_Get Capability Updates"></a>

Handle Agent Capabilities Updates.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/sync/{agentId}/capabilities
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string agentId`
<br/>The Id of the specified on-prem agent.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A Dictionary object.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Post Capabilities`

<a id="opIdAgents_Post Capabilities"></a>

Handle Agent Capabilities Publishing.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/sync/{agentId}/capabilities
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string agentId`
<br/>The Id of the specified on-prem agent.<br/><br/>

<h4>Request Body</h4>

List of capabilities being published.<br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The capabilities published by the agent specified by `agentId` have been received and cached.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Post Forwarded Logs`

<a id="opIdAgents_Post Forwarded Logs"></a>

Post log messages from the on-prem agent to be forwarded to Application Insights.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/sync/{agentId}/logs
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string agentId`
<br/>The Id of the specified on-prem agent.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Log messages from the specified on-prem `agentId` have been forwarded to Application Insights.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `List Agent Resource Availability`

<a id="opIdAgents_List Agent Resource Availability"></a>

Gets the Agent's resource availability details.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/{agentId}/resources
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string agentId`
<br/>The Id of the specified on-prem agent.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AgentResourceDto](#schemaagentresourcedto)[]|A collection of missing agent resources (type and name)|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([AgentResourceDto](#schemaagentresourcedto)[])

```json
[
  {
    "ResourceType": 0,
    "Name": "string",
    "Available": true
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
<li>Tenant Member</li>
</ul>

---

## `Create Agent Resources If Not Exists`

<a id="opIdAgents_Create Agent Resources If Not Exists"></a>

Create the missing resource details for a given agent.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/{agentId}/resources
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string agentId`
<br/>The Id of the specified on-prem agent.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AgentResourceDto](#schemaagentresourcedto)[]|Successfully created agent resources - OK.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([AgentResourceDto](#schemaagentresourcedto)[])

```json
[
  {
    "ResourceType": 0,
    "Name": "string",
    "Available": true
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
<li>Tenant Member</li>
</ul>

---

## `Post`

<a id="opIdAgents_Post"></a>

Post Sync route for specified `agentId`.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/sync/{agentId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string agentId`
<br/>The Id of the specified on-prem agent.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Sync route for specified `agentId` has been posted - OK.|
|202|None|Sync route for specified `agentId` has been posted - Accepted.|
|204|None|Sync route for specified `agentId` has been posted - No Content.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---
## Definitions

### AgentDto

<a id="schemaagentdto"></a>
<a id="schema_AgentDto"></a>
<a id="tocSagentdto"></a>
<a id="tocsagentdto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|LastCommTime|date-time|false|false|None|
|Version|string|false|true|None|
|Status|[AgentStatus](#schemaagentstatus)|false|false|None|
|Description|string|false|true|None|
|HostName|string|false|true|None|
|PISystem|[PISystemDto](#schemapisystemdto)|false|true|None|
|Namespace|string|false|true|None|
|Region|string|false|true|None|
|IsDeprecated|boolean|false|false|None|
|TransferMetrics|[TransferMetricsDto](#schematransfermetricsdto)|false|true|None|

```json
{
  "Id": "string",
  "LastCommTime": "2019-08-24T14:15:22Z",
  "Version": "string",
  "Status": 0,
  "Description": "string",
  "HostName": "string",
  "PISystem": {
    "ServerId": "string",
    "Name": "string",
    "Version": "string",
    "AFServerId": "string",
    "AFName": "string",
    "AFVersion": "string",
    "LastCommunicationTime": "2019-08-24T14:15:22Z",
    "Transfers": [
      {
        "Id": "string",
        "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
        "Description": "string",
        "Status": 0,
        "LatestStreamingRead": "2019-08-24T14:15:22Z",
        "OnPremTransferStatus": 0,
        "PIPointCount": 0,
        "Metrics": {
          "StreamingEventCountPerSecond": 0,
          "HistoricalEventCountPerSecond": 0,
          "SuccessfulCreations": 0,
          "FailedCreations": 0,
          "SuccessfulStreamEdits": 0,
          "FailedStreamEdits": 0,
          "PointEdits": 0,
          "TotalPointsInTransfer": 0,
          "AssetsCreatedPerSecond": 0,
          "AssetsProcessedCount": 0,
          "TotalAssetsInTransfer": 0,
          "FailedCreationPointIds": [
            0
          ],
          "SuccessfulStreamDeletions": 0,
          "FailedStreamDeletions": 0,
          "SuccessfulAssetDeletions": 0,
          "FailedAssetDeletions": 0,
          "SuccessfulAssetCreations": 0,
          "FailedAssetCreationsAndUpdates": 0,
          "IsModified": true,
          "SuccessfulAssetUpdates": 0
        },
        "Name": "string",
        "MetadataPrivacy": 0,
        "TransferRevisionNumber": 0,
        "LastEditDate": "2019-08-24T14:15:22Z",
        "LastEditBy": "string",
        "AutoDeleteCloudObjects": true,
        "TotalPointsInTransfer": 0,
        "PIPointsWithHealthEvents": {
          "property1": {
            "MaxSeverity": 0,
            "EventId": "string"
          },
          "property2": {
            "MaxSeverity": 0,
            "EventId": "string"
          }
        },
        "AFElementsWithHealthEvents": {
          "property1": {
            "MaxSeverity": 0,
            "EventId": "string"
          },
          "property2": {
            "MaxSeverity": 0,
            "EventId": "string"
          }
        },
        "StreamCreationStatus": {
          "TransferId": "string",
          "Status": 0,
          "TotalPointStreamsExpected": 0,
          "VerifiedPointStreamsCreated": 0,
          "LastUpdateAttempt": "2019-08-24T14:15:22Z",
          "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
          "LastMessage": 0
        },
        "HistTransferProgress": {
          "TransferId": "string",
          "TotalArchives": 0,
          "CurrentArchive": 0,
          "TotalPointsInArchive": 0,
          "TransferredPointsForArchive": 0
        }
      }
    ],
    "AFIndexProgress": 0,
    "PIPointCacheProgress": 0,
    "ElementsIndexed": 0,
    "TotalElements": 0,
    "PointsIndexed": 0,
    "TotalPoints": 0
  },
  "Namespace": "string",
  "Region": "string",
  "IsDeprecated": true,
  "TransferMetrics": {
    "StreamingEventCountPerSecond": 0,
    "HistoricalEventCountPerSecond": 0,
    "SuccessfulCreations": 0,
    "FailedCreations": 0,
    "SuccessfulStreamEdits": 0,
    "FailedStreamEdits": 0,
    "PointEdits": 0,
    "TotalPointsInTransfer": 0,
    "AssetsCreatedPerSecond": 0,
    "AssetsProcessedCount": 0,
    "TotalAssetsInTransfer": 0,
    "FailedCreationPointIds": [
      0
    ],
    "SuccessfulStreamDeletions": 0,
    "FailedStreamDeletions": 0,
    "SuccessfulAssetDeletions": 0,
    "FailedAssetDeletions": 0,
    "SuccessfulAssetCreations": 0,
    "FailedAssetCreationsAndUpdates": 0,
    "IsModified": true,
    "SuccessfulAssetUpdates": 0
  }
}

```

---

### AgentStatus

<a id="schemaagentstatus"></a>
<a id="schema_AgentStatus"></a>
<a id="tocSagentstatus"></a>
<a id="tocsagentstatus"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Registering|0|
|Registered|1|
|Connected|2|
|Disconnected|3|
|Deleting|4|
|RegistrationFailed|5|
|DataSourceConnectionIssue|6|
|DataSourceSecurityIssue|7|
|Shutdown|8|
|MissingConfiguration|9|

---

### PISystemDto

<a id="schemapisystemdto"></a>
<a id="schema_PISystemDto"></a>
<a id="tocSpisystemdto"></a>
<a id="tocspisystemdto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|ServerId|guid|false|false|None|
|Name|string|false|true|None|
|Version|string|false|true|None|
|AFServerId|guid|false|false|None|
|AFName|string|false|true|None|
|AFVersion|string|false|true|None|
|LastCommunicationTime|date-time|false|false|None|
|Transfers|[[TransferSummaryDto](#schematransfersummarydto)]|false|true|None|
|AFIndexProgress|[AFIndexProgress](#schemaafindexprogress)|false|false|None|
|PIPointCacheProgress|[PIPointAttributeCacheProgress](#schemapipointattributecacheprogress)|false|false|None|
|ElementsIndexed|int64|false|false|None|
|TotalElements|int64|false|false|None|
|PointsIndexed|int64|false|false|None|
|TotalPoints|int64|false|false|None|

```json
{
  "ServerId": "string",
  "Name": "string",
  "Version": "string",
  "AFServerId": "string",
  "AFName": "string",
  "AFVersion": "string",
  "LastCommunicationTime": "2019-08-24T14:15:22Z",
  "Transfers": [
    {
      "Id": "string",
      "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
      "Description": "string",
      "Status": 0,
      "LatestStreamingRead": "2019-08-24T14:15:22Z",
      "OnPremTransferStatus": 0,
      "PIPointCount": 0,
      "Metrics": {
        "StreamingEventCountPerSecond": 0,
        "HistoricalEventCountPerSecond": 0,
        "SuccessfulCreations": 0,
        "FailedCreations": 0,
        "SuccessfulStreamEdits": 0,
        "FailedStreamEdits": 0,
        "PointEdits": 0,
        "TotalPointsInTransfer": 0,
        "AssetsCreatedPerSecond": 0,
        "AssetsProcessedCount": 0,
        "TotalAssetsInTransfer": 0,
        "FailedCreationPointIds": [
          0
        ],
        "SuccessfulStreamDeletions": 0,
        "FailedStreamDeletions": 0,
        "SuccessfulAssetDeletions": 0,
        "FailedAssetDeletions": 0,
        "SuccessfulAssetCreations": 0,
        "FailedAssetCreationsAndUpdates": 0,
        "IsModified": true,
        "SuccessfulAssetUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": {
          "MaxSeverity": 0,
          "EventId": "string"
        },
        "property2": {
          "MaxSeverity": 0,
          "EventId": "string"
        }
      },
      "AFElementsWithHealthEvents": {
        "property1": {
          "MaxSeverity": 0,
          "EventId": "string"
        },
        "property2": {
          "MaxSeverity": 0,
          "EventId": "string"
        }
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
      },
      "HistTransferProgress": {
        "TransferId": "string",
        "TotalArchives": 0,
        "CurrentArchive": 0,
        "TotalPointsInArchive": 0,
        "TransferredPointsForArchive": 0
      }
    }
  ],
  "AFIndexProgress": 0,
  "PIPointCacheProgress": 0,
  "ElementsIndexed": 0,
  "TotalElements": 0,
  "PointsIndexed": 0,
  "TotalPoints": 0
}

```

---

### TransferSummaryDto

<a id="schematransfersummarydto"></a>
<a id="schema_TransferSummaryDto"></a>
<a id="tocStransfersummarydto"></a>
<a id="tocstransfersummarydto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|HistoricalDataStartTime|date-time|false|false|None|
|Description|string|false|true|None|
|Status|[TransferStatus](#schematransferstatus)|false|false|None|
|LatestStreamingRead|date-time|false|false|None|
|OnPremTransferStatus|[TransferJobStatus](#schematransferjobstatus)|false|false|None|
|PIPointCount|int32|false|false|None|
|Metrics|[TransferMetricsDto](#schematransfermetricsdto)|false|true|None|
|Name|string|false|true|None|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None|
|TransferRevisionNumber|int32|false|false|None|
|LastEditDate|date-time|false|false|None|
|LastEditBy|guid|false|false|None|
|AutoDeleteCloudObjects|boolean|false|false|None|
|TotalPointsInTransfer|int64|false|false|None|
|PIPointsWithHealthEvents|object|false|true|None|
|AFElementsWithHealthEvents|object|false|true|None|
|StreamCreationStatus|[DetailedStreamCreationStatusDto](#schemadetailedstreamcreationstatusdto)|false|true|None|
|HistTransferProgress|[HistoricalTransferProgressDto](#schemahistoricaltransferprogressdto)|false|true|None|

```json
{
  "Id": "string",
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Status": 0,
  "LatestStreamingRead": "2019-08-24T14:15:22Z",
  "OnPremTransferStatus": 0,
  "PIPointCount": 0,
  "Metrics": {
    "StreamingEventCountPerSecond": 0,
    "HistoricalEventCountPerSecond": 0,
    "SuccessfulCreations": 0,
    "FailedCreations": 0,
    "SuccessfulStreamEdits": 0,
    "FailedStreamEdits": 0,
    "PointEdits": 0,
    "TotalPointsInTransfer": 0,
    "AssetsCreatedPerSecond": 0,
    "AssetsProcessedCount": 0,
    "TotalAssetsInTransfer": 0,
    "FailedCreationPointIds": [
      0
    ],
    "SuccessfulStreamDeletions": 0,
    "FailedStreamDeletions": 0,
    "SuccessfulAssetDeletions": 0,
    "FailedAssetDeletions": 0,
    "SuccessfulAssetCreations": 0,
    "FailedAssetCreationsAndUpdates": 0,
    "IsModified": true,
    "SuccessfulAssetUpdates": 0
  },
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
  "AutoDeleteCloudObjects": true,
  "TotalPointsInTransfer": 0,
  "PIPointsWithHealthEvents": {
    "property1": {
      "MaxSeverity": 0,
      "EventId": "string"
    },
    "property2": {
      "MaxSeverity": 0,
      "EventId": "string"
    }
  },
  "AFElementsWithHealthEvents": {
    "property1": {
      "MaxSeverity": 0,
      "EventId": "string"
    },
    "property2": {
      "MaxSeverity": 0,
      "EventId": "string"
    }
  },
  "StreamCreationStatus": {
    "TransferId": "string",
    "Status": 0,
    "TotalPointStreamsExpected": 0,
    "VerifiedPointStreamsCreated": 0,
    "LastUpdateAttempt": "2019-08-24T14:15:22Z",
    "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
    "LastMessage": 0
  },
  "HistTransferProgress": {
    "TransferId": "string",
    "TotalArchives": 0,
    "CurrentArchive": 0,
    "TotalPointsInArchive": 0,
    "TransferredPointsForArchive": 0
  }
}

```

---

### TransferStatus

<a id="schematransferstatus"></a>
<a id="schema_TransferStatus"></a>
<a id="tocStransferstatus"></a>
<a id="tocstransferstatus"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|NotSet|0|
|Started|1|
|Stopped|2|
|Initializing|3|

---

### TransferJobStatus

<a id="schematransferjobstatus"></a>
<a id="schema_TransferJobStatus"></a>
<a id="tocStransferjobstatus"></a>
<a id="tocstransferjobstatus"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Idle|0|
|SendingHistoricalData|1|
|SendingStreamingData|2|
|BackfillingStreamingGap|4|
|Done|8|
|UncategorizedError|16|
|StreamingErrorConsumerRemoved|32|
|StreamingErrorUpdateQueueOverflow|64|
|StreamingErrorSignupDropped|128|
|StreamingErrorProducerRemoved|256|
|StreamingErrorUnknown|512|
|PIPointTypeChangeDetected|1024|
|CreatingStreams|2048|
|NoValidPIPointsInTransfer|4096|
|UpdatingTransfer|8192|
|LastEditFailed|16384|

---

### TransferMetricsDto

<a id="schematransfermetricsdto"></a>
<a id="schema_TransferMetricsDto"></a>
<a id="tocStransfermetricsdto"></a>
<a id="tocstransfermetricsdto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StreamingEventCountPerSecond|float|false|false|None|
|HistoricalEventCountPerSecond|float|false|false|None|
|SuccessfulCreations|int64|false|false|None|
|FailedCreations|int64|false|false|None|
|SuccessfulStreamEdits|int64|false|false|None|
|FailedStreamEdits|int64|false|false|None|
|PointEdits|int64|false|false|None|
|TotalPointsInTransfer|int64|false|false|None|
|AssetsCreatedPerSecond|float|false|false|None|
|AssetsProcessedCount|int64|false|false|None|
|TotalAssetsInTransfer|int64|false|false|None|
|FailedCreationPointIds|[integer]|false|true|None|
|SuccessfulStreamDeletions|int64|false|false|None|
|FailedStreamDeletions|int64|false|false|None|
|SuccessfulAssetDeletions|int64|false|false|None|
|FailedAssetDeletions|int64|false|false|None|
|SuccessfulAssetCreations|int64|false|false|None|
|FailedAssetCreationsAndUpdates|int64|false|false|None|
|IsModified|boolean|false|false|None|
|SuccessfulAssetUpdates|int64|false|false|None|

```json
{
  "StreamingEventCountPerSecond": 0,
  "HistoricalEventCountPerSecond": 0,
  "SuccessfulCreations": 0,
  "FailedCreations": 0,
  "SuccessfulStreamEdits": 0,
  "FailedStreamEdits": 0,
  "PointEdits": 0,
  "TotalPointsInTransfer": 0,
  "AssetsCreatedPerSecond": 0,
  "AssetsProcessedCount": 0,
  "TotalAssetsInTransfer": 0,
  "FailedCreationPointIds": [
    0
  ],
  "SuccessfulStreamDeletions": 0,
  "FailedStreamDeletions": 0,
  "SuccessfulAssetDeletions": 0,
  "FailedAssetDeletions": 0,
  "SuccessfulAssetCreations": 0,
  "FailedAssetCreationsAndUpdates": 0,
  "IsModified": true,
  "SuccessfulAssetUpdates": 0
}

```

---

### DataPrivacy

<a id="schemadataprivacy"></a>
<a id="schema_DataPrivacy"></a>
<a id="tocSdataprivacy"></a>
<a id="tocsdataprivacy"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Undefined|0|
|Medium|1|
|None|2|
|High|3|
|Low|4|

---

### HealthEventSummaryDto

<a id="schemahealtheventsummarydto"></a>
<a id="schema_HealthEventSummaryDto"></a>
<a id="tocShealtheventsummarydto"></a>
<a id="tocshealtheventsummarydto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|MaxSeverity|[LogLevel](#schemaloglevel)|false|false|None|
|EventId|string|false|true|None|

```json
{
  "MaxSeverity": 0,
  "EventId": "string"
}

```

---

### LogLevel

<a id="schemaloglevel"></a>
<a id="schema_LogLevel"></a>
<a id="tocSloglevel"></a>
<a id="tocsloglevel"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Trace|0|
|Debug|1|
|Information|2|
|Warning|3|
|Error|4|
|Critical|5|
|None|6|

---

### DetailedStreamCreationStatusDto

<a id="schemadetailedstreamcreationstatusdto"></a>
<a id="schema_DetailedStreamCreationStatusDto"></a>
<a id="tocSdetailedstreamcreationstatusdto"></a>
<a id="tocsdetailedstreamcreationstatusdto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TransferId|guid|false|false|None|
|Status|[SimpleTaskStatus](#schemasimpletaskstatus)|false|false|None|
|TotalPointStreamsExpected|int64|false|false|None|
|VerifiedPointStreamsCreated|int64|false|false|None|
|LastUpdateAttempt|date-time|false|false|None|
|LastSuccessfulUpdate|date-time|false|false|None|
|LastMessage|[CreationStatusType](#schemacreationstatustype)|false|false|None|

```json
{
  "TransferId": "string",
  "Status": 0,
  "TotalPointStreamsExpected": 0,
  "VerifiedPointStreamsCreated": 0,
  "LastUpdateAttempt": "2019-08-24T14:15:22Z",
  "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
  "LastMessage": 0
}

```

---

### SimpleTaskStatus

<a id="schemasimpletaskstatus"></a>
<a id="schema_SimpleTaskStatus"></a>
<a id="tocSsimpletaskstatus"></a>
<a id="tocssimpletaskstatus"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Done|0|
|Working|1|
|Failed|2|
|NotStartedYet|3|
|PIPointTypeChangeDetected|100|

---

### CreationStatusType

<a id="schemacreationstatustype"></a>
<a id="schema_CreationStatusType"></a>
<a id="tocScreationstatustype"></a>
<a id="tocscreationstatustype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Unknown|0|
|Failed|1|
|Success|2|
|PointTypeMismatch|3|

---

### HistoricalTransferProgressDto

<a id="schemahistoricaltransferprogressdto"></a>
<a id="schema_HistoricalTransferProgressDto"></a>
<a id="tocShistoricaltransferprogressdto"></a>
<a id="tocshistoricaltransferprogressdto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TransferId|guid|false|false|None|
|TotalArchives|int32|false|false|None|
|CurrentArchive|int32|false|false|None|
|TotalPointsInArchive|int32|false|false|None|
|TransferredPointsForArchive|int32|false|false|None|

```json
{
  "TransferId": "string",
  "TotalArchives": 0,
  "CurrentArchive": 0,
  "TotalPointsInArchive": 0,
  "TransferredPointsForArchive": 0
}

```

---

### AFIndexProgress

<a id="schemaafindexprogress"></a>
<a id="schema_AFIndexProgress"></a>
<a id="tocSafindexprogress"></a>
<a id="tocsafindexprogress"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|NotStarted|0|
|AFIndexInProgress|1|
|AFIndexingFailed|2|
|AFIndexingSucceeded|3|
|Restarting|4|

---

### PIPointAttributeCacheProgress

<a id="schemapipointattributecacheprogress"></a>
<a id="schema_PIPointAttributeCacheProgress"></a>
<a id="tocSpipointattributecacheprogress"></a>
<a id="tocspipointattributecacheprogress"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|NotStarted|0|
|PIPointIndexInProgress|1|
|PIPointIndexingFailed|2|
|PIPointIndexingSucceeded|3|
|Restarting|4|

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

### CapabilityState

<a id="schemacapabilitystate"></a>
<a id="schema_CapabilityState"></a>
<a id="tocScapabilitystate"></a>
<a id="tocscapabilitystate"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Enabled|boolean|false|false|None|

```json
{
  "Enabled": true
}

```

---

### Capability

<a id="schemacapability"></a>
<a id="schema_Capability"></a>
<a id="tocScapability"></a>
<a id="tocscapability"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|id|string|false|true|None|
|ver|int32|false|false|None|
|en|boolean|false|false|None|

```json
{
  "id": "string",
  "ver": 0,
  "en": true
}

```

---

### AgentResourceDto

<a id="schemaagentresourcedto"></a>
<a id="schema_AgentResourceDto"></a>
<a id="tocSagentresourcedto"></a>
<a id="tocsagentresourcedto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|ResourceType|[AgentResourceType](#schemaagentresourcetype)|false|false|None|
|Name|string|false|true|None|
|Available|boolean|false|false|None|

```json
{
  "ResourceType": 0,
  "Name": "string",
  "Available": true
}

```

---

### AgentResourceType

<a id="schemaagentresourcetype"></a>
<a id="schema_AgentResourceType"></a>
<a id="tocSagentresourcetype"></a>
<a id="tocsagentresourcetype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|SdsTypes|0|
|StreamsCloudBlobContainer|1|
|AssetsCloudBlobContainer|2|
|AssetsEventHubResources|3|
|StreamsEventHubResources|4|
|StreamsService|5|
|AssetsService|6|
|DataService|7|

---

