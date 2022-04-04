---
uid: pi-to-ocs-data-sources

---

# Data Sources

## `List Data Sources`

<a id="opIdDataSources_List Data Sources"></a>

Get all `DataSourceDto` objects associated with the specified `namespaceId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataSourceDto](#schemadatasourcedto)[]|The requested collection of `DataSourceDto` objects.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([DataSourceDto](#schemadatasourcedto)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "TenantId": "string",
    "OcsNamespace": "string",
    "Agent": {
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
              "StreamingEventCountPerSecond": null,
              "HistoricalEventCountPerSecond": null,
              "SuccessfulCreations": null,
              "FailedCreations": null,
              "SuccessfulStreamEdits": null,
              "FailedStreamEdits": null,
              "PointEdits": null,
              "TotalPoints": null,
              "AssetsCreatedPerSecond": null,
              "AssetsProcessedCount": null,
              "TotalAssetsInTransfer": null,
              "FailedCreationPointIds": null,
              "SuccessfulStreamDeletions": null,
              "FailedStreamDeletions": null,
              "SuccessfulAssetDeletions": null,
              "FailedAssetDeletions": null,
              "SuccessfulAssetCreations": null,
              "FailedAssetCreationsAndUpdates": null
            },
            "Name": "string",
            "MetadataPrivacy": 0,
            "TransferRevisionNumber": 0,
            "LastEditDate": "2019-08-24T14:15:22Z",
            "LastEditBy": "string",
            "AutoDeleteCloudObjects": true,
            "TotalPointsInTransfer": 0,
            "PIPointsWithHealthEvents": {
              "property1": 0,
              "property2": 0
            },
            "AFElementsWithHealthEvents": {
              "property1": 0,
              "property2": 0
            },
            "StreamCreationStatus": {
              "TransferId": null,
              "Status": null,
              "TotalPointStreamsExpected": null,
              "VerifiedPointStreamsCreated": null,
              "LastUpdateAttempt": null,
              "LastSuccessfulUpdate": null,
              "LastMessage": null
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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      }
    }
  }
]
```

---

## `Create Data Source`

<a id="opIdDataSources_Create Data Source"></a>

Creates a new `DataSourceDto`

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The DataSourceCreateUpdateDto to use when creating the DataSource.<br/>

```json
{
  "Name": "string",
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[DataSourceDto](#schemadatasourcedto)|A `DataSourceDto` object corresponding to the newly created DataSource|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 201 Response ([DataSourceDto](#schemadatasourcedto))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TenantId": "string",
  "OcsNamespace": "string",
  "Agent": {
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
            "TotalPoints": 0,
            "AssetsCreatedPerSecond": 0,
            "AssetsProcessedCount": 0,
            "TotalAssetsInTransfer": 0,
            "FailedCreationPointIds": [
              null
            ],
            "SuccessfulStreamDeletions": 0,
            "FailedStreamDeletions": 0,
            "SuccessfulAssetDeletions": 0,
            "FailedAssetDeletions": 0,
            "SuccessfulAssetCreations": 0,
            "FailedAssetCreationsAndUpdates": 0
          },
          "Name": "string",
          "MetadataPrivacy": 0,
          "TransferRevisionNumber": 0,
          "LastEditDate": "2019-08-24T14:15:22Z",
          "LastEditBy": "string",
          "AutoDeleteCloudObjects": true,
          "TotalPointsInTransfer": 0,
          "PIPointsWithHealthEvents": {
            "property1": 0,
            "property2": 0
          },
          "AFElementsWithHealthEvents": {
            "property1": 0,
            "property2": 0
          },
          "StreamCreationStatus": {
            "TransferId": "string",
            "Status": "[",
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": "["
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
      "TotalPoints": 0,
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
      "FailedAssetCreationsAndUpdates": 0
    }
  }
}
```

---

## `Get Data Source`

<a id="opIdDataSources_Get Data Source"></a>

Get the `DataSourceDto` object specified by the `dataSourceId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the requested DataSource.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataSourceDto](#schemadatasourcedto)|The requested `DataSourceDto`.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([DataSourceDto](#schemadatasourcedto))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TenantId": "string",
  "OcsNamespace": "string",
  "Agent": {
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
            "TotalPoints": 0,
            "AssetsCreatedPerSecond": 0,
            "AssetsProcessedCount": 0,
            "TotalAssetsInTransfer": 0,
            "FailedCreationPointIds": [
              null
            ],
            "SuccessfulStreamDeletions": 0,
            "FailedStreamDeletions": 0,
            "SuccessfulAssetDeletions": 0,
            "FailedAssetDeletions": 0,
            "SuccessfulAssetCreations": 0,
            "FailedAssetCreationsAndUpdates": 0
          },
          "Name": "string",
          "MetadataPrivacy": 0,
          "TransferRevisionNumber": 0,
          "LastEditDate": "2019-08-24T14:15:22Z",
          "LastEditBy": "string",
          "AutoDeleteCloudObjects": true,
          "TotalPointsInTransfer": 0,
          "PIPointsWithHealthEvents": {
            "property1": 0,
            "property2": 0
          },
          "AFElementsWithHealthEvents": {
            "property1": 0,
            "property2": 0
          },
          "StreamCreationStatus": {
            "TransferId": "string",
            "Status": "[",
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": "["
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
      "TotalPoints": 0,
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
      "FailedAssetCreationsAndUpdates": 0
    }
  }
}
```

---

## `Update Data Source`

<a id="opIdDataSources_Update Data Source"></a>

Replace an existing DataSource specified by the `dataSourceId`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource to replace.<br/><br/>

<h4>Request Body</h4>

The new property values that will be set on the DataSource.<br/>

```json
{
  "Name": "string",
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataSourceDto](#schemadatasourcedto)|A `DataSourceDto` representing the replacement DataSource object.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([DataSourceDto](#schemadatasourcedto))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TenantId": "string",
  "OcsNamespace": "string",
  "Agent": {
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
            "TotalPoints": 0,
            "AssetsCreatedPerSecond": 0,
            "AssetsProcessedCount": 0,
            "TotalAssetsInTransfer": 0,
            "FailedCreationPointIds": [
              null
            ],
            "SuccessfulStreamDeletions": 0,
            "FailedStreamDeletions": 0,
            "SuccessfulAssetDeletions": 0,
            "FailedAssetDeletions": 0,
            "SuccessfulAssetCreations": 0,
            "FailedAssetCreationsAndUpdates": 0
          },
          "Name": "string",
          "MetadataPrivacy": 0,
          "TransferRevisionNumber": 0,
          "LastEditDate": "2019-08-24T14:15:22Z",
          "LastEditBy": "string",
          "AutoDeleteCloudObjects": true,
          "TotalPointsInTransfer": 0,
          "PIPointsWithHealthEvents": {
            "property1": 0,
            "property2": 0
          },
          "AFElementsWithHealthEvents": {
            "property1": 0,
            "property2": 0
          },
          "StreamCreationStatus": {
            "TransferId": "string",
            "Status": "[",
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": "["
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
      "TotalPoints": 0,
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
      "FailedAssetCreationsAndUpdates": 0
    }
  }
}
```

---

## `Delete Data Source`

<a id="opIdDataSources_Delete Data Source"></a>

Delete a DataSource specified by the `dataSourceId`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource to be deleted.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The DataSource was deleted.|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `List All Namespace PISystems`

<a id="opIdDataSources_List All Namespace PISystems"></a>

