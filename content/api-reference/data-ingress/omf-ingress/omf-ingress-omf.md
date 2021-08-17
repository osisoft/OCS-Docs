---
uid: omf-ingress-omf

---

# OSIsoft Message Format

## `Post OMF Message`

<a id="opIdOmf_Post Omf Message"></a>

[Full OMF Specification](https://omf-docs.osisoft.com)

### Request
```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/omf
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

#### Request Headers

|Header|Type|Required|Description|
|---|---|---|---|
|MessageType|string|true|Describes the type of message contained in the message body. One of: `type`, `container`, or `data`.|
|MessageFormat|string|true|Describes the data serialization format employed in the message body. Currently limited to `json`.|
|OmfVersion|string|true|Specifies the version of the OSIsoft Message Format used in the message. Current supported versions are `1.0`, `1.1`, and `1.2`.|
|Action|string|false|Describes the action to be performed using the data in the message body. One of: `create`, `update`, or `delete`.
If omitted, `create` is assumed.|
|Compression|string|false|The compression algorithm used to compress the message body. Currently limited to `gzip`. 
If not specified, the message body is assumed to be uncompressed.|

### Response

|Status Code|Body Type|Description|
|---|---|---|
|202|[OmfResponseBody](#schemaomfresponsebody)|An Operation-Id which can be used to troubleshoot data ingress errors.|

#### Example response body
> 202 Response

```json
{
  "Operation-Id": "9d178275-5385-4414-8cc0-dbf3f8759686"
}
```

---
## Definitions

### OmfResponseBody

<a id="schemaomfresponsebody"></a>
<a id="schema_OmfResponseBody"></a>
<a id="tocSomfresponsebody"></a>
<a id="tocsomfresponsebody"></a>

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Operation-Id|string|false|true|The `Operation-Id` associated with this request. If there are any issues with data flow, contact OSIsoft Technical Support with this value.|

```json
{
  "Operation-Id": "9d178275-5385-4414-8cc0-dbf3f8759686"
}

```

---

