---
uid: ""

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
              "TotalPointsInTransfer": null,
              "AssetsCreatedPerSecond": null,
              "AssetsProcessedCount": null,
              "TotalAssetsInTransfer": null,
              "FailedCreationPointIds": null,
              "SuccessfulStreamDeletions": null,
              "FailedStreamDeletions": null,
              "SuccessfulAssetDeletions": null,
              "FailedAssetDeletions": null,
              "SuccessfulAssetCreations": null,
              "FailedAssetCreationsAndUpdates": null,
              "IsModified": null,
              "SuccessfulAssetUpdates": null
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
                "MaxSeverity": "[",
                "EventId": "string"
              },
              "property2": {
                "MaxSeverity": "[",
                "EventId": "string"
              }
            },
            "AFElementsWithHealthEvents": {
              "property1": {
                "MaxSeverity": "[",
                "EventId": "string"
              },
              "property2": {
                "MaxSeverity": "[",
                "EventId": "string"
              }
            },
            "StreamCreationStatus": {
              "TransferId": null,
              "Status": null,
              "TotalPointStreamsExpected": null,
              "VerifiedPointStreamsCreated": null,
              "LastUpdateAttempt": null,
              "LastSuccessfulUpdate": null,
              "LastMessage": null
            },
            "HistTransferProgress": {
              "TransferId": null,
              "TotalArchives": null,
              "CurrentArchive": null,
              "TotalPointsInArchive": null,
              "TransferredPointsForArchive": null
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
            "TotalPointsInTransfer": 0,
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
            "Status": "[",
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": "["
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
}
```

---

## `Delete Data Sources`

<a id="opIdDataSources_Delete Data Sources"></a>

Delete all DataSources.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The DataSources were deleted.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

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
            "TotalPointsInTransfer": 0,
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
            "Status": "[",
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": "["
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
            "TotalPointsInTransfer": 0,
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
            "Status": "[",
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": "["
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
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
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
<br/><br/>`string namespaceId`
<br/><br/>`string dataSourceId`
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
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
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
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|

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
?healthEventCategory={healthEventCategory}&pointId={pointId}&elementId={elementId}&transferId={transferId}
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
<br/>Element ID to filter by<br/><br/>`[optional] string transferId`
<br/>Transfer ID to filter by<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[HealthEventDto](#schemahealtheventdto)[]|The collection of `HealthEventDto` associated with the specified `agentId`.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|

<h4>Example response body</h4>

> 200 Response ([HealthEventDto](#schemahealtheventdto)[])

```json
[
  {
    "Id": "string",
    "TimestampUtc": "2019-08-24T14:15:22Z",
    "Category": 0,
    "TransferId": "string",
    "EventId": 400017,
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
  "Id": "string",
  "Category": 0,
  "TransferId": "string",
  "EventId": 400017,
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
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|422|[ErrorResponse](#schemaerrorresponse)|Unprocessable Entity; invalid `HealthEventDto` in request body|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Remove Health Events`

<a id="opIdDataSources_Remove Health Events"></a>

Removes all health events associated with an agent

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/status/events
?transfer={transfer}&category={category}&eventId={eventId}&pointId={pointId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>Agent identifier.<br/><br/>`string transfer`
<br/>Optional. If provided, will only delete health events with this Transfer ID.<br/><br/>`any category`
<br/>Optional. If provided, will only delete health events with this category.<br/><br/>`any eventId`
<br/>Optional. If provided, will only delete health events with this eventId.<br/><br/>`integer pointId`
<br/>Will only delete health events with this pointId.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Deleted.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|

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
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|

<h4>Example response body</h4>

> 200 Response ([HealthEventDto](#schemahealtheventdto))

```json
{
  "Id": "string",
  "TimestampUtc": "2019-08-24T14:15:22Z",
  "Category": 0,
  "TransferId": "string",
  "EventId": 400017,
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
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|

---

## `Get Agent Scoped Transfer Metrics`

<a id="opIdDataSources_Get Agent Scoped Transfer Metrics"></a>

Get Agent-Scoped Transfer Metrics (TransferMetricsDto) NOTE: DO NOT REMOVE THIS ROUTE. ALTHOUGH IT IS NO LONGER REFERENCED, AGENT VERSIONS 2.0.X.X AND OLDER STILL REFERENCE IT. ONCE ALL AGENTS BELOW 2.1 ARE DEPRECATED, AND CUSTOMERS ARE CONVERTED, THIS ROUTE CAN BE REMOVED.

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
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

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

## `Get All Transfer Metrics`

<a id="opIdDataSources_Get All Transfer Metrics"></a>

This gets the transfer metrics we store per transfer (from the transfer object) and the transfer metrics we store per Agent (from the Management service) and combines them into one DTO that the UI can use.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/transfers/{transferId}/metrics
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>Data source identifier.<br/><br/>`string agentId`
<br/>The Id of the requested Agent.<br/><br/>`string transferId`
<br/>The Id of the requested Transfer.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[CombinedTransferMetricsDto](#schemacombinedtransfermetricsdto)|Success.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([CombinedTransferMetricsDto](#schemacombinedtransfermetricsdto))

```json
{
  "StreamingEventCountPerSecond": 0,
  "HistoricalEventCountPerSecond": 0,
  "AssetsCreatedPerSecond": 0,
  "SuccessfulStreamCreations": 0,
  "SuccessfulStreamUpdates": 0,
  "SuccessfulStreamDeletions": 0,
  "FailedStreamCreations": 0,
  "FailedStreamUpdates": 0,
  "FailedStreamDeletions": 0,
  "SuccessfulAssetCreations": 0,
  "SuccessfulAssetUpdates": 0,
  "SuccessfulAssetDeletions": 0,
  "FailedAssetCreationsAndUpdates": 0,
  "FailedAssetDeletions": 0,
  "FailedCreationPointIds": [
    0
  ],
  "TotalPointsInTransfer": 0,
  "TotalElementsInTransfer": 0,
  "LatestStreamingRead": "2019-08-24T14:15:22Z",
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "HistoricalDataEndTime": "2019-08-24T14:15:22Z",
  "HistTransferProgress": {
    "TransferId": "string",
    "TotalArchives": 0,
    "CurrentArchive": 0,
    "TotalPointsInArchive": 0,
    "TransferredPointsForArchive": 0
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
  "IsModified": true
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
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
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
    "Name": "string",
    "MetadataPrivacy": 0,
    "TransferRevisionNumber": 0,
    "LastEditDate": "2019-08-24T14:15:22Z",
    "LastEditBy": "string",
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
    },
    "StreamErrors": [
      {
        "PointId": 0,
        "Error": 0
      }
    ],
    "AssetErrors": [
      {
        "AssetId": "string",
        "Error": 0
      }
    ],
    "HistTransferProgress": {
      "TransferId": "string",
      "TotalArchives": 0,
      "CurrentArchive": 0,
      "TotalPointsInArchive": 0,
      "TransferredPointsForArchive": 0
    },
    "VerboseLoggingConfiguration": {
      "TransferId": "string",
      "Enabled": true,
      "ExpirationDate": "2019-08-24T14:15:22Z",
      "PIPointIdArray": [
        0
      ],
      "AFElementIdArray": [
        "string"
      ]
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
  "AutoDeleteCloudObjects": true,
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
  }
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
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
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
  },
  "StreamErrors": [
    {
      "PointId": 0,
      "Error": 0
    }
  ],
  "AssetErrors": [
    {
      "AssetId": "string",
      "Error": 0
    }
  ],
  "HistTransferProgress": {
    "TransferId": "string",
    "TotalArchives": 0,
    "CurrentArchive": 0,
    "TotalPointsInArchive": 0,
    "TransferredPointsForArchive": 0
  },
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
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
  "Skip": 0,
  "Count": 100
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
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
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
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
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
  "AutoDeleteCloudObjects": true,
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
  },
  "TotalPointsInTransfer": 0
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
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
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
  },
  "StreamErrors": [
    {
      "PointId": 0,
      "Error": 0
    }
  ],
  "AssetErrors": [
    {
      "AssetId": "string",
      "Error": 0
    }
  ],
  "HistTransferProgress": {
    "TransferId": "string",
    "TotalArchives": 0,
    "CurrentArchive": 0,
    "TotalPointsInArchive": 0,
    "TransferredPointsForArchive": 0
  },
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
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
?deleteCloudObjects={deleteCloudObjects}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string transferId`
<br/>The Id of the Transfer to be deleted.<br/><br/>
`[optional] boolean deleteCloudObjects`
<br/>A flag that signals whether we should delete all streams, stream type, assets, and assets types.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The Transfer was deleted.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
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
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
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
  },
  "StreamErrors": [
    {
      "PointId": 0,
      "Error": 0
    }
  ],
  "AssetErrors": [
    {
      "AssetId": "string",
      "Error": 0
    }
  ],
  "HistTransferProgress": {
    "TransferId": "string",
    "TotalArchives": 0,
    "CurrentArchive": 0,
    "TotalPointsInArchive": 0,
    "TransferredPointsForArchive": 0
  },
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
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

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[PISystemDto](#schemapisystemdto)|A `PISystemDto` object representing the PiSystem that was updated.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
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
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
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
  },
  "StreamErrors": [
    {
      "PointId": 0,
      "Error": 0
    }
  ],
  "AssetErrors": [
    {
      "AssetId": "string",
      "Error": 0
    }
  ],
  "HistTransferProgress": {
    "TransferId": "string",
    "TotalArchives": 0,
    "CurrentArchive": 0,
    "TotalPointsInArchive": 0,
    "TransferredPointsForArchive": 0
  },
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
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

## `Cancel Query`

<a id="opIdDataSources_Cancel Query"></a>

Cancel the Query specified by the `queryId`.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/{DataSourceId}/agents/{agentId}/queries/{queryId}/cancel
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string dataSourceId`
<br/>The Id of the DataSource the resource belongs to.<br/><br/>`string agentId`
<br/>The Id of the Agent the resource belongs to.<br/><br/>`string queryId`
<br/>The Id of the Query to be cancelled.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|The Query was cancelled.|
|403|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
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
|204|None|Success: The AF reindexing was successful.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|409|[ErrorResponse](#schemaerrorresponse)|Conflict|
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
|204|None|Success: The PI reindexing was successful.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|409|[ErrorResponse](#schemaerrorresponse)|Conflict|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `Clean Orphaned Sql Records`

<a id="opIdDataSources_Clean Orphaned Sql Records"></a>

Cleans up the orphaned SQL records after a functional test

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pi/DataSources/orphanedSqlRecords
```

<h4>Parameters</h4>

`string tenantId`
<br/>The ID of the tenant to clean up<br/><br/>`string namespaceId`
<br/>The ID of the namespace to clean up<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Success: The SQL database was cleaned.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---
## Definitions

### DataSourceDto

<a id="schemadatasourcedto"></a>
<a id="schema_DataSourceDto"></a>
<a id="tocSdatasourcedto"></a>
<a id="tocsdatasourcedto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|TenantId|guid|false|false|None|
|OcsNamespace|string|false|true|None|
|Agent|[AgentDto](#schemaagentdto)|false|true|None|

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
            "TotalPointsInTransfer": 0,
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
            "Status": "[",
            "TotalPointStreamsExpected": 0,
            "VerifiedPointStreamsCreated": 0,
            "LastUpdateAttempt": "2019-08-24T14:15:22Z",
            "LastSuccessfulUpdate": "2019-08-24T14:15:22Z",
            "LastMessage": "["
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
}

```

---

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

|Property|Value|Description|
|---|---|---|
|Undefined|0||
|Medium|1||
|None|2||
|High|3||
|Low|4||

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Agent|[HealthDto](#schemahealthdto)|false|true|None|
|AFIndexing|[HealthDto](#schemahealthdto)|false|true|None|
|PIPointIndexing|[HealthDto](#schemahealthdto)|false|true|None|
|Transfers|object|false|true|None|

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|TimestampUtc|date-time|false|false|None|
|Category|[HealthEventCategory](#schemahealtheventcategory)|false|false|None|
|TransferId|guid|false|true|None|
|EventId|[EventIds](#schemaeventids)|false|false|None|
|Severity|[LogLevel](#schemaloglevel)|false|false|None|
|Message|string|false|true|None|
|PointId|int32|false|true|None|
|ElementId|guid|false|true|None|

```json
{
  "Id": "string",
  "TimestampUtc": "2019-08-24T14:15:22Z",
  "Category": 0,
  "TransferId": "string",
  "EventId": 400017,
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
|AssetType|6|

---

### EventIds

<a id="schemaeventids"></a>
<a id="schema_EventIds"></a>
<a id="tocSeventids"></a>
<a id="tocseventids"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|ErrorConnectingToDataArchiveWillRetry|400017|
|WaitingForAgentServicesToBeReady|400044|
|TimedOutWaitingForAgentServicesToBeReady|400045|
|GettingPagedDataRetryingForPoint|400074|
|GettingPagedDataFailedForPoint|400075|
|GettingPagedDataForPointAsDataExceededMaxArcCollect|400077|
|FailedToGetDataForPoint|400078|
|StartingTransferJob|400102|
|StoppingTransferJob|400103|
|UnableToFindSupportedPITagsOnDataArchive|400111|
|AFVersionNotSupported|400164|
|ErrorConnectingToAssetFrameworkWillRetry|400165|
|AssetFrameworkIndexingFailed|400191|
|UnexpectedErrorSerializingMessage|400203|
|NoValidPIPointsInTransfer|400205|
|LoggerCreated|400224|
|FailedDeletingHealthEvents|400258|
|PIConnectionErrorGettingHistoricalEvents|400272|
|PIAuthenticationErrorGettingHistoricalEvents|400273|
|WaitForOnPremTransferStatusToUpdate|400276|
|UnexpectedErrorDuringStreamCreation|400285|
|NoReadAccessSecureObjectDataArchive|400288|
|PIPointTypeMismatch|400303|
|PointAttributeUomConflict|400304|
|PointReferenceUomNotInCache|400305|
|ShutdownRequestReceivedWhileSyncingSdsUnitsOfMeasure|400306|
|FailedToLoadUnitsOfMeasureFromOcs|400310|
|OperationFaultedOrCanceled|420054|
|NotAllNamespaceScopedResourcesFound|420061|
|FailedToUpdateStreamUom|430104|
|HttpAssetRequestSinkError|440033|
|FailedToCreateOrUpdateAsset|440053|
|FailedToCreateOrUpdateAssetType|440054|
|DataServiceFailedToCreateStream|440064|
|DataServiceFailedToUpdateStreamMetadata|440065|
|StreamsServiceFailedToUpdateValuesInSDS|440066|
|DataServiceFailedToUpdateStream|440070|
|DataServiceFailedToFindStreamDuringDelete|440072|
|DataServiceFailedToDeleteStream|440073|
|AssetServiceFailedToDeleteAsset|440079|
|AssetServiceFailedToDeleteAssetType|440080|
|TransportMessageTooLargeForEventHub|460010|
|TransportMessageSizeMismatch|460011|
|RetryHandlerRetrying|460012|
|RetryHandlerTotalDurationTimeout|460037|
|RetryHandlerMultiStatusDurationTimeout|460038|

---

### CombinedTransferMetricsDto

<a id="schemacombinedtransfermetricsdto"></a>
<a id="schema_CombinedTransferMetricsDto"></a>
<a id="tocScombinedtransfermetricsdto"></a>
<a id="tocscombinedtransfermetricsdto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StreamingEventCountPerSecond|float|false|false|None|
|HistoricalEventCountPerSecond|float|false|false|None|
|AssetsCreatedPerSecond|float|false|false|None|
|SuccessfulStreamCreations|int64|false|false|None|
|SuccessfulStreamUpdates|int64|false|false|None|
|SuccessfulStreamDeletions|int64|false|false|None|
|FailedStreamCreations|int64|false|false|None|
|FailedStreamUpdates|int64|false|false|None|
|FailedStreamDeletions|int64|false|false|None|
|SuccessfulAssetCreations|int64|false|false|None|
|SuccessfulAssetUpdates|int64|false|false|None|
|SuccessfulAssetDeletions|int64|false|false|None|
|FailedAssetCreationsAndUpdates|int64|false|false|None|
|FailedAssetDeletions|int64|false|false|None|
|FailedCreationPointIds|[integer]|false|true|None|
|TotalPointsInTransfer|int64|false|false|None|
|TotalElementsInTransfer|int64|false|false|None|
|LatestStreamingRead|date-time|false|false|None|
|HistoricalDataStartTime|date-time|false|false|None|
|HistoricalDataEndTime|date-time|false|false|None|
|HistTransferProgress|[HistoricalTransferProgressDto](#schemahistoricaltransferprogressdto)|false|true|None|
|StreamCreationStatus|[DetailedStreamCreationStatusDto](#schemadetailedstreamcreationstatusdto)|false|true|None|
|IsModified|boolean|false|false|None|

```json
{
  "StreamingEventCountPerSecond": 0,
  "HistoricalEventCountPerSecond": 0,
  "AssetsCreatedPerSecond": 0,
  "SuccessfulStreamCreations": 0,
  "SuccessfulStreamUpdates": 0,
  "SuccessfulStreamDeletions": 0,
  "FailedStreamCreations": 0,
  "FailedStreamUpdates": 0,
  "FailedStreamDeletions": 0,
  "SuccessfulAssetCreations": 0,
  "SuccessfulAssetUpdates": 0,
  "SuccessfulAssetDeletions": 0,
  "FailedAssetCreationsAndUpdates": 0,
  "FailedAssetDeletions": 0,
  "FailedCreationPointIds": [
    0
  ],
  "TotalPointsInTransfer": 0,
  "TotalElementsInTransfer": 0,
  "LatestStreamingRead": "2019-08-24T14:15:22Z",
  "HistoricalDataStartTime": "2019-08-24T14:15:22Z",
  "HistoricalDataEndTime": "2019-08-24T14:15:22Z",
  "HistTransferProgress": {
    "TransferId": "string",
    "TotalArchives": 0,
    "CurrentArchive": 0,
    "TotalPointsInArchive": 0,
    "TransferredPointsForArchive": 0
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
  "IsModified": true
}

```

---

### TransferDto

<a id="schematransferdto"></a>
<a id="schema_TransferDto"></a>
<a id="tocStransferdto"></a>
<a id="tocstransferdto"></a>

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
|OnPremTransferStatus|[TransferJobStatus](#schematransferjobstatus)|false|false|None|
|DesiredStatus|[TransferStatus](#schematransferstatus)|false|false|None|
|PIPointIds|[integer]|false|true|None|
|AFElementIds|string[]|false|true|None|
|PIPointsReferencedByAF|[integer]|false|true|None|
|PIPointsWithHealthEvents|object|false|true|None|
|AFElementsWithHealthEvents|object|false|true|None|
|Name|string|false|true|None|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None|
|TransferRevisionNumber|int32|false|false|None|
|LastEditDate|date-time|false|false|None|
|LastEditBy|guid|false|false|None|
|AutoDeleteCloudObjects|boolean|false|false|None|
|TotalPointsInTransfer|int64|false|false|None|
|StreamCreationStatus|[DetailedStreamCreationStatusDto](#schemadetailedstreamcreationstatusdto)|false|true|None|
|StreamErrors|[[StreamError](#schemastreamerror)]|false|true|None|
|AssetErrors|[[AssetError](#schemaasseterror)]|false|true|None|
|HistTransferProgress|[HistoricalTransferProgressDto](#schemahistoricaltransferprogressdto)|false|true|None|
|VerboseLoggingConfiguration|[VerboseLoggingConfigurationDto](#schemaverboseloggingconfigurationdto)|false|true|None|

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
  "Name": "string",
  "MetadataPrivacy": 0,
  "TransferRevisionNumber": 0,
  "LastEditDate": "2019-08-24T14:15:22Z",
  "LastEditBy": "string",
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
  },
  "StreamErrors": [
    {
      "PointId": 0,
      "Error": 0
    }
  ],
  "AssetErrors": [
    {
      "AssetId": "string",
      "Error": 0
    }
  ],
  "HistTransferProgress": {
    "TransferId": "string",
    "TotalArchives": 0,
    "CurrentArchive": 0,
    "TotalPointsInArchive": 0,
    "TransferredPointsForArchive": 0
  },
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
  }
}

```

---

### StreamError

<a id="schemastreamerror"></a>
<a id="schema_StreamError"></a>
<a id="tocSstreamerror"></a>
<a id="tocsstreamerror"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|PointId|int32|false|false|None|
|Error|[StreamErrorReason](#schemastreamerrorreason)|false|false|None|

```json
{
  "PointId": 0,
  "Error": 0
}

```

---

### StreamErrorReason

<a id="schemastreamerrorreason"></a>
<a id="schema_StreamErrorReason"></a>
<a id="tocSstreamerrorreason"></a>
<a id="tocsstreamerrorreason"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Unknown|0|
|RemovedOnSource|1|
|NotFound|2|
|FailedCreation|3|
|PointTypeMismatch|4|
|UnsupportedPointType|5|
|DataFailedToSend|6|
|DataSendingButPreviouslyFailed|7|
|NotFoundWhileDataSending|8|
|RecoveryInProgress|9|
|RecoverySuccessful|10|

---

### AssetError

<a id="schemaasseterror"></a>
<a id="schema_AssetError"></a>
<a id="tocSasseterror"></a>
<a id="tocsasseterror"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|AssetId|guid|false|false|None|
|Error|[AssetErrorReason](#schemaasseterrorreason)|false|false|None|

```json
{
  "AssetId": "string",
  "Error": 0
}

```

---

### AssetErrorReason

<a id="schemaasseterrorreason"></a>
<a id="schema_AssetErrorReason"></a>
<a id="tocSasseterrorreason"></a>
<a id="tocsasseterrorreason"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Unknown|0|
|ElementTooLarge|1|
|RemovedOnSource|2|

---

### VerboseLoggingConfigurationDto

<a id="schemaverboseloggingconfigurationdto"></a>
<a id="schema_VerboseLoggingConfigurationDto"></a>
<a id="tocSverboseloggingconfigurationdto"></a>
<a id="tocsverboseloggingconfigurationdto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TransferId|guid|false|true|None|
|Enabled|boolean|false|true|None|
|ExpirationDate|date-time|false|true|None|
|PIPointIdArray|[integer]|false|true|None|
|AFElementIdArray|string[]|false|true|None|

```json
{
  "TransferId": "string",
  "Enabled": true,
  "ExpirationDate": "2019-08-24T14:15:22Z",
  "PIPointIdArray": [
    0
  ],
  "AFElementIdArray": [
    "string"
  ]
}

```

---

### QueryDto

<a id="schemaquerydto"></a>
<a id="schema_QueryDto"></a>
<a id="tocSquerydto"></a>
<a id="tocsquerydto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|None|
|QueryType|[QueryTypes](#schemaquerytypes)|false|false|None|
|PI|[QueryPIDto](#schemaquerypidto)|false|true|None|
|AF|[QueryAFDto](#schemaqueryafdto)|false|true|None|
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
|AFElementListWithPointCounts|1024||
|AFElementSearchWithPointCounts|2048||

---

### QueryPIDto

<a id="schemaquerypidto"></a>
<a id="schema_QueryPIDto"></a>
<a id="tocSquerypidto"></a>
<a id="tocsquerypidto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|PointMasks|object|false|true|None|
|PointIds|[integer]|false|true|None|
|PointList|[QueryPIPointListExDto](#schemaquerypipointlistexdto)|false|true|None|

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None|
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
|CancellationRequested|9||
|Cancelled|10||
|CancellationFailed|11||
|Unknown|-1||

---

### PIPointQueryDto

<a id="schemapipointquerydto"></a>
<a id="schema_PIPointQueryDto"></a>
<a id="tocSpipointquerydto"></a>
<a id="tocspipointquerydto"></a>

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|HistoricalDataStartTime|date-time|true|false|None|
|Description|string|false|true|None|
|PIPointIds|[integer]|false|true|None|
|AFElementIds|string[]|false|true|None|
|Name|string|false|true|None|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None|
|TotalPointsInTransfer|int64|false|false|None|
|AutoDeleteCloudObjects|boolean|false|false|None|
|VerboseLoggingConfiguration|[VerboseLoggingConfigurationDto](#schemaverboseloggingconfigurationdto)|false|true|None|

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
  "AutoDeleteCloudObjects": true,
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
  }
}

```

---

### QueryCreateUpdateDto

<a id="schemaquerycreateupdatedto"></a>
<a id="schema_QueryCreateUpdateDto"></a>
<a id="tocSquerycreateupdatedto"></a>
<a id="tocsquerycreateupdatedto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|QueryType|[QueryTypes](#schemaquerytypes)|false|true|None|
|PI|[QueryPIDto](#schemaquerypidto)|false|true|None|
|AF|[QueryAFDto](#schemaqueryafdto)|false|true|None|
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
  "Skip": 0,
  "Count": 100
}

```

---

### PatchDto

<a id="schemapatchdto"></a>
<a id="schema_PatchDto"></a>
<a id="tocSpatchdto"></a>
<a id="tocspatchdto"></a>

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Description|string|false|true|None|
|Name|string|false|true|None|
|MetadataPrivacy|[DataPrivacy](#schemadataprivacy)|false|false|None|
|PIPointIds|[integer]|false|true|None|
|AFElementIds|string[]|false|true|None|
|HistoricalDataStartTime|date-time|false|true|None|
|ExpectedTransferRevisionNumber|int32|true|false|None|
|AutoDeleteCloudObjects|boolean|false|true|None|
|VerboseLoggingConfiguration|[VerboseLoggingConfigurationDto](#schemaverboseloggingconfigurationdto)|false|true|None|
|TotalPointsInTransfer|int64|false|false|None|

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
  "AutoDeleteCloudObjects": true,
  "VerboseLoggingConfiguration": {
    "TransferId": "string",
    "Enabled": true,
    "ExpirationDate": "2019-08-24T14:15:22Z",
    "PIPointIdArray": [
      0
    ],
    "AFElementIdArray": [
      "string"
    ]
  },
  "TotalPointsInTransfer": 0
}

```

---

### TransferUpdateStatusDto

<a id="schematransferupdatestatusdto"></a>
<a id="schema_TransferUpdateStatusDto"></a>
<a id="tocStransferupdatestatusdto"></a>
<a id="tocstransferupdatestatusdto"></a>

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