Get All `PISystemDto` objects in the specified `namespaceId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/PISystems
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PISystemDto](#schemapisystemdto)[]|The requested collection of `PISystemDto`.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PISystemDto](#schemapisystemdto)[])

```json
[
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
          "TotalPoints": 0,
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
          "FailedAssetCreationsAndUpdates": 0
        },
        "Name": "string",
        "MetadataPrivacy": 0,
        "TransferRevisionNumber": 0,
        "LastEditDate": "2019-08-24T14:15:22Z",
        "LastEditBy": "string",
        "AutoDeleteCloudObjects": true,
        "TotalPointsInTransfer": 0,
        "PIPointsWithHealthEvents": {
          "property1": 0,
          "property2": 0
        },
        "AFElementsWithHealthEvents": {
          "property1": 0,
          "property2": 0
        },
        "StreamCreationStatus": {
          "TransferId": "string",
          "Status": 0,
          "TotalPointStreamsExpected": 0,
          "VerifiedPointStreamsCreated": 0,
          "LastUpdateAttempt": "2019-08-24T14:15:22Z",
          "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
          "LastMessage": 0
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
]
```

---

## `List Data Privacy Agents Information`

<a id="opIdDataSources_List Data Privacy Agents Information"></a>

Get the agent information for each of the data sources retrieved.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/DataPrivacyAgentsInformation
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[DataPrivacyAgentsInformationDto](#schemadataprivacyagentsinformationdto)[]|The requested collection of agent information for `DataSourceDto` objects.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([DataPrivacyAgentsInformationDto](#schemadataprivacyagentsinformationdto)[])

```json
[
  {
    "AgentVersion": "string",
    "Namespace": "string",
    "TenantId": "string",
    "AgentLastCommTime": "2019-08-24T14:15:22Z",
    "IsDeprecated": true,
    "DataArchiveVersion": "string",
    "AFVersion": "string",
    "TransferExists": true,
    "TransferLatestStreamRead": "2019-08-24T14:15:22Z",
    "TransferStatus": "string",
    "TransferLastEditDate": "2019-08-24T14:15:22Z"
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Agent`

<a id="opIdDataSources_Get Agent"></a>

Get the `AgentDto` object specified by the `agentId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the requested DataSource.<br/><br/>`string agentId`
<br/>The Id of the requested Agent.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AgentDto](#schemaagentdto)|The requested `AgentDto`.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([AgentDto](#schemaagentdto))

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
          "TotalPoints": 0,
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
          "FailedAssetCreationsAndUpdates": 0
        },
        "Name": "string",
        "MetadataPrivacy": 0,
        "TransferRevisionNumber": 0,
        "LastEditDate": "2019-08-24T14:15:22Z",
        "LastEditBy": "string",
        "AutoDeleteCloudObjects": true,
        "TotalPointsInTransfer": 0,
        "PIPointsWithHealthEvents": {
          "property1": 0,
          "property2": 0
        },
        "AFElementsWithHealthEvents": {
          "property1": 0,
          "property2": 0
        },
        "StreamCreationStatus": {
          "TransferId": "string",
          "Status": 0,
          "TotalPointStreamsExpected": 0,
          "VerifiedPointStreamsCreated": 0,
          "LastUpdateAttempt": "2019-08-24T14:15:22Z",
          "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
          "LastMessage": 0
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
    "TotalPoints": 0,
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
    "FailedAssetCreationsAndUpdates": 0
  }
}
```

---

## `Delete Agent`

<a id="opIdDataSources_Delete Agent"></a>

Delete the Agent specified by `agentId`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent to be deleted.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The Agent was deleted.|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `List PISystems`

<a id="opIdDataSources_List PISystems"></a>

Get All `PISystemDto` objects in the `agentId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/PISystems
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PISystemDto](#schemapisystemdto)[]|The requested collection of `PISystemDto`.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PISystemDto](#schemapisystemdto)[])

```json
[
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
          "TotalPoints": 0,
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
          "FailedAssetCreationsAndUpdates": 0
        },
        "Name": "string",
        "MetadataPrivacy": 0,
        "TransferRevisionNumber": 0,
        "LastEditDate": "2019-08-24T14:15:22Z",
        "LastEditBy": "string",
        "AutoDeleteCloudObjects": true,
        "TotalPointsInTransfer": 0,
        "PIPointsWithHealthEvents": {
          "property1": 0,
          "property2": 0
        },
        "AFElementsWithHealthEvents": {
          "property1": 0,
          "property2": 0
        },
        "StreamCreationStatus": {
          "TransferId": "string",
          "Status": 0,
          "TotalPointStreamsExpected": 0,
          "VerifiedPointStreamsCreated": 0,
          "LastUpdateAttempt": "2019-08-24T14:15:22Z",
          "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
          "LastMessage": 0
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
]
```

---

## `Update PISystem`

<a id="opIdDataSources_Update PISystem"></a>

Update an existing PiSystem.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/PISystems
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>

<h4>Request Body</h4>

The PiSystem properties to update.<br/>

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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "AFElementsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
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

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PISystemDto](#schemapisystemdto)|A `PISystemDto` object representing the PiSystem that was updated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PISystemDto](#schemapisystemdto))

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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "AFElementsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
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

## `Get PISystem`

<a id="opIdDataSources_Get PISystem"></a>

Get the `PISystemDto` object specified by the `piSystemId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/PISystems/{piSystemId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>`string piSystemId`
<br/>PI System ID<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PISystemDto](#schemapisystemdto)|The requested `PISystemDto`.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PISystemDto](#schemapisystemdto))

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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "AFElementsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
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

## `Get Status`

<a id="opIdDataSources_Get Status"></a>

Retrieves the `AgentStatusDto` object specified by the `agentId`

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/status
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AgentStatusDto](#schemaagentstatusdto)|The `AgentStatusDto` of the specified `agentId`.|
|401|None|Unauthorized.|
|404|None|Client or tenant not found.|

<h4>Example response body</h4>

> 200 Response ([AgentStatusDto](#schemaagentstatusdto))

```json
{
  "Agent": {
    "HealthStatus": 0,
    "InternalStatuses": [
      "string"
    ],
    "HealthEventsSeverity": 0
  },
  "AFIndexing": {
    "HealthStatus": 0,
    "InternalStatuses": [
      "string"
    ],
    "HealthEventsSeverity": 0
  },
  "PIPointIndexing": {
    "HealthStatus": 0,
    "InternalStatuses": [
      "string"
    ],
    "HealthEventsSeverity": 0
  },
  "Transfers": {
    "property1": {
      "HealthStatus": 0,
      "InternalStatuses": [
        "string"
      ],
      "HealthEventsSeverity": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string"
    },
    "property2": {
      "HealthStatus": 0,
      "InternalStatuses": [
        "string"
      ],
      "HealthEventsSeverity": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string"
    }
  }
}
```

---

## `List Health Events`

<a id="opIdDataSources_List Health Events"></a>

Retrieves all of the `HealthEventDto` associated with an agent specified by `agentId`

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/status/events
?healthEventCategory={healthEventCategory}&pointId={pointId}&elementId={elementId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>
`[optional] any healthEventCategory`
<br/>Health event category to filter by<br/><br/>`[optional] integer pointId`
<br/>Point ID to filter by<br/><br/>`[optional] string elementId`
<br/>Element ID to filter by<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[HealthEventDto](#schemahealtheventdto)[]|The collection of `HealthEventDto` associated with the specified `agentId`.|
|401|None|Unauthorized.|

<h4>Example response body</h4>

> 200 Response ([HealthEventDto](#schemahealtheventdto)[])

```json
[
  {
    "Id": "string",
    "TimestampUtc": "2019-08-24T14:15:22Z",
    "Category": 0,
    "TransferId": "string",
    "EventId": 400001,
    "Severity": 0,
    "Message": "string",
    "PointId": 0,
    "ElementId": "string"
  }
]
```

---

## `Add Health Event`

<a id="opIdDataSources_Add Health Event"></a>

Add a health event to the specified `agentId`.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/status/events
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>

<h4>Request Body</h4>

Health Event to record<br/>

```json
{
  "Category": 0,
  "TransferId": "string",
  "EventId": 400001,
  "Severity": 0,
  "Message": "string",
  "PointId": 0,
  "ElementId": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|None|Created.|
|404|None|Client or tenant not found.|
|422|None|Unprocessable Entity; invalid `HealthEventDto` in request body|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Remove Health Events`

<a id="opIdDataSources_Remove Health Events"></a>

Removes all health events associated with an agent

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/status/events
?transfer={transfer}&category={category}&eventId={eventId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>`string transfer`
<br/>Optional. If provided, will only delete health events with this Transfer ID.<br/><br/>`any category`
<br/>Optional. If provided, will only delete health events with this category.<br/><br/>`any eventId`
<br/>Optional. If provided, will only delete health events with this eventId.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Deleted.|
|401|None|Unauthorized.|

---

## `Get Health Event`

<a id="opIdDataSources_Get Health Event"></a>

Retrieves the `HealthEventDto` specified by the `healthEventId`

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/status/events/{healthEventId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>`string healthEventId`
<br/>Unique identifier for a Health Event<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[HealthEventDto](#schemahealtheventdto)|The `HealthEventDto` specified by `healthEventId`.|
|401|None|Unauthorized.|
|404|None|Client or tenant not found.|

<h4>Example response body</h4>

> 200 Response ([HealthEventDto](#schemahealtheventdto))

```json
{
  "Id": "string",
  "TimestampUtc": "2019-08-24T14:15:22Z",
  "Category": 0,
  "TransferId": "string",
  "EventId": 400001,
  "Severity": 0,
  "Message": "string",
  "PointId": 0,
  "ElementId": "string"
}
```

---

## `Remove Health Event`

<a id="opIdDataSources_Remove Health Event"></a>

Removes a health event associated with an agent

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/status/events/{healthEventId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>`string healthEventId`
<br/>Unique identifier for a Health Event<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Deleted.|
|401|None|Unauthorized.|

---

## `Get Transfer Metrics`

<a id="opIdDataSources_Get Transfer Metrics"></a>

Get Transfer Metrics from the Management Service

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers/metrics
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string DataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>The Id of the requested Agent.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[TransferMetricsDto](#schematransfermetricsdto)|Success.|
|400|None|Missing or invalid inputs.|
|500|None|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([TransferMetricsDto](#schematransfermetricsdto))

```json
{
  "StreamingEventCountPerSecond": 0,
  "HistoricalEventCountPerSecond": 0,
  "SuccessfulCreations": 0,
  "FailedCreations": 0,
  "SuccessfulStreamEdits": 0,
  "FailedStreamEdits": 0,
  "PointEdits": 0,
  "TotalPoints": 0,
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
  "FailedAssetCreationsAndUpdates": 0
}
```

---

## `List Transfers`

<a id="opIdDataSources_List Transfers"></a>

Get the list of `TransferDto` objects associated with the `agentId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[TransferDto](#schematransferdto)[]|A collection of `TransferDto` objects.|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([TransferDto](#schematransferdto)[])

```json
[
  {
    "Id": "string",
    "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
    "Description": "string",
    "Status": 0,
    "PreviousHistoricChunkStart": "2019-08-24T14:15:22Z",
    "CurrentHistoricChunkStart": "2019-08-24T14:15:22Z",
    "LatestStreamingRead": "2019-08-24T14:15:22Z",
    "HistoricalDataEndTime": "2019-08-24T14:15:22Z",
    "TransferredElementsCount": 0,
    "AssetsCreatedCount": 0,
    "AssetsUpdatedCount": 0,
    "AssetsFailedCount": 0,
    "OnPremTransferStatus": 0,
    "DesiredStatus": 0,
    "PIPointIds": [
      0
    ],
    "AFElementIds": [
      "string"
    ],
    "PIPointsReferencedByAF": [
      0
    ],
    "PIPointsWithHealthEvents": {
      "property1": 0,
      "property2": 0
    },
    "AFElementsWithHealthEvents": {
      "property1": 0,
      "property2": 0
    },
    "Name": "string",
    "MetadataPrivacy": 0,
    "TransferRevisionNumber": 0,
    "LastEditDate": "2019-08-24T14:15:22Z",
    "LastEditBy": "string",
    "PointEdits": 0,
    "AutoDeleteCloudObjects": true,
    "TotalPointsInTransfer": 0,
    "StreamCreationStatus": {
      "TransferId": "string",
      "Status": 0,
      "TotalPointStreamsExpected": 0,
      "VerifiedPointStreamsCreated": 0,
      "LastUpdateAttempt": "2019-08-24T14:15:22Z",
      "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
      "LastMessage": 0
    }
  }
]
```

---

## `Create Transfer`

<a id="opIdDataSources_Create Transfer"></a>

Creates a new Transfer.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>

<h4>Request Body</h4>

Properties of the Transfer to create.<br/>

```json
{
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "Description": "string",
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "Name": "string",
  "MetadataPrivacy": 0,
  "TotalPointsInTransfer": 0,
  "AutoDeleteCloudObjects": true
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[TransferDto](#schematransferdto)|A `TransferDto` object representing to the newly created transfer.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 201 Response ([TransferDto](#schematransferdto))

```json
{
  "Id": "string",
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Status": 0,
  "PreviousHistoricChunkStart": "2019-08-24T14:15:22Z",
  "CurrentHistoricChunkStart": "2019-08-24T14:15:22Z",
  "LatestStreamingRead": "2019-08-24T14:15:22Z",
  "HistoricalDataEndTime": "2019-08-24T14:15:22Z",
  "TransferredElementsCount": 0,
  "AssetsCreatedCount": 0,
  "AssetsUpdatedCount": 0,
  "AssetsFailedCount": 0,
  "OnPremTransferStatus": 0,
  "DesiredStatus": 0,
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "PIPointsReferencedByAF": [
    0
  ],
  "PIPointsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "AFElementsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
  "PointEdits": 0,
  "AutoDeleteCloudObjects": true,
  "TotalPointsInTransfer": 0,
  "StreamCreationStatus": {
    "TransferId": "string",
    "Status": 0,
    "TotalPointStreamsExpected": 0,
    "VerifiedPointStreamsCreated": 0,
    "LastUpdateAttempt": "2019-08-24T14:15:22Z",
    "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
    "LastMessage": 0
  }
}
```

---

## `List Transfer Stream Ids`

<a id="opIdDataSources_List Transfer Stream Ids"></a>

Gets a List of Stream Ids associated with the transfer specified by `transferId`. This endpoint will return the Stream Ids before they are guaranteed to be created by the Agent.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers/{transferId}/streams
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the dataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent the transfer belongs to.<br/><br/>`string transferId`
<br/>The Id of the Transfer that the Stream Ids belong to.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|The requested string collection.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `List Queries`

<a id="opIdDataSources_List Queries"></a>

Get all `QueryDto` objects associated with the Agent specified by `agentId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/queries
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent the Query collection belongs to.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[QueryDto](#schemaquerydto)[]|A collection of `QueryDto` objects.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([QueryDto](#schemaquerydto)[])

```json
[
  {
    "Id": "string",
    "QueryType": 0,
    "PI": {
      "PointMasks": {
        "property1": "string",
        "property2": "string"
      },
      "PointIds": [
        0
      ],
      "PointList": {
        "MetadataPrivacy": 0,
        "PointIds": [
          0
        ]
      }
    },
    "AF": {
      "HierarchyMasks": {
        "property1": "string",
        "property2": "string"
      },
      "ElementSearchByAttributeMasks": {
        "property1": "string",
        "property2": "string"
      },
      "ObjectIds": [
        "string"
      ]
    },
    "Status": 1,
    "Skip": 0,
    "Count": 0
  }
]
```

---

## `Create Query`

<a id="opIdDataSources_Create Query"></a>

Creates a new Query.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/queries
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>

<h4>Request Body</h4>

The Query to create.<br/>

```json
{
  "QueryType": 0,
  "PI": {
    "PointMasks": {
      "property1": "string",
      "property2": "string"
    },
    "PointIds": [
      0
    ],
    "PointList": {
      "MetadataPrivacy": 0,
      "PointIds": [
        0
      ]
    }
  },
  "AF": {
    "HierarchyMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ElementSearchByAttributeMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ObjectIds": [
      "string"
    ]
  },
  "Skip": 2147483647,
  "Count": 2147483647
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[QueryDto](#schemaquerydto)|A `QueryDto` object representing the newly created Query object.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 201 Response ([QueryDto](#schemaquerydto))

```json
{
  "Id": "string",
  "QueryType": 0,
  "PI": {
    "PointMasks": {
      "property1": "string",
      "property2": "string"
    },
    "PointIds": [
      0
    ],
    "PointList": {
      "MetadataPrivacy": 0,
      "PointIds": [
        0
      ]
    }
  },
  "AF": {
    "HierarchyMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ElementSearchByAttributeMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ObjectIds": [
      "string"
    ]
  },
  "Status": 1,
  "Skip": 0,
  "Count": 0
}
```

---

## `Get Query`

<a id="opIdDataSources_Get Query"></a>

Get `QueryDto` object specified by `queryId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/queries/{queryId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent the Query collection belongs to.<br/><br/>`string queryId`
<br/>The Id of the query.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[QueryDto](#schemaquerydto)|A `QueryDto` object.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([QueryDto](#schemaquerydto))

```json
{
  "Id": "string",
  "QueryType": 0,
  "PI": {
    "PointMasks": {
      "property1": "string",
      "property2": "string"
    },
    "PointIds": [
      0
    ],
    "PointList": {
      "MetadataPrivacy": 0,
      "PointIds": [
        0
      ]
    }
  },
  "AF": {
    "HierarchyMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ElementSearchByAttributeMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ObjectIds": [
      "string"
    ]
  },
  "Status": 1,
  "Skip": 0,
  "Count": 0
}
```

---

## `Update Query Paging Info`

<a id="opIdDataSources_Update Query Paging Info"></a>

Update a Query.

<h3>Request</h3>

```text 
PATCH /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/queries/{queryId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string queryId`
<br/>The Id of the Query to update.<br/><br/>

<h4>Request Body</h4>

The operations to update the Query.<br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[QueryDto](#schemaquerydto)|The updated Query was accepted.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([QueryDto](#schemaquerydto))

```json
{
  "Id": "string",
  "QueryType": 0,
  "PI": {
    "PointMasks": {
      "property1": "string",
      "property2": "string"
    },
    "PointIds": [
      0
    ],
    "PointList": {
      "MetadataPrivacy": 0,
      "PointIds": [
        0
      ]
    }
  },
  "AF": {
    "HierarchyMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ElementSearchByAttributeMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ObjectIds": [
      "string"
    ]
  },
  "Status": 1,
  "Skip": 0,
  "Count": 0
}
```

---

## `Delete Query`

<a id="opIdDataSources_Delete Query"></a>

Delete the Query specified by the `queryId`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/queries/{queryId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string queryId`
<br/>The Id of the Query to be deleted.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The Query was deleted.|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `List PIPoint Queries`

<a id="opIdDataSources_List PIPoint Queries"></a>

Get all `PIPointQueryDto` objects associated with the Agent specified by `agentId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/piPointQueries
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent the PIPointQuery collection belongs to.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PIPointQueryDto](#schemapipointquerydto)[]|A collection of `PIPointQueryDto` objects.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PIPointQueryDto](#schemapipointquerydto)[])

```json
[
  {
    "Id": "string",
    "PointNameMask": "string",
    "PointSourceMask": "string",
    "Status": 0
  }
]
```

---

## `Create PIPoint Query`

<a id="opIdDataSources_Create PIPoint Query"></a>

Creates a new PIPointQuery.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/piPointQueries
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>

<h4>Request Body</h4>

The PIPointQuery to create.<br/>

```json
{
  "PointNameMask": "string",
  "PointSourceMask": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[PIPointQueryDto](#schemapipointquerydto)|A `PIPointQueryDto` representing the newly created PIPointQuery.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 201 Response ([PIPointQueryDto](#schemapipointquerydto))

```json
{
  "Id": "string",
  "PointNameMask": "string",
  "PointSourceMask": "string",
  "Status": 0
}
```

---

## `Get PIPoint Query`

<a id="opIdDataSources_Get PIPoint Query"></a>

Get `PIPointQueryDto` object specified by `piPointQueryId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/piPointQueries/{piPointQueryId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent the Query collection belongs to.<br/><br/>`string piPointQueryId`
<br/>The Id of the query.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PIPointQueryDto](#schemapipointquerydto)|A `PIPointQueryDto` object.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PIPointQueryDto](#schemapipointquerydto))

```json
{
  "Id": "string",
  "PointNameMask": "string",
  "PointSourceMask": "string",
  "Status": 0
}
```

---

## `Delete PIPoint Query`

<a id="opIdDataSources_Delete PIPoint Query"></a>

Delete a PIPointQuery specified by the `piPointQueryId`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/piPointQueries/{piPointQueryId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string piPointQueryId`
<br/>The Id of the PIPointQuery to be deleted.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The PIPointQuery was deleted.|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `Get Query Result`

<a id="opIdDataSources_Get Query Result"></a>

Get the `QueryResultPageDto` associated with the query specified by `queryId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/queries/{queryId}/result
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent associated with the resource.<br/><br/>`string queryId`
<br/>The Id of the query.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[QueryResultPageDto](#schemaqueryresultpagedto)|The requested `QueryResultPageDto`.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([QueryResultPageDto](#schemaqueryresultpagedto))

```json
{
  "Results": [
    null
  ],
  "AdditionalInformation": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Query Status`

<a id="opIdDataSources_Get Query Status"></a>

Get the `QueryStatusDto` associated with the query specified by `queryId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/queries/{queryId}/status
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent associated with the resource.<br/><br/>`string queryId`
<br/>The Id of the query.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[QueryStatusDto](#schemaquerystatusdto)|The requested `QueryStatusDto`.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([QueryStatusDto](#schemaquerystatusdto))

```json
{
  "Id": "string",
  "Status": 1,
  "QueryType": 0,
  "Skip": 0,
  "Count": 0,
  "TotalCount": 0,
  "QueryFailureReason": "string",
  "MissingAttributePointValues": "string"
}
```

---

## `Get PIPoint Query Result`

<a id="opIdDataSources_Get PIPoint Query Result"></a>

Get the `PIPointQueryResultDto` associated with the query specified by `piPointQueryId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/piPointQueries/{piPointQueryId}/result
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent associated with the resource.<br/><br/>`string piPointQueryId`
<br/>The Id of the PIPointQuery.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PIPointQueryResultDto](#schemapipointqueryresultdto)|The requested `PIPointQueryResultDto`.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PIPointQueryResultDto](#schemapipointqueryresultdto))

```json
{
  "ResultPIPointsAttributes": [
    {
      "PointId": 0,
      "Name": "string",
      "PointSource": "string",
      "Description": "string",
      "EngineeringUnits": "string"
    }
  ]
}
```

---

## `List Capabilities For Agent`

<a id="opIdDataSources_List Capabilities For Agent"></a>

Get all `Capability` objects associated with the Agent specified by `agentId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/capabilities
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource associated with the resource.<br/><br/>`string agentId`
<br/>The Id of the Agent the Capability collection belongs to.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Capability](#schemacapability)[]|Success: returns a collection of `Capability` objects.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([Capability](#schemacapability)[])

```json
[
  {
    "id": "string",
    "ver": 0,
    "en": true
  }
]
```

---

## `Update Transfer`

<a id="opIdDataSources_Update Transfer"></a>

Update Transfer specified by the `transferId`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers/{transferId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string transferId`
<br/>The Id of the Transfer to be replaced.<br/><br/>

<h4>Request Body</h4>

The Transfer properties to update.<br/>

```json
{
  "Description": "string",
  "Name": "string",
  "MetadataPrivacy": 0,
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "ExpectedTransferRevisionNumber": 0,
  "AutoDeleteCloudObjects": true
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[TransferDto](#schematransferdto)|A `TransferDto` object representing the Transfer that was replaced.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([TransferDto](#schematransferdto))

```json
{
  "Id": "string",
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Status": 0,
  "PreviousHistoricChunkStart": "2019-08-24T14:15:22Z",
  "CurrentHistoricChunkStart": "2019-08-24T14:15:22Z",
  "LatestStreamingRead": "2019-08-24T14:15:22Z",
  "HistoricalDataEndTime": "2019-08-24T14:15:22Z",
  "TransferredElementsCount": 0,
  "AssetsCreatedCount": 0,
  "AssetsUpdatedCount": 0,
  "AssetsFailedCount": 0,
  "OnPremTransferStatus": 0,
  "DesiredStatus": 0,
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "PIPointsReferencedByAF": [
    0
  ],
  "PIPointsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "AFElementsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
  "PointEdits": 0,
  "AutoDeleteCloudObjects": true,
  "TotalPointsInTransfer": 0,
  "StreamCreationStatus": {
    "TransferId": "string",
    "Status": 0,
    "TotalPointStreamsExpected": 0,
    "VerifiedPointStreamsCreated": 0,
    "LastUpdateAttempt": "2019-08-24T14:15:22Z",
    "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
    "LastMessage": 0
  }
}
```

---

## `Delete Transfer`

<a id="opIdDataSources_Delete Transfer"></a>

Delete the Transfer specified by the `transferId`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers/{transferId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string transferId`
<br/>The Id of the Transfer to be deleted.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The Transfer was deleted.|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `Update Transfer Status`

<a id="opIdDataSources_Update Transfer Status"></a>

Update desired status of the `transferId`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers/{transferId}/status
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string transferId`
<br/>The Id of the Transfer to be replaced.<br/><br/>

<h4>Request Body</h4>

The Transfer status to be changed to.<br/>

```json
{
  "DesiredStatus": 0
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[TransferDto](#schematransferdto)|A `TransferDto` object representing the Transfer that was updated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([TransferDto](#schematransferdto))

```json
{
  "Id": "string",
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Status": 0,
  "PreviousHistoricChunkStart": "2019-08-24T14:15:22Z",
  "CurrentHistoricChunkStart": "2019-08-24T14:15:22Z",
  "LatestStreamingRead": "2019-08-24T14:15:22Z",
  "HistoricalDataEndTime": "2019-08-24T14:15:22Z",
  "TransferredElementsCount": 0,
  "AssetsCreatedCount": 0,
  "AssetsUpdatedCount": 0,
  "AssetsFailedCount": 0,
  "OnPremTransferStatus": 0,
  "DesiredStatus": 0,
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "PIPointsReferencedByAF": [
    0
  ],
  "PIPointsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "AFElementsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
  "PointEdits": 0,
  "AutoDeleteCloudObjects": true,
  "TotalPointsInTransfer": 0,
  "StreamCreationStatus": {
    "TransferId": "string",
    "Status": 0,
    "TotalPointStreamsExpected": 0,
    "VerifiedPointStreamsCreated": 0,
    "LastUpdateAttempt": "2019-08-24T14:15:22Z",
    "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
    "LastMessage": 0
  }
}
```

---

## `Update AF Index Progress`

<a id="opIdDataSources_Update AF Index Progress"></a>

Update an existing AF Index Progress information for the PISystem.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/PISystems/indexprogress
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>

<h4>Request Body</h4>

The PiSystem properties to update.<br/>

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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "AFElementsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
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

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PISystemDto](#schemapisystemdto)|A `PISystemDto` object representing the PiSystem that was updated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PISystemDto](#schemapisystemdto))

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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "AFElementsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
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

## `Update PIPoint Cache Progress`

<a id="opIdDataSources_Update PIPoint Cache Progress"></a>

Update an existing PI Point Cache Progress information for the PISystem.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/pisystems/pipointcacheprogress
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>

<h4>Request Body</h4>

The PiSystem properties to update.<br/>

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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "AFElementsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
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

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PISystemDto](#schemapisystemdto)|A `PISystemDto` object representing the PiSystem that was updated.|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([PISystemDto](#schemapisystemdto))

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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "AFElementsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
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

## `Set PIPoints Referenced By AF`

<a id="opIdDataSources_Set PIPoints Referenced By AF"></a>

Assign PI points referenced by AF to the Transfer specified by `transferId`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers/{transferId}/pointsFromAF
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string transferId`
<br/>The Id of the Transfer to be updated.<br/><br/>

<h4>Request Body</h4>

The updated set of points referenced by AF.<br/>

```json
[
  0
]
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[TransferDto](#schematransferdto)|Success: returns a `TransferDto` object representing the updated Transfer.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([TransferDto](#schematransferdto))

```json
{
  "Id": "string",
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Status": 0,
  "PreviousHistoricChunkStart": "2019-08-24T14:15:22Z",
  "CurrentHistoricChunkStart": "2019-08-24T14:15:22Z",
  "LatestStreamingRead": "2019-08-24T14:15:22Z",
  "HistoricalDataEndTime": "2019-08-24T14:15:22Z",
  "TransferredElementsCount": 0,
  "AssetsCreatedCount": 0,
  "AssetsUpdatedCount": 0,
  "AssetsFailedCount": 0,
  "OnPremTransferStatus": 0,
  "DesiredStatus": 0,
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "PIPointsReferencedByAF": [
    0
  ],
  "PIPointsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "AFElementsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
  "PointEdits": 0,
  "AutoDeleteCloudObjects": true,
  "TotalPointsInTransfer": 0,
  "StreamCreationStatus": {
    "TransferId": "string",
    "Status": 0,
    "TotalPointStreamsExpected": 0,
    "VerifiedPointStreamsCreated": 0,
    "LastUpdateAttempt": "2019-08-24T14:15:22Z",
    "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
    "LastMessage": 0
  }
}
```

---

## `Delete PISystem`

<a id="opIdDataSources_Delete PISystem"></a>

Delete the PI System specified by `piSystemName`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/PISystems/{piSystemName}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the requested DataSource.<br/><br/>`string agentId`
<br/>The Id of the requested Agent.<br/><br/>`string piSystemName`
<br/>The name of the requested PI System<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The PI System was deleted.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `Delete PISystem By Server Id`

<a id="opIdDataSources_Delete PISystem By Server Id"></a>

Delete the PI System associated with the `piServerId`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/PISystems/PIServer/{piServerId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the requested DataSource.<br/><br/>`string agentId`
<br/>The Id of the requested Agent.<br/><br/>`string piServerId`
<br/>The id of the requested PI server<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The PI System was deleted.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `Agent AF Re Index`

<a id="opIdDataSources_Agent AF Re Index"></a>

Initiates AF reindexing of the Agent specified by `agentId`.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/reindexaf
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `Agent PIRe Index`

<a id="opIdDataSources_Agent PIRe Index"></a>

Initiates PI reindexing of the Agent specified by `agentId`.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/reindexpi
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success|
|401|None|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---
## Definitions

### DataSourceDto

<a id="schemadatasourcedto"></a>
<a id="schema_DataSourceDto"></a>
<a id="tocSdatasourcedto"></a>
<a id="tocsdatasourcedto"></a>

Data Transfer Object for a Data Source.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|TenantId|guid|false|false|None|
|OcsNamespace|string|false|true|None|
|Agent|[AgentDto](#schemaagentdto)|false|true|Data Transfer Object for an Agent.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TenantId": "string",
  "OcsNamespace": "string",
  "Agent": {
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
            "TotalPoints": 0,
            "AssetsCreatedPerSecond": 0,
            "AssetsProcessedCount": 0,
            "TotalAssetsInTransfer": 0,
            "FailedCreationPointIds": [
              null
            ],
            "SuccessfulStreamDeletions": 0,
            "FailedStreamDeletions": 0,
            "SuccessfulAssetDeletions": 0,
            "FailedAssetDeletions": 0,
            "SuccessfulAssetCreations": 0,
            "FailedAssetCreationsAndUpdates": 0
          },
          "Name": "string",
          "MetadataPrivacy": 0,
          "TransferRevisionNumber": 0,
          "LastEditDate": "2019-08-24T14:15:22Z",
          "LastEditBy": "string",
          "AutoDeleteCloudObjects": true,
          "TotalPointsInTransfer": 0,
          "PIPointsWithHealthEvents": {
            "property1": 0,
            "property2": 0
          },
          "AFElementsWithHealthEvents": {
            "property1": 0,
            "property2": 0
          },
          "StreamCreationStatus": {
            "TransferId": "string",
            "Status": "[",
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": "["
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
      "TotalPoints": 0,
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
      "FailedAssetCreationsAndUpdates": 0
    }
  }
}

```

---

### AgentDto

<a id="schemaagentdto"></a>
<a id="schema_AgentDto"></a>
<a id="tocSagentdto"></a>
<a id="tocsagentdto"></a>

Data Transfer Object for an Agent.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|LastCommTime|date-time|false|false|None|
|Version|string|false|true|None|
|Status|[AgentStatus](#schemaagentstatus)|false|false|None|
|Description|string|false|true|None|
|HostName|string|false|true|None|
|PISystem|[PISystemDto](#schemapisystemdto)|false|true|Data Transfer Object for a PI System.|
|Namespace|string|false|true|None|
|Region|string|false|true|None|
|IsDeprecated|boolean|false|false|None|
|TransferMetrics|[TransferMetricsDto](#schematransfermetricsdto)|false|true|Data Transfer Object for tracking metrics of a Transfer.|

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
          "TotalPoints": 0,
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
          "FailedAssetCreationsAndUpdates": 0
        },
        "Name": "string",
        "MetadataPrivacy": 0,
        "TransferRevisionNumber": 0,
        "LastEditDate": "2019-08-24T14:15:22Z",
        "LastEditBy": "string",
        "AutoDeleteCloudObjects": true,
        "TotalPointsInTransfer": 0,
        "PIPointsWithHealthEvents": {
          "property1": 0,
          "property2": 0
        },
        "AFElementsWithHealthEvents": {
          "property1": 0,
          "property2": 0
        },
        "StreamCreationStatus": {
          "TransferId": "string",
          "Status": 0,
          "TotalPointStreamsExpected": 0,
          "VerifiedPointStreamsCreated": 0,
          "LastUpdateAttempt": "2019-08-24T14:15:22Z",
          "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
          "LastMessage": 0
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
    "TotalPoints": 0,
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
    "FailedAssetCreationsAndUpdates": 0
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

Data Transfer Object for a PI System.

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
|Transfers|[[TransferSummaryDto](#schematransfersummarydto)]|false|true|[Data Transfer Object summarizing a Transfer.]|
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
        "TotalPoints": 0,
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
        "FailedAssetCreationsAndUpdates": 0
      },
      "Name": "string",
      "MetadataPrivacy": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string",
      "AutoDeleteCloudObjects": true,
      "TotalPointsInTransfer": 0,
      "PIPointsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "AFElementsWithHealthEvents": {
        "property1": 0,
        "property2": 0
      },
      "StreamCreationStatus": {
        "TransferId": "string",
        "Status": 0,
        "TotalPointStreamsExpected": 0,
        "VerifiedPointStreamsCreated": 0,
        "LastUpdateAttempt": "2019-08-24T14:15:22Z",
        "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
        "LastMessage": 0
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

Data Transfer Object summarizing a Transfer.

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
|Metrics|[TransferMetricsDto](#schematransfermetricsdto)|false|true|Data Transfer Object for tracking metrics of a Transfer.|
|Name|string|false|true|None|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|TransferRevisionNumber|int32|false|false|None|
|LastEditDate|date-time|false|false|None|
|LastEditBy|guid|false|false|None|
|AutoDeleteCloudObjects|boolean|false|false|None|
|TotalPointsInTransfer|int64|false|false|None|
|PIPointsWithHealthEvents|object|false|true|None|
|AFElementsWithHealthEvents|object|false|true|None|
|StreamCreationStatus|[DetailedStreamCreationStatus](#schemadetailedstreamcreationstatus)|false|true|None|

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
    "TotalPoints": 0,
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
    "FailedAssetCreationsAndUpdates": 0
  },
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
  "AutoDeleteCloudObjects": true,
  "TotalPointsInTransfer": 0,
  "PIPointsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "AFElementsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "StreamCreationStatus": {
    "TransferId": "string",
    "Status": 0,
    "TotalPointStreamsExpected": 0,
    "VerifiedPointStreamsCreated": 0,
    "LastUpdateAttempt": "2019-08-24T14:15:22Z",
    "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
    "LastMessage": 0
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

|Property|Value|Description|
|---|---|---|
|NotSet|0||
|Started|1||
|Stopped|2||
|Initializing|3||

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

Data Transfer Object for tracking metrics of a Transfer.

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
|TotalPoints|int64|false|false|None|
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

```json
{
  "StreamingEventCountPerSecond": 0,
  "HistoricalEventCountPerSecond": 0,
  "SuccessfulCreations": 0,
  "FailedCreations": 0,
  "SuccessfulStreamEdits": 0,
  "FailedStreamEdits": 0,
  "PointEdits": 0,
  "TotalPoints": 0,
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
  "FailedAssetCreationsAndUpdates": 0
}

```

---

### DataPrivacy

<a id="schemadataprivacy"></a>
<a id="schema_DataPrivacy"></a>
<a id="tocSdataprivacy"></a>
<a id="tocsdataprivacy"></a>

None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Undefined|0|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|Medium|1|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|None|2|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|High|3|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|Low|4|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|

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

### DetailedStreamCreationStatus

<a id="schemadetailedstreamcreationstatus"></a>
<a id="schema_DetailedStreamCreationStatus"></a>
<a id="tocSdetailedstreamcreationstatus"></a>
<a id="tocsdetailedstreamcreationstatus"></a>

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

### DataPrivacyAgentsInformationDto

<a id="schemadataprivacyagentsinformationdto"></a>
<a id="schema_DataPrivacyAgentsInformationDto"></a>
<a id="tocSdataprivacyagentsinformationdto"></a>
<a id="tocsdataprivacyagentsinformationdto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|AgentVersion|string|false|true|None|
|Namespace|string|false|true|None|
|TenantId|guid|false|false|None|
|AgentLastCommTime|date-time|false|false|None|
|IsDeprecated|boolean|false|false|None|
|DataArchiveVersion|string|false|true|None|
|AFVersion|string|false|true|None|
|TransferExists|boolean|false|false|None|
|TransferLatestStreamRead|date-time|false|true|None|
|TransferStatus|string|false|true|None|
|TransferLastEditDate|date-time|false|true|None|

```json
{
  "AgentVersion": "string",
  "Namespace": "string",
  "TenantId": "string",
  "AgentLastCommTime": "2019-08-24T14:15:22Z",
  "IsDeprecated": true,
  "DataArchiveVersion": "string",
  "AFVersion": "string",
  "TransferExists": true,
  "TransferLatestStreamRead": "2019-08-24T14:15:22Z",
  "TransferStatus": "string",
  "TransferLastEditDate": "2019-08-24T14:15:22Z"
}

```

---

### AgentStatusDto

<a id="schemaagentstatusdto"></a>
<a id="schema_AgentStatusDto"></a>
<a id="tocSagentstatusdto"></a>
<a id="tocsagentstatusdto"></a>

Data Transfer Object for different aspects of an Agent's status.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Agent|[HealthDto](#schemahealthdto)|false|true|Data Transfer Object for Health information.|
|AFIndexing|[HealthDto](#schemahealthdto)|false|true|Status of any/all indexing tasks of the Agent (e.g. Asset Framework Indexing)|
|PIPointIndexing|[HealthDto](#schemahealthdto)|false|true|Data Transfer Object for Health information.|
|Transfers|object|false|true|Status of each Transfer, keyed on the Transfer's ID|

```json
{
  "Agent": {
    "HealthStatus": 0,
    "InternalStatuses": [
      "string"
    ],
    "HealthEventsSeverity": 0
  },
  "AFIndexing": {
    "HealthStatus": 0,
    "InternalStatuses": [
      "string"
    ],
    "HealthEventsSeverity": 0
  },
  "PIPointIndexing": {
    "HealthStatus": 0,
    "InternalStatuses": [
      "string"
    ],
    "HealthEventsSeverity": 0
  },
  "Transfers": {
    "property1": {
      "HealthStatus": 0,
      "InternalStatuses": [
        "string"
      ],
      "HealthEventsSeverity": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string"
    },
    "property2": {
      "HealthStatus": 0,
      "InternalStatuses": [
        "string"
      ],
      "HealthEventsSeverity": 0,
      "TransferRevisionNumber": 0,
      "LastEditDate": "2019-08-24T14:15:22Z",
      "LastEditBy": "string"
    }
  }
}

```

---

### HealthDto

<a id="schemahealthdto"></a>
<a id="schema_HealthDto"></a>
<a id="tocShealthdto"></a>
<a id="tocshealthdto"></a>

Data Transfer Object for Health information.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|HealthStatus|[ConsolidatedStatus](#schemaconsolidatedstatus)|false|false|None|
|InternalStatuses|string[]|false|true|None|
|HealthEventsSeverity|[LogLevel](#schemaloglevel)|false|true|None|

```json
{
  "HealthStatus": 0,
  "InternalStatuses": [
    "string"
  ],
  "HealthEventsSeverity": 0
}

```

---

### ConsolidatedStatus

<a id="schemaconsolidatedstatus"></a>
<a id="schema_ConsolidatedStatus"></a>
<a id="tocSconsolidatedstatus"></a>
<a id="tocsconsolidatedstatus"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Okay|0|
|Warning|1|
|Error|2|

---

### TransferHealthDto

<a id="schematransferhealthdto"></a>
<a id="schema_TransferHealthDto"></a>
<a id="tocStransferhealthdto"></a>
<a id="tocstransferhealthdto"></a>

Data Transfer Object for Transfer edit information.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|HealthStatus|[ConsolidatedStatus](#schemaconsolidatedstatus)|false|false|None|
|InternalStatuses|string[]|false|true|None|
|HealthEventsSeverity|[LogLevel](#schemaloglevel)|false|true|None|
|TransferRevisionNumber|int32|false|false|None|
|LastEditDate|date-time|false|false|None|
|LastEditBy|guid|false|false|None|

```json
{
  "HealthStatus": 0,
  "InternalStatuses": [
    "string"
  ],
  "HealthEventsSeverity": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string"
}

```

---

### HealthEventDto

<a id="schemahealtheventdto"></a>
<a id="schema_HealthEventDto"></a>
<a id="tocShealtheventdto"></a>
<a id="tocshealtheventdto"></a>

Data Transfer Object for a Health Event.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|TimestampUtc|date-time|false|false|None|
|Category|[HealthEventCategory](#schemahealtheventcategory)|false|false|The source of this health event|
|TransferId|guid|false|true|None|
|EventId|[EventIds](#schemaeventids)|false|false|None|
|Severity|[LogLevel](#schemaloglevel)|false|false|None|
|Message|string|false|true|None|
|PointId|int32|false|true|Optional fields for attaching additional information about the source/context of this health event|
|ElementId|guid|false|true|None|

```json
{
  "Id": "string",
  "TimestampUtc": "2019-08-24T14:15:22Z",
  "Category": 0,
  "TransferId": "string",
  "EventId": 400001,
  "Severity": 0,
  "Message": "string",
  "PointId": 0,
  "ElementId": "string"
}

```

---

### HealthEventCategory

<a id="schemahealtheventcategory"></a>
<a id="schema_HealthEventCategory"></a>
<a id="tocShealtheventcategory"></a>
<a id="tocshealtheventcategory"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Agent|0|
|Asset|1|
|AFIndexing|2|
|Stream|3|
|HistoricalTransfer|4|
|PIPointIndexing|5|

---

### EventIds

<a id="schemaeventids"></a>
<a id="schema_EventIds"></a>
<a id="tocSeventids"></a>
<a id="tocseventids"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|StoppingAgent|400001|
|StoppedAgent|400002|
|ErrorDisposingServiceLocator|400003|
|ProblemSyncingWithTheConfigService|400004|
|SocketErrorDuringSendAgentStatus|400005|
|UnexpectedExceptionTerminatingSyncProcess|400006|
|ExitingConfigSyncManagerRunAsync|400007|
|StoppingConfigSyncManager|400008|
|AttemptingToStopConfigSyncManager|400009|
|StoppedConfigSyncManager|400010|
|ConfigSyncResponseContentUnrecognizedFormat|400011|
|UnexpectedTransportMessageFromConfigSync|400012|
|FailureInLogForwarding|400013|
|TimedOutStoppingCheckCacheAndSendLogsAsync|400014|
|FailedToSendLogMessagesToOcsWillRetry|400015|
|TimedOutConnectingToDataArchive|400016|
|ErrorConnectingToDataArchiveWillRetry|400017|
|ConnectedToDataArchive|400018|
|ErrorPerformingQuery|400019|
|FailedToGetDataArchiveInfoRetrying|400020|
|FailedToGetDataArchiveInfo|400021|
|FailedToPerformQueryForTransferRetrying|400022|
|FailedToPerformQueryForTransfer|400023|
|DataArchiveVersionNotSupported|400024|
|FailedToPerformQueryRetrying|400025|
|FailedToPerformQuery|400026|
|FailedToPerformQueryElementInvalid|400027|
|ConfiguredConnectionsToOcs|400028|
|CreatingOrVerifyingAgentRegistration|400029|
|AgentRegistrationCompleted|400030|
|AgentRegistrationInProgress|400031|
|AgentRegistrationFailedWillRetry|400032|
|AgentRegistrationFailed|400033|
|BadResponseFromConfigSyncEndpoint|400034|
|ErrorTryingToSyncWithConfigService|400035|
|BadResponseSendingForwardedLogs|400036|
|ErrorTryingToSendForwardedLogs|400037|
|BadResponseSendingQueryResults|400038|
|SentQueryResults|400039|
|ErrorSendingQueryResults|400040|
|HttpClientFailedToWriteDataToDataService|400041|
|WroteTransportMessagesToDataService|400042|
|ErrorSendingDataToDataService|400043|
|WaitingForAgentServicesToBeReady|400044|
|TimedOutWaitingForAgentServicesToBeReady|400045|
|InvalidMessageTypeReceivedForStreamCreation|400046|
|StreamCreationRequestFailed|400047|
|ErrorSendingRequestToCreateStreams|400048|
|StatusRequestFailedWaitingForStreamCreation|400049|
|StreamCreationInOcsFailed|400050|
|FailedToVerifyStreamCreationForPoints|400051|
|CleaningUpAfterStreamCreationFailed|400052|
|StreamCreationOrVerificationSucceeded|400053|
|ErrorCleaningUpAfterStreamCreation|400054|
|AgentServiceRetrievedSecrets|400055|
|AgentWillTerminateDueToUnhandledException|400056|
|ErrorShuttingDownAgentService|400057|
|AgentShuttingDownDueToUnhandledException|400058|
|AgentServiceHostStarted|400059|
|AgentReceivedUnregisterRequest|400060|
|AgentUnregisterWasRequestedWithInvalidSpec|400061|
|AgentUnregistered|400062|
|QueryRequestFromConfigService|400063|
|SendingQueryResultsToConfigService|400064|
|ProcessingTransferJobRequest|400065|
|ProcessingTransferStopRequest|400066|
|StoppingAllTransferJobs|400067|
|ShutdownRequestReceivedWhileWritingDataToOcs|400068|
|ErrorWritingToOcs|400069|
|DoneTransferringDataToOcsForTransferStep|400070|
|ErrorWhileWritingDataToOcs|400071|
|HistoricalEventsChunkSentOutOfOrder|400072|
|SpecifiedStartTimeInTheFutureForHistoricalData|400073|
|GettingPagedDataRetryingForPoint|400074|
|GettingPagedDataFailedForPoint|400075|
|FailedToGetDataForPointAndRetrying|400076|
|GettingPagedDataForPointAsDataExceededMaxArcCollect|400077|
|FailedToGetDataForPoint|400078|
|TransferringEventsForPoint|400079|
|BusySendingDataToOcsCannotQueueMore|400080|
|StartingHistoricalDataTransfer|400081|
|WaitingToGetStartTimeOfStreamingUpdates|400082|
|SettingEndOfHistoricalRecoveryPeriod|400083|
|HistoricalStepWaitingForBackFillingStreamingData|400084|
|BackfillingStreamingDataOverBeginningHistoricalTransferStep|400085|
|AgentShutdownRequestedWhileRetrievingDataArchiveInfo|400086|
|UnableToGetArchiveInfoFromDataArchive|400087|
|BusyReadingFromDataArchiveCannotRequestMoreData|400088|
|ShutdownRequestReceivedWhileReadingHistoricalDataFromDataArchive|400089|
|ErrorReadingFromDataArchive|400090|
|DoneReadingDataFromDataArchiveForTransferStep|400091|
|TimedOutWaitingToSignUpForStreamingUpdates|400092|
|StartingStreamingDataTransfer|400093|
|RecievedDataLossNotificationOnDataArchive|400094|
|RegisteredForStreamingUpdatesOnDataArchiveAsConsumer|400095|
|FailedToGetStreamingUpdatesFromDataArchive|400096|
|FailedToGetStreamingUpdatesFromDataArchiveRetrying|400097|
|StreamingUpdatesForPointsWillSendData|400098|
|SendingStreamingUpdates|400099|
|StoppingStreamingDataTransfer|400100|
|StopAlreadyStoppedStreamingDataTransferStepRequested|400101|
|StartingTransferJob|400102|
|StoppingTransferJob|400103|
|NoProgressAvailableForTransferNotStartedSendingDataYet|400104|
|HistoricalDataToOcsCompletedButNoStatusForTheStepAvailable|400105|
|HistoricalDataToOcsCompletedButTheStepStatusIsNotCompleted|400106|
|TransferInProgressCannotStartAgain|400107|
|GotTransferJobIdFromConfigService|400108|
|TransferManagerPreparingForTransferOfPoints|400109|
|UnrecoverableErrorAcquiringPointMetaData|400110|
|UnableToFindAnyMatchingPITagsOnDataArchive|400111|
|CreatingOrVerifyingStreamsInOcsForPIPoints|400112|
|TransferManagerCreatingPIDataTransferJob|400113|
|ErrorTransferringDataToDataService|400114|
|TransferManagerGotStopTransferRequest|400115|
|UnableToStopTransferJobCouldNotFindTransfer|400116|
|TransferManagerStoppingTransferJobs|400117|
|DeleteClientCredentialsAndExit|400118|
|UnknownCustomServiceCommand|400119|
|UnexpectedNonFatalErrorInSendAgentStatus|400120|
|FatalErrorWritingToOcs|400121|
|UnexpectedErrorWritingToOcs|400122|
|ErrorWhileStoppingTransferTasks|400123|
|FatalErrorStartingAgent|400124|
|UsingSettingsFileMessage|400125|
|SignUpForArchiveUpdatesErrorForSingleStream|400126|
|SigningUpForArchiveUpdates|400127|
|RetrievedPointsFromDataArchiveForArchiveUpdates|400128|
|AbortingWaitForStreamsCreationDueToPIPointTypeChangeDetected|400129|
|UnableToRetrieveConfigurationalFileInformation|400130|
|UnableToReadConfigurationalFileInformation|400131|
|DataArchiveVersionChangeDetected|400132|
|UnsupportedPointTypeInTransferRequest|400133|
|MissingQueryResults|400134|
|MultipleQueryClients|400135|
|MissingQueryClient|400136|
|MissingInformationForPIPointResult|400137|
|ErrorSendingRequestToUpdateStreams|400138|
|InvalidIdentityServiceClient|400139|
|ErrorTryingToPublishCapabilities|400140|
|PublishedCapabilities|400141|
|ErrorTryingToSerializeCapabilities|400142|
|ErrorTryingToPostCapabilities|400143|
|BadResponseCodePublishingCapabilities|400144|
|FailedToRetrieveStreamNameFromTransfer|400145|
|TagNotFound|400146|
|MetadataChangeFound|400147|
|TagUpdate|400148|
|GetOrUpdateStreamMetadata|400149|
|FailedToRetrieveStreamMetadata|400150|
|GetTransferFromTransferManager|400151|
|NextUpdateOccursInXTime|400152|
|FailedToGetStreamData|400153|
|TaskCancelledExceptionOccurred|400154|
|ErrorTryingToSyncCapabilities|400155|
|GetCapabilityUpdates|400156|
|ErrorTryingToGetCapabilities|400157|
|CapabilityUpdatesEmptyMissing|400158|
|ConnectedToAFServer|400159|
|StartingInitialAFDataTransfer|400160|
|ShutdownRequestReceivedWhileReadingFromAFServer|400161|
|ErrorReadingFromAFServer|400162|
|DoneReadingDataFromAFServerForTransferStep|400163|
|AFVersionNotSupported|400164|
|ErrorConnectingToAssetFrameworkWillRetry|400165|
|TransferringAFMessage|400166|
|BusyReadingFromAFServerCannotRequestMoreData|400167|
|StartedConfigTool|400168|
|SavedAgentConfiguration|400169|
|UnexpectedErrorInConfigTool|400170|
|ConfigToolFailedToStartService|400171|
|ConfigToolFailedToStopService|400172|
|ChangedAgentConfiguration|400173|
|ConfigToolFailedToGetAFServerIPAddress|400174|
|ConfigToolFailedToGetDAServerIPAddress|400175|
|HostnameUpdated|400176|
|PublishPointsFromAF|400177|
|BadResponseCodePublishingPointsFromAF|400178|
|ErrorTryingToSerializePointsFromAF|400179|
|ErrorTryingToPutPointsFromAF|400180|
|AddingPointsReferencedByAFToTransfer|400181|
|ErrorRemovingAFObjectFromCache|400182|
|FeatureFailure|400183|
|AssetFrameworkVersionChangeDetected|400184|
|WaitingForDataServicesToBeReady|400185|
|WaitingForAssetsServiceToBeReady|400186|
|WaitingForStreamsServiceToBeReady|400187|
|ConfigToolUserNotADomainUser|400188|
|AssetFrameworkIndexingCompleted|400189|
|AssetFrameworkIndexingProgress|400190|
|AssetFrameworkIndexingFailed|400191|
|BadResponseSendingAFIndexProgress|400192|
|SentAFIndexProgress|400193|
|ErrorSendingAFIndexProgress|400194|
|PossibleDataCorruptionDetected|400195|
|GotIngressMessage|400196|
|StreamNotInUpdateContext|400197|
|AssetFrameworkMismatchedUOM|400198|
|AssetFrameworkMismatchedUOMSummary|400199|
|ErrorResolvingPIPointAttributeForAsset|400200|
|StartedAgent|400201|
|UnexpectedFatalErrorInSendAgentStatus|400202|
|UnexpectedErrorSerializingMessage|400203|
|PIPointWithTypeChangeIgnoredInTransfer|400204|
|NoValidPIPointsInTransfer|400205|
|FailedToDeserializeStreamCreationStatus|400206|
|ConfigToolFailedToLogIntoOCS|400207|
|ConfigToolFailedToGetTenantId|400208|
|ConfigToolFailedToGetUserId|400209|
|ConfigToolFailedToGetRoles|400210|
|ConfigToolUserLoggedIntoDifferentTenant|400211|
|ConfigToolUserHasInsufficientOCSPermissions|400212|
|ConfigToolIEEnhancedSecurityEnabled|400213|
|ConfigToolWindowsRegisteryError|400214|
|ConfigToolDAAlreadyRegistered|400215|
|UnknownObjectInTransferCache|400216|
|StreamingDataTransferStepCancelled|400217|
|FailedToRemoveTransferCacheFiles|400218|
|StartingAgent|400219|
|EmptyAgentIdDetected|400220|
|StreamingTransferErrorStatus|400221|
|PISystemNotOwnedByAgent|400222|
|ErrorPerformingSimplePIPointDataReferenceCheck|400223|
|LoggerCreated|400224|
|ElementFound|400225|
|PossibleMalformedSubstitution|400226|
|UnexpectedHttpRequestException|400227|
|GetPISystemsFromConfigService|400228|
|GetAgentFromConfigService|400229|
|GetDataSourcesFromConfigService|400230|
|DeletePISystemsFromConfigService|400231|
|UnsupportedRegistrationMessageTypeForAgentVersion|400232|
|ConfigToolFailedToRetrieveOCSRegisteredDataArchives|400233|
|ConfigToolFailedToRetrieveAgentInformation|400234|
|ErrorConnectingToAssetFramework|400235|
|ConfigToolUserNotAServerAdmin|400236|
|WarningStreamingFutureData|400237|
|UnableToSetDefaultPIDataArchive|400238|
|ConfigToolDetectingNoDataArchives|400239|
|ConfigToolResolvedDefaultPIServerError|400240|
|ErrorConnectingToDataArchive|400241|
|WarningSendingRequestWithNoPartitionKey|400242|
|WarningSendingRequestWithDefaultPartitionKey|400243|
|ErrorSettingDesiredStatusInitializing|400244|
|PointTransferLogEmpty|400245|
|TransferJobReceivedEditTransferRequest|400246|
|TransferJobReceivedEditTransferRequestWhileCreatingStreams|400247|
|TraceProcessingTransferJobRequest|400248|
|TraceGotTransferJobIdFromConfigService|400249|
|TraceCreatingHistoricTransferStep|400250|
|TraceCalculatedTimeContexts|400251|
|TracePointDataRequestParameters|400252|
|CacheFileWritten|400253|
|DeleteStreamFromContextPointsNotFound|400254|
|PIPointAttributeCacheStarted|400255|
|PIPointAttributeCacheFinished|400256|
|PIPointAttributeCacheLoadedPIPoints|400257|
|FailedDeletingHealthEvents|400258|
|StreamCreationForEditTransfer|400259|
|StreamCreationForEditTransferError|400260|
|EditTransferFailed|400261|
|NewDataUpdateContextAdded|400262|
|RetrieveTransferMetricsRequestFailed|400263|
|FailedPointIdIgnoredFromStreamMetadata|400264|
|BadResponseSendingPIPointCacheProgress|400265|
|SentPIPointCacheProgress|400266|
|ErrorSendingPIPointCacheProgress|400267|
|InvalidMessageTypeReceivedForStreamDeletion|400268|
|StreamDeletionRequestFailed|400269|
|ErrorSendingRequestToDeleteStreams|400270|
|FailedSendingHealthEventFromAgent|400271|
|PIConnectionErrorGettingHistoricalEvents|400272|
|PIAuthenticationErrorGettingHistoricalEvents|400273|
|HistoricalStepStatusChanged|400274|
|HistoricalStepEditRequestReceived|400275|
|WaitForOnPremTransferStatusToUpdate|400276|
|TransferManagerSendingEditNotification|400277|
|TracePointTransferLogAddingUpdatingLastEvent|400278|
|TracePointTransferLogBulkUpdateLastEventTimestamps|400279|
|MappingCreationFailed|400280|
|DataArchiveServerIdNotSupported|400281|
|TracePointTransferLogLoaded|400282|
|ErrorReadingPointTransferLog|400283|
|UncategorizedErrorOnPremDuringTransfer|400284|
|UnexpectedErrorDuringStreamCreation|400285|
|PIPointAttributeCacheCannotRefresh|400286|
|CacheFileRead|400287|
|NoReadAccessSecureObjectDataArchive|400288|
|BadResponseCodeCreatingAgentHealthEvent|400289|
|ErrorTryingToSerializeAgentHealthEvent|400290|
|ErrorTryingToCreateAgentHealthEvent|400291|
|CreatingAgentHealthEvent|400292|
|ErrorDeletingPointTransferLog|400293|
|PointTransferLogFileRenamed|400294|
|AssetFrameworkRecreatingCacheFile|400295|
|ErrorReadingJsonCacheFile|400296|
|ErrorWritingAFTransferCacheFile|400297|
|ErrorDisposingLock|400298|
|TimedOutVerifyingDataArchiveDisplayName|400299|
|DataArchiveNameChangeDetected|400300|
|RegisteringServiceType|410000|
|RegisteredServiceType|410001|
|FailedToRegisterServiceType|410002|
|LeavingServiceTypeHostProcess|410003|
|AppInsightKeysNotFound|410004|
|GenericProvisioningNotificationException|420000|
|ReceivedRemoveTenantRequest|420001|
|RemovedTenant|420002|
|FailedToRemoveTenant|420003|
|ReceivedDeactivateTenantRequest|420004|
|DeactivatedTenant|420005|
|FailedToDeactivateTenant|420006|
|ReceivedReactivateTenantRequest|420007|
|ReactivatedTenant|420008|
|FailedToReactivateTenant|420009|
|ReceivedCreateNamespaceRequest|420010|
|CreatedNamespace|420011|
|FailedToCreateNamespace|420012|
|ReceivedDeleteNamespaceRequest|420013|
|DeletedNamespace|420014|
|FailedToDeleteNamespace|420015|
|ProvisionerServiceConstructed|420016|
|ProvisionerServiceBeganRunAsync|420017|
|StartingProvisioningHandler|420018|
|StartedProvisioningHandler|420019|
|FailedToRegisterForProvisioningFromNexus|420020|
|FailedToRetrieveListOfTenants|420021|
|IgnoringTenantForProvisioning|420022|
|FailedToRetrieveNamespacesForTenant|420023|
|StartingProvisioningForNamespace|420024|
|FailedToProvisionForNamespace|420025|
|SFRuntimeRequestedServiceShutdown|420026|
|ProvisionerServiceShuttingDownDueToUnhandledException|420027|
|StoppingProvisioningHandler|420028|
|FailedToStopProvisioningHandler|420029|
|ProvisionerServiceLeavingRunAsync|420030|
|ExceptionWhenProvisioningTenant|420031|
|ExceptionWhenDeprovisioningTenant|420032|
|IgnoringRequestToProvisionNamespaceResourcesForTenant|420033|
|ProvisioningProcessorProvisionedResourcesForTenant|420034|
|NamespaceProvisioningFailed|420035|
|ProvisioningProcessorDeprovisionedNamespace|420036|
|NamespaceDeprovisioningFailed|420037|
|BeganRunningCreateConfigServiceAsync|420038|
|CreatedConfigService|420039|
|ConfigServiceAlreadyExistsForNamespace|420040|
|LeavingCreateConfigServiceAsync|420041|
|BeganRunningCreateManagementServiceAsync|420042|
|CreatedManagementService|420043|
|ManagementServiceAlreadyExistsForNamespace|420044|
|LeavingCreateManagementServiceAsync|420045|
|BeganRunningDeleteServiceAsync|420046|
|DeletedService|420047|
|UnableToDeleteService|420048|
|LeavingDeleteServiceAsync|420049|
|PreviousOperationTaskWasFaulted|420050|
|FailedToAddOperationForTypeAlreadyActive|420051|
|OperationNotFoundAmongActiveOperations|420052|
|OperationCannotBeRemovedSinceNotComplete|420053|
|OperationFaultedOrCanceled|420054|
|OperationCannotBeRemovedSinceNotFaulted|420055|
|OperationWillBeRemovedSinceFaulted|420056|
|OperationFaulted|420057|
|StartingProvisioningSynchronizer|420058|
|FailedToUpdateNamespaceScopedResourcesForAgents|420059|
|FailedToDeleteNamespaceScopedResourcesForAgents|420060|
|NotAllNamespaceScopedResourcesFound|420061|
|FailedCheckingNamespaceScopedResources|420062|
|InvalidRegionReceivedFromProvisioningNotification|420063|
|ReceivedUpdateNamespaceRequest|420064|
|UpdatedNamespace|420065|
|FailedToUpdateNamespace|420066|
|ProvisionerServiceClosing|420067|
|ProvisionerServiceAborting|420068|
|ProvisionerServiceStartingKestrel|420069|
|InvalidNamespaceStatusForProvisioningNotification|420070|
|StartingElasticPoolWorker|420071|
|StoppingElasticPoolWorker|420072|
|DataSourceOwnerIsMissing|430000|
|DataSourceOwnerIsMalformed|430001|
|RequestContentLengthMismatch|430002|
|ErrorForwardingLogsFromAgent|430003|
|ProcessedTransportMessage|430004|
|ProcessedRequestToPostAsyncForAgent|430005|
|ErrorSyncingStatusOfAgent|430006|
|ProcessingAgentSyncRequestWithTransferJobStatus|430007|
|InformingAgentOfDeletedTransfer|430008|
|GeneratingAgentUnregisterTransportMessage|430009|
|AttemptedRegisterWithIncorrectConfig|430010|
|AttemptedRegisterDeletedAgent|430011|
|KnownAgentRegisterInvalidDataSource|430012|
|NewAgentRegisterNonExistentDataSource|430013|
|ReconnectedRegisteredAgent|430014|
|PISystemRegisteredToAnotherAgent|430015|
|PISystemPreviouslySoftDeleted|430016|
|PISystemNameTooSimilarToRegistered|430017|
|FailedToStartProvisioningResourcesForAgent|430018|
|FailedToCompleteProvisioningForAgent|430019|
|RemovedFaultedProvisioningTaskForAgent|430020|
|FailedToRemoveFaultedProvisioningTaskForAgent|430021|
|RegisteredTheAgent|430022|
|FailedToRemoveAgentProvisioningTaskFromCollection|430023|
|ProcessingPointQueryResultWithQueryId|430024|
|FailedToRemovePointQueryForAgent|430025|
|DeletingTransferWithStatus|430026|
|FailedToStartDeletingResourcesForAgent|430027|
|FailedToCompleteDeletionOfResourcesForAgent|430028|
|FailedToRemoveAgentResourcesDeletingTaskFromCollection|430029|
|MissingCollectionAclForDataSources|430030|
|ConfigServiceConstructed|430031|
|ConfigServiceShuttingDownDueToUnhandledException|430032|
|ConfigServiceStartingKestrel|430033|
|ConfigServiceClosing|430034|
|StartingDeprovisioningAllAgentResources|430035|
|FinishedDeprovisioningAllAgentResources|430036|
|AgentResourcesNotDeprovisioned|430037|
|FinishedDeprovisioningAgentResources|430038|
|MaintenanceTasksFaulted|430039|
|AgentResourcesNotProvisioned|430040|
|FinishedProvisioningAgentResources|430041|
|FailedToVerifyAgentResourcesConsistent|430042|
|UpdatedAgentVersionForExistingAgent|430043|
|FailedToDownloadAgentSetupKit|430044|
|DataSourceUsedByOtherAgent|430045|
|FailedToGetAgentSetupKitInfo|430046|
|DeletedAgentForwardedLogs|430047|
|FailedToRetrieveTransferMetrics|430048|
|CreatedDataSource|430049|
|UpdatedDataSource|430050|
|DeletedDataSource|430051|
|OnPremTransferJobStatusChangeDetected|430052|
|ProcessingQueryResultWithQueryId|430053|
|FailedToRemoveQueryForAgent|430054|
|ErrorProcessingAgentCapabilityPublishing|430055|
|ConfigServiceAborting|430056|
|ErrorSendingAgentCapabilityUpdates|430057|
|InitiatingCapabilitySyncRequest|430058|
|ConfigServiceCapabilitySyncRequest|430059|
|CapabilitySyncManagerSyncError|430060|
|CapabilitySyncManagerGetUpdatesError|430061|
|UpdatedPISystem|430062|
|UpdatedAgent|430063|
|AddedQueryToAgentResponseMessages|430064|
|FailedToAddQueryToAgentResponseMessages|430065|
|AddedPointQueryToAgentResponseMessages|430066|
|FailedToAddPointQueryToAgentResponseMessages|430067|
|PagingRequestOnAgentWithoutSupport|430068|
|AgentUsedByOtherDataSource|430069|
|AttemptedRegisterDeprecatedAgent|430070|
|FailedToRetrieveTunableParameters|430071|
|FailedToUpdateTransferMetrics|430072|
|AgentRegisteredWithCapabilities|430073|
|FailedToPublishCapabilitiesDuringRegistration|430074|
|NoCapabilitiesReturnedFromRegistration|430075|
|ErrorUpdatingAgentTransferAssetCreationCounts|430076|
|ErrorDeletingClient|430077|
|FailedToReadDataFromOCS|430078|
|ReadingFromOcs|430079|
|AssetFrameworkUOMNotInCache|430080|
|AgentAFReIndexRequested|430081|
|ErrorGettingFeatureFlagStatus|430082|
|AgentTransferUpdateErrorBadType|430083|
|AgentTransferUpdateErrorNullStatus|430084|
|AgentTransferUpdateErrorEmptyGuid|430085|
|AgentTransferUpdateErrorAgentRevTooHigh|430086|
|AgentTransferUpdateTransferUpdateRequested|430087|
|FailedToRemoveAgentHealthEvents|430088|
|RequestedAgentNotFound|430089|
|ErrorParsingDataSourceOwner|430090|
|AgentPIReIndexRequested|430091|
|ErrorWritingDataToEventHub|440000|
|CreatingStreamsForTransferJob|440001|
|ErrorCreatingStreamsFromMetadataForTransferJob|440002|
|FailedToGetStatusForStreamCreationForTransferJob|440003|
|DeletedCompletedStreamCreationTaskForTransferJob|440004|
|EventProcessorShuttingDown|440005|
|SimpleEventProcessorInitialized|440006|
|EventProcessErrorOnPartition|440007|
|ProcessSingleEventAsyncFailedDueToUnhandledException|440008|
|DeserializedDataServiceInitializationData|440009|
|BuiltEventHubClient|440010|
|DataServiceConstructed|440011|
|ExceptionWhileCreatingDataService|440012|
|DataServiceBeganRunAsync|440013|
|RegisteredForEventProcessorHost|440014|
|DataServiceShuttingDownDueToUnhandledException|440015|
|DataServiceLeavingRunAsync|440016|
|DataServiceClosing|440017|
|UnableToUnregisterEventProcessorForEventHub|440018|
|UnregisteredEventProcessorForEventHub|440019|
|ExceptionAttemptingUnregisterEventProcessor|440020|
|ErrorCreatingOrUpdatingMetadataForStream|440021|
|ErrorCreatingOrUpdatingStream|440022|
|ErrorWritingEventsForStream|440023|
|ErrorGettingDataSourceOwner|440024|
|HttpSdsRequestSinkSendError|440025|
|ErrorDeserializingMetadataResponseForStream|440026|
|ErrorDeserializingStreamResponseFromSds|440027|
|UsingRootManageAccessKeyForEventHub|440028|
|UsingLowPrivilegeAccessKeysForEventHub|440029|
|StreamExistsWithADifferentTypeInSDS|440030|
|DataServiceAborting|440031|
|DataServiceStartingKestrel|440032|
|HttpAssetRequestSinkError|440033|
|DeserializedAssetsServiceInitializationData|440034|
|AssetsServiceConstructed|440035|
|ExceptionWhileCreatingAssetsService|440036|
|AssetsServiceStartingKestrel|440037|
|AssetsServiceBeganRunAsync|440038|
|AssetsServiceShuttingDownDueToUnhandledException|440039|
|AssetsServiceLeavingRunAsync|440040|
|AssetsServiceClosing|440041|
|AssetsServiceAborting|440042|
|DeserializedStreamsServiceInitializationData|440043|
|StreamsServiceConstructed|440044|
|ExceptionWhileCreatingStreamsService|440045|
|StreamsServiceStartingKestrel|440046|
|StreamsServiceBeganRunAsync|440047|
|StreamsServiceShuttingDownDueToUnhandledException|440048|
|StreamsServiceLeavingRunAsync|440049|
|StreamsServiceClosing|440050|
|StreamsServiceAborting|440051|
|AssetsServiceMultiStatusResponse|440052|
|FailedToCreateOrUpdateAsset|440053|
|FailedToCreateOrUpdateAssetType|440054|
|ErrorCreatingAssetsGeneric|440055|
|ErrorCreatingAssetsDetailed|440056|
|ExceptionWhileRetrievingAssetsEventHub|440057|
|IgnoringEvent|440058|
|UnexpectedErrorInEventHubProcessor|440059|
|EventHubInitializationData|440060|
|IgnoringMessage|440061|
|MessageSentToStreamsService|440062|
|MessageSentToAssetsService|440063|
|DataServiceFailedToCreateStream|440064|
|DataServiceFailedToUpdateStreamMetadata|440065|
|StreamsServiceFailedToUpdateValuesInSDS|440066|
|ErrorRetrievingStreamPartitionMapping|440067|
|WarningNoPartitionIdReceived|440068|
|WarningEmptyPartitionIdReceived|440069|
|DataServiceFailedToUpdateStream|440070|
|DataServiceFailedToUpdateFailedStreamsPointIdList|440071|
|DataServiceFailedToFindStreamDuringDelete|440072|
|DataServiceFailedToDeleteStream|440073|
|DeletingStreamsForTransferJob|440074|
|ErrorDeletingStreamsForTransferJob|440075|
|DataSourceOwnerIdentityCacheTrusteeTypeNotImplemented|440076|
|FailedToAddNewHealthEventFromAssetService|440077|
|FailedToAddNewHealthEventFromDataService|440078|
|FailedToDeleteAsset|440079|
|FailedToDeleteAssetType|440080|
|ResponseInProgressSkipWebExceptionMiddleware|450000|
|ExceptionHandledByWebExceptionMiddleware|450001|
|WebExceptionMiddlewareReceivedException|450002|
|ExceptionStartingProcessOfProvisioningResourcesForAgent|450003|
|ExceptionStartingAgentDeletion|450004|
|ExceptionGettingProvisioningStatusForAgent|450005|
|ExceptionClearingProvisioningStatusForAgent|450006|
|ErrorCreatingResourcesForAgent|450007|
|CreateCloudResourcesForAgentCompleted|450008|
|DeleteCloudResourcesForAgentCompleted|450009|
|UnexpectedErrorDeletingCloudResourcesForAgent|450010|
|FoundOrCreatedPIToOcsSdsTypes|450011|
|EventHubNamespaceAlreadyExistsInAzure|450012|
|CreatedEventHubNamespace|450013|
|EventHubNamespaceAlreadyDoesNotExistInAzure|450014|
|CreatedEventHub|450015|
|EventHubNamespaceIsNotAccessible|450016|
|CreatedDataService|450017|
|DataServiceAlreadyExists|450018|
|DataServiceForDeletionWasNotFound|450019|
|DataServiceDeletionWasCanceled|450020|
|DeletedDataService|450021|
|SdsTypeNotFound|450022|
|ErrorCreatingOrUpdatingSdsType|450023|
|ManagementServiceConstructed|450024|
|ExceptionCreatingManagementService|450025|
|ManagementServiceBeganRunAsync|450026|
|ManagementServiceShuttingDownDueToUnhandledException|450027|
|ManagementServiceLeavingRunAsync|450028|
|ManagementServiceClosing|450029|
|MissingEventHub|450030|
|MissingEventHubNamespace|450031|
|ExceptionVerifyingAgentResourcesExists|450032|
|ExceptionVerifyingAgentResourcesDeleted|450033|
|AzureSubscriptionFullForEHNamespaces|450034|
|EHNamespaceCreationFailed|450035|
|SuccessfulEHNamespaceCleanup|450036|
|BeginAgentResourceCreateVerification|450037|
|BeginAgentResourceDeleteVerification|450038|
|BeginTypeCreateVerification|450039|
|BeginEventHubNamespaceCreateVerification|450040|
|BeginEventHubCreateVerification|450041|
|BeginDataServiceCreateVerification|450042|
|BeginDataServiceDeleteVerification|450043|
|BeginEventHubNamespaceDeleteVerification|450044|
|ManagementServiceAborting|450045|
|ManagementServiceStartingKestrel|450046|
|BeginStreamsServiceCreateVerification|450047|
|CreatedStreamsService|450048|
|StreamsServiceAlreadyExists|450049|
|BeginStreamsServiceDeleteVerification|450050|
|StreamsServiceForDeletionWasNotFound|450051|
|StreamsServiceDeletionWasCanceled|450052|
|DeletedStreamsService|450053|
|BeginAssetsServiceCreateVerification|450054|
|CreatedAssetsService|450055|
|AssetsServiceAlreadyExists|450056|
|BeginAssetsServiceDeleteVerification|450057|
|AssetsServiceForDeletionWasNotFound|450058|
|AssetsServiceDeletionWasCanceled|450059|
|DeletedAssetsService|450060|
|RetrievingTransferMetrics|450061|
|UpdatingStreamsTransferMetrics|450062|
|UpdatingAssetsTransferMetrics|450063|
|ProvisioningMissingResources|450064|
|FailedToGetNamespaceLockDuringProvisioning|450065|
|ProvisioningSynchronizerExiting|450066|
|ProvisioningSynchronizerUnexpectedException|450067|
|AssetsTransferSpeedMetric|450068|
|AssetBulkCreateRequest|450069|
|AssetCreationRequestReponseStatus|450070|
|AssetBulkUpdateRequest|450071|
|AssetUpdateRequestReponseStatus|450072|
|AssetDeleteTransferSpeedMetric|450073|
|RetrievedSqlServer|460001|
|DatabaseAlreadyExists|460002|
|ErrorCreatingDatabase|460003|
|ErrorRetrievingDatabase|460004|
|DatabaseToBeDeletedNotFound|460005|
|ConfigServiceTerminatingDueToMissingDatabase|460006|
|UpgradingDatabase|460007|
|UpgradedDatabase|460008|
|ErrorUpgradingDatabase|460009|
|TransportMessageTooLargeForEventHub|460010|
|TransportMessageSizeMismatch|460011|
|RetryHandlerRetrying|460012|
|BeginProvisioningSqlDatabase|460013|
|SqlDatabaseProvisioningComplete|460014|
|ErroneousForbiddenExceptionReceivedForIncorrectSqlBackupSettings|460015|
|RetryableErrorCreatingSqlDatabase|460016|
|ForbiddenExceptionReceivedForCorrectSqlBackupSettings|460017|
|ProvisioningAllAgentsResources|460018|
|FailedProvisioningAllAgentsResources|460019|
|FailedProvisioningAgentsResources|460020|
|ErrorCreatingOrUpdatingElasticPool|460021|
|ErrorRetrievingElasticPool|460022|
|ErrorDeletingElasticPool|460023|
|ErrorUpdatingDatabase|460024|
|ErrorPoolingDatabases|460025|
|ElasticPoolAlreadyExists|460026|
|BeginProvisioningElasticPool|460027|
|ElasticPoolProvisioningComplete|460028|
|DeletedElasticPool|460029|
|BeginElasticPoolRebalancing|460030|
|ElasticPoolRebalancingComplete|460031|
|BeginElasticPoolAssignment|460032|
|CompletedElasticPoolAssignment|460033|
|AllDatabasesArePooled|460034|
|FoundUnpooledDatabases|460035|
|PointTrace|460036|
|RetryHandlerTotalDurationTimeout|460037|
|RetryHandlerMultiStatusDurationTimeout|460038|
|ErrorGettingRolesForTrustee|460039|

---

### TransferDto

<a id="schematransferdto"></a>
<a id="schema_TransferDto"></a>
<a id="tocStransferdto"></a>
<a id="tocstransferdto"></a>

Data Transfer Object for a Transfer.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|HistoricalDataStartTime|date-time|false|false|None|
|Description|string|false|true|None|
|Status|[TransferStatus](#schematransferstatus)|false|false|None|
|PreviousHistoricChunkStart|date-time|false|false|None|
|CurrentHistoricChunkStart|date-time|false|false|None|
|LatestStreamingRead|date-time|false|false|None|
|HistoricalDataEndTime|date-time|false|false|None|
|TransferredElementsCount|int32|false|false|None|
|AssetsCreatedCount|int32|false|false|None|
|AssetsUpdatedCount|int32|false|false|None|
|AssetsFailedCount|int32|false|false|None|
|OnPremTransferStatus|[TransferJobStatus](#schematransferjobstatus)|false|false|None|
|DesiredStatus|[TransferStatus](#schematransferstatus)|false|false|None|
|PIPointIds|[integer]|false|true|None|
|AFElementIds|string[]|false|true|None|
|PIPointsReferencedByAF|[integer]|false|true|None|
|PIPointsWithHealthEvents|object|false|true|None|
|AFElementsWithHealthEvents|object|false|true|None|
|Name|string|false|true|None|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|TransferRevisionNumber|int32|false|false|None|
|LastEditDate|date-time|false|false|None|
|LastEditBy|guid|false|false|None|
|PointEdits|int64|false|false|None|
|AutoDeleteCloudObjects|boolean|false|false|None|
|TotalPointsInTransfer|int64|false|false|None|
|StreamCreationStatus|[DetailedStreamCreationStatus](#schemadetailedstreamcreationstatus)|false|true|None|

```json
{
  "Id": "string",
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Status": 0,
  "PreviousHistoricChunkStart": "2019-08-24T14:15:22Z",
  "CurrentHistoricChunkStart": "2019-08-24T14:15:22Z",
  "LatestStreamingRead": "2019-08-24T14:15:22Z",
  "HistoricalDataEndTime": "2019-08-24T14:15:22Z",
  "TransferredElementsCount": 0,
  "AssetsCreatedCount": 0,
  "AssetsUpdatedCount": 0,
  "AssetsFailedCount": 0,
  "OnPremTransferStatus": 0,
  "DesiredStatus": 0,
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "PIPointsReferencedByAF": [
    0
  ],
  "PIPointsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "AFElementsWithHealthEvents": {
    "property1": 0,
    "property2": 0
  },
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
  "PointEdits": 0,
  "AutoDeleteCloudObjects": true,
  "TotalPointsInTransfer": 0,
  "StreamCreationStatus": {
    "TransferId": "string",
    "Status": 0,
    "TotalPointStreamsExpected": 0,
    "VerifiedPointStreamsCreated": 0,
    "LastUpdateAttempt": "2019-08-24T14:15:22Z",
    "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
    "LastMessage": 0
  }
}

```

---

### QueryDto

<a id="schemaquerydto"></a>
<a id="schema_QueryDto"></a>
<a id="tocSquerydto"></a>
<a id="tocsquerydto"></a>

Data Transfer Object for a Query.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|QueryType|[QueryTypes](#schemaquerytypes)|false|false|None|
|PI|[QueryPIDto](#schemaquerypidto)|false|true|Data Transfer Object for PI information for a Query.|
|AF|[QueryAFDto](#schemaqueryafdto)|false|true|Data Transfer Object for AF Information for a Query.|
|Status|[QueryStatus](#schemaquerystatus)|false|false|None|
|Skip|int32|false|false|None|
|Count|int32|false|false|None|

```json
{
  "Id": "string",
  "QueryType": 0,
  "PI": {
    "PointMasks": {
      "property1": "string",
      "property2": "string"
    },
    "PointIds": [
      0
    ],
    "PointList": {
      "MetadataPrivacy": 0,
      "PointIds": [
        0
      ]
    }
  },
  "AF": {
    "HierarchyMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ElementSearchByAttributeMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ObjectIds": [
      "string"
    ]
  },
  "Status": 1,
  "Skip": 0,
  "Count": 0
}

```

---

### QueryTypes

<a id="schemaquerytypes"></a>
<a id="schema_QueryTypes"></a>
<a id="tocSquerytypes"></a>
<a id="tocsquerytypes"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|None|0||
|PIPoint|1||
|AFDatabases|2||
|AFHierarchy|4||
|PIPointList|8||
|AFElementList|16||
|AFElementSearchByAttribute|32||
|AFAttributeLoad|64||
|AFElementReferencedPIPoints|128||
|PIPointListEx|256||
|ValidateAFOnlyTransfer|512||

---

### QueryPIDto

<a id="schemaquerypidto"></a>
<a id="schema_QueryPIDto"></a>
<a id="tocSquerypidto"></a>
<a id="tocsquerypidto"></a>

Data Transfer Object for PI information for a Query.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|PointMasks|object|false|true|None|
|PointIds|[integer]|false|true|None|
|PointList|[QueryPIPointListExDto](#schemaquerypipointlistexdto)|false|true|Data Transfer Object for PI Point Lists.|

```json
{
  "PointMasks": {
    "property1": "string",
    "property2": "string"
  },
  "PointIds": [
    0
  ],
  "PointList": {
    "MetadataPrivacy": 0,
    "PointIds": [
      0
    ]
  }
}

```

---

### QueryPIPointListExDto

<a id="schemaquerypipointlistexdto"></a>
<a id="schema_QueryPIPointListExDto"></a>
<a id="tocSquerypipointlistexdto"></a>
<a id="tocsquerypipointlistexdto"></a>

Data Transfer Object for PI Point Lists.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|PointIds|[integer]|false|true|None|

```json
{
  "MetadataPrivacy": 0,
  "PointIds": [
    0
  ]
}

```

---

### QueryAFDto

<a id="schemaqueryafdto"></a>
<a id="schema_QueryAFDto"></a>
<a id="tocSqueryafdto"></a>
<a id="tocsqueryafdto"></a>

Data Transfer Object for AF Information for a Query.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|HierarchyMasks|object|false|true|None|
|ElementSearchByAttributeMasks|object|false|true|None|
|ObjectIds|string[]|false|true|None|

```json
{
  "HierarchyMasks": {
    "property1": "string",
    "property2": "string"
  },
  "ElementSearchByAttributeMasks": {
    "property1": "string",
    "property2": "string"
  },
  "ObjectIds": [
    "string"
  ]
}

```

---

### QueryHierarchyMask

<a id="schemaqueryhierarchymask"></a>
<a id="schema_QueryHierarchyMask"></a>
<a id="tocSqueryhierarchymask"></a>
<a id="tocsqueryhierarchymask"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|DatabaseId|1|
|Id|2|
|TreePath|3|
|Skip|4|
|Count|5|

---

### QueryElementSearchByAttributeMask

<a id="schemaqueryelementsearchbyattributemask"></a>
<a id="schema_QueryElementSearchByAttributeMask"></a>
<a id="tocSqueryelementsearchbyattributemask"></a>
<a id="tocsqueryelementsearchbyattributemask"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|DatabaseId|1|
|QueryString|2|
|AttributeName|3|

---

### QueryStatus

<a id="schemaquerystatus"></a>
<a id="schema_QueryStatus"></a>
<a id="tocSquerystatus"></a>
<a id="tocsquerystatus"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Accepted|1||
|Processing|2||
|Completed|3||
|NotSupportedByAgent|4||
|ProcessingFailedOnAgent|5||
|PartiallyCompleted|6||
|Interrupted|7||
|ProcessingOnAgent|8||
|Unknown|-1||

---

### PIPointQueryDto

<a id="schemapipointquerydto"></a>
<a id="schema_PIPointQueryDto"></a>
<a id="tocSpipointquerydto"></a>
<a id="tocspipointquerydto"></a>

Data Transfer Object for a PI Point Query.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|PointNameMask|string|false|true|None|
|PointSourceMask|string|false|true|None|
|Status|[PIPointQueryStatus](#schemapipointquerystatus)|false|false|None|

```json
{
  "Id": "string",
  "PointNameMask": "string",
  "PointSourceMask": "string",
  "Status": 0
}

```

---

### PIPointQueryStatus

<a id="schemapipointquerystatus"></a>
<a id="schema_PIPointQueryStatus"></a>
<a id="tocSpipointquerystatus"></a>
<a id="tocspipointquerystatus"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Ready|0|
|Querying|1|
|Completed|2|
|NotSupportedByAgent|3|

---

### QueryResultPageDto

<a id="schemaqueryresultpagedto"></a>
<a id="schema_QueryResultPageDto"></a>
<a id="tocSqueryresultpagedto"></a>
<a id="tocsqueryresultpagedto"></a>

Data Transfer Object for a Query Result.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Results|[any]|false|true|None|
|AdditionalInformation|object|false|true|None|

```json
{
  "Results": [
    null
  ],
  "AdditionalInformation": {
    "property1": null,
    "property2": null
  }
}

```

---

### QueryStatusDto

<a id="schemaquerystatusdto"></a>
<a id="schema_QueryStatusDto"></a>
<a id="tocSquerystatusdto"></a>
<a id="tocsquerystatusdto"></a>

Data Transfer Object for the status of a Query.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|Status|[QueryStatus](#schemaquerystatus)|false|false|None|
|QueryType|[QueryTypes](#schemaquerytypes)|false|false|None|
|Skip|int32|false|false|None|
|Count|int32|false|false|None|
|TotalCount|int32|false|false|None|
|QueryFailureReason|string|false|true|None|
|MissingAttributePointValues|string|false|true|None|

```json
{
  "Id": "string",
  "Status": 1,
  "QueryType": 0,
  "Skip": 0,
  "Count": 0,
  "TotalCount": 0,
  "QueryFailureReason": "string",
  "MissingAttributePointValues": "string"
}

```

---

### PIPointQueryResultDto

<a id="schemapipointqueryresultdto"></a>
<a id="schema_PIPointQueryResultDto"></a>
<a id="tocSpipointqueryresultdto"></a>
<a id="tocspipointqueryresultdto"></a>

Data Transfer Object for a PI Point Query Result.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|ResultPIPointsAttributes|[[PIPointAttributesFromQueryResult](#schemapipointattributesfromqueryresult)]|false|true|None|

```json
{
  "ResultPIPointsAttributes": [
    {
      "PointId": 0,
      "Name": "string",
      "PointSource": "string",
      "Description": "string",
      "EngineeringUnits": "string"
    }
  ]
}

```

---

### PIPointAttributesFromQueryResult

<a id="schemapipointattributesfromqueryresult"></a>
<a id="schema_PIPointAttributesFromQueryResult"></a>
<a id="tocSpipointattributesfromqueryresult"></a>
<a id="tocspipointattributesfromqueryresult"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|PointId|int32|false|false|None|
|Name|string|false|true|None|
|PointSource|string|false|true|None|
|Description|string|false|true|None|
|EngineeringUnits|string|false|true|None|

```json
{
  "PointId": 0,
  "Name": "string",
  "PointSource": "string",
  "Description": "string",
  "EngineeringUnits": "string"
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

### DataSourceCreateUpdateDto

<a id="schemadatasourcecreateupdatedto"></a>
<a id="schema_DataSourceCreateUpdateDto"></a>
<a id="tocSdatasourcecreateupdatedto"></a>
<a id="tocsdatasourcecreateupdatedto"></a>

Data Transfer Object for creating or updating a Data Source.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|true|false|None|
|Description|string|false|true|None|

```json
{
  "Name": "string",
  "Description": "string"
}

```

---

### TransferCreateDto

<a id="schematransfercreatedto"></a>
<a id="schema_TransferCreateDto"></a>
<a id="tocStransfercreatedto"></a>
<a id="tocstransfercreatedto"></a>

Data Transfer Object for creating a Transfer.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|HistoricalDataStartTime|date-time|true|false|None|
|Description|string|false|true|None|
|PIPointIds|[integer]|false|true|None|
|AFElementIds|string[]|false|true|None|
|Name|string|false|true|None|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|TotalPointsInTransfer|int64|false|false|None|
|AutoDeleteCloudObjects|boolean|false|false|None|

```json
{
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "Description": "string",
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "Name": "string",
  "MetadataPrivacy": 0,
  "TotalPointsInTransfer": 0,
  "AutoDeleteCloudObjects": true
}

```

---

### QueryCreateUpdateDto

<a id="schemaquerycreateupdatedto"></a>
<a id="schema_QueryCreateUpdateDto"></a>
<a id="tocSquerycreateupdatedto"></a>
<a id="tocsquerycreateupdatedto"></a>

Data Transfer Object for creating or updating a Query.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|QueryType|[QueryTypes](#schemaquerytypes)|false|true|None|
|PI|[QueryPIDto](#schemaquerypidto)|false|true|Data Transfer Object for PI information for a Query.|
|AF|[QueryAFDto](#schemaqueryafdto)|false|true|Data Transfer Object for AF Information for a Query.|
|Skip|int32|false|false|None|
|Count|int32|false|false|None|

```json
{
  "QueryType": 0,
  "PI": {
    "PointMasks": {
      "property1": "string",
      "property2": "string"
    },
    "PointIds": [
      0
    ],
    "PointList": {
      "MetadataPrivacy": 0,
      "PointIds": [
        0
      ]
    }
  },
  "AF": {
    "HierarchyMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ElementSearchByAttributeMasks": {
      "property1": "string",
      "property2": "string"
    },
    "ObjectIds": [
      "string"
    ]
  },
  "Skip": 2147483647,
  "Count": 2147483647
}

```

---

### PatchDto

<a id="schemapatchdto"></a>
<a id="schema_PatchDto"></a>
<a id="tocSpatchdto"></a>
<a id="tocspatchdto"></a>

Data Transfer Object for a Patch.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|op|[PatchOperation](#schemapatchoperation)|true|false|None|
|path|string|false|false|None|
|value|any|false|true|None|

```json
{
  "op": 1,
  "path": "string",
  "value": null
}

```

---

### PatchOperation

<a id="schemapatchoperation"></a>
<a id="schema_PatchOperation"></a>
<a id="tocSpatchoperation"></a>
<a id="tocspatchoperation"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Add|1|
|Remove|2|
|Replace|3|
|Move|4|
|Copy|5|
|Test|6|

---

### PIPointQueryCreateUpdateDto

<a id="schemapipointquerycreateupdatedto"></a>
<a id="schema_PIPointQueryCreateUpdateDto"></a>
<a id="tocSpipointquerycreateupdatedto"></a>
<a id="tocspipointquerycreateupdatedto"></a>

Data Transfer Object to create or update a PI Point Query.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|PointNameMask|string|true|false|None|
|PointSourceMask|string|true|false|None|

```json
{
  "PointNameMask": "string",
  "PointSourceMask": "string"
}

```

---

### TransferUpdateDto

<a id="schematransferupdatedto"></a>
<a id="schema_TransferUpdateDto"></a>
<a id="tocStransferupdatedto"></a>
<a id="tocstransferupdatedto"></a>

Data Transfer Object for a Transfer Update.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Description|string|false|true|None|
|Name|string|false|true|None|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None means all metadata is filtered out. Low filters all but 3 metadata items. Medium only filters out 2 metadata items. High means no data is filtered out.|
|PIPointIds|[integer]|false|true|None|
|AFElementIds|string[]|false|true|None|
|HistoricalDataStartTime|date-time|false|true|None|
|ExpectedTransferRevisionNumber|int32|true|false|None|
|AutoDeleteCloudObjects|boolean|false|true|None|

```json
{
  "Description": "string",
  "Name": "string",
  "MetadataPrivacy": 0,
  "PIPointIds": [
    0
  ],
  "AFElementIds": [
    "string"
  ],
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "ExpectedTransferRevisionNumber": 0,
  "AutoDeleteCloudObjects": true
}

```

---

### TransferUpdateStatusDto

<a id="schematransferupdatestatusdto"></a>
<a id="schema_TransferUpdateStatusDto"></a>
<a id="tocStransferupdatestatusdto"></a>
<a id="tocstransferupdatestatusdto"></a>

Data Transfer Object for the status of a Transfer Update.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|DesiredStatus|[TransferStatus](#schematransferstatus)|false|false|None|

```json
{
  "DesiredStatus": 0
}

```

---

