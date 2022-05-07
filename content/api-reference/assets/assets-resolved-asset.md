---
uid: assets-resolved-asset

---

# Resolved Asset

## `Get Resolved Asset`

<a id="opIdResolvedAsset_Get Resolved Asset"></a>

Returns resolved view of specified asset.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Resolved
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string assetId`
<br/>Asset identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResolvedAsset](#schemaresolvedasset)|Resolved asset with specified identifier.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|
|403|None|Forbidden.|
|404|[ErrorTemplate](#schemaerrortemplate)|Not found.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "Heater-8911ee90-467b-4a3f-bc7b-3b3512c23dfc",
  "Name": "Heater Asset",
  "Resolved": true,
  "Description": "Heater Asset on the first floor.",
  "AssetTypeId": "Heater_AssetType-6f53c911-f5de-4b7f-981f-d6f0ec139d9f",
  "AssetTypeName": "Heater_AssetType",
  "Metadata": [
    {
      "Name": "ModelNumber",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "Streams": [
    {
      "Name": "ResolvedReferenceName1",
      "Type": {
        "Id": "SdsType-ffdf2227-50e8-4196-b828-f1bd2b3689c8",
        "SdsTypeCode": "Object",
        "Properties": [
          {
            "Id": "Timestamp",
            "IsKey": true,
            "SdsType": {
              "Id": "0573b425-368a-369b-95d9-71c863df45a5",
              "SdsTypeCode": "DateTime"
            },
            "InterpolationMode": "Continuous"
          },
          {
            "Id": "Pressure",
            "SdsType": {
              "Id": "9144b7d6-3d5f-3b29-8131-ff0db551e17c",
              "SdsTypeCode": "Double"
            },
            "Uom": "bar",
            "InterpolationMode": "Continuous"
          }
        ]
      },
      "StreamReferenceName": "ResolvedReferenceName1",
      "StreamId": "Stream-b3c7a344-ce8a-4578-b4cd-1a6d78ca0610",
      "PropertyMaps": [
        {
          "Id": "Timestamp",
          "SourcePropertyId": "Timestamp"
        },
        {
          "Id": "Pressure",
          "SourcePropertyId": "Pressure"
        }
      ]
    }
  ],
  "UnresolvedStreams": [],
  "UnresolvedMetadata": [],
  "StatusDefinitionType": "StreamPropertyMapping",
  "Status": {
    "StreamId": "SdsStream_id_1",
    "SourcePropertyId": "Count"
  }
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

# Resolved Asset

## `Bulk Get Resolved Assets`

<a id="opIdRequestManager_Bulk Get Resolved Assets"></a>

Returns multiple resolved assets.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Assets/Resolved
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

Asset identifiers<br/>

```json
[
  "AssetId-1",
  "AssetId-2"
]
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[MultiStatusResultOfResolvedAssetAndChildErrorTemplate](#schemamultistatusresultofresolvedassetandchilderrortemplate)|Returns the resolved view of multiple assets.|
|207|[MultiStatusResultOfStringAndChildErrorTemplate](#schemamultistatusresultofstringandchilderrortemplate)|Partial success. Not all assets were able to be resolved. See response body for additional details.|
|400|[ErrorTemplate](#schemaerrortemplate)|Request is not valid. See the response body for additional details.|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "Id": "AssetId-1",
    "Name": "Asset1",
    "Description": "An example asset.",
    "AssetTypeId": "Asset1Type",
    "AssetTypeName": "NameOfAsset1Type",
    "Metadata": [
      {
        "Id": "Metadata1",
        "Name": "Metadata1",
        "Description": "Description of Metadata1",
        "SdsTypeCode": "String",
        "Value": "This is an example metadata for example asset",
        "Uom": null
      }
    ],
    "Streams": [
      {
        "Name": "StreamReference1",
        "Properties": [
          {
            "Id": "SdsStream_1",
            "IsKey": true,
            "Uom": null,
            "Order": 0,
            "InterpolationMode": "Default",
            "ExtrapolationMode": "All",
            "SdsType": "SimpleSdsType",
            "Source": null
          }
        ]
      }
    ],
    "UnresolvedStreams": [
      {}
    ],
    "Status": {}
  },
  {
    "Id": "AssetId-2",
    "Name": "Asset2",
    "Description": "A second example asset.",
    "AssetTypeId": null,
    "AssetTypeName": null,
    "Metadata": [
      {
        "Id": "Metadata2",
        "Name": "Metadata2",
        "Description": "Description of Metadata2",
        "SdsTypeCode": "String",
        "Value": "This is an example metadata for example asset 2",
        "Uom": null
      }
    ],
    "Streams": [
      {}
    ],
    "UnresolvedStreams": [
      {}
    ],
    "Status": {}
  }
]
```

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

### ResolvedAsset

<a id="schemaresolvedasset"></a>
<a id="schema_ResolvedAsset"></a>
<a id="tocSresolvedasset"></a>
<a id="tocsresolvedasset"></a>

The resolved asset describes the consumption-oriented aspects of a resource rather than describing how the resource is configured. The resolved asset corresponds to its metadata and referenced stream which define how the data is interpreted (that is, SdsTypeCode, InterpolationMode, and Uom).

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Asset identifier|
|Name|string|false|true|Asset name|
|Resolved|boolean|false|false|Always true. Reserved for future use|
|Description|string|false|true|Resolved description. If description is null on the asset and the asset has an asset type, then the resolved description comes from the asset type.|
|AssetTypeId|string|false|true|Asset type identifier of the resolved asset. This field will be null if the asset does not have an asset type.|
|AssetTypeName|string|false|true|Asset type name of the resolved asset. This field will be null if the asset does not have an asset type.|
|ShapeId|string|false|true|Reserved for future use|
|ShapeName|string|false|true|Reserved for future use|
|Metadata|[[ResolvedMetadataItem](#schemaresolvedmetadataitem)]|false|true|Resolved metadata. The metadata is the union of the metadata from the asset and asset type.|
|Streams|[[ResolvedStream](#schemaresolvedstream)]|false|true|Resolved asset stream references|
|UnresolvedStreams|[[UnresolvedStream](#schemaunresolvedstream)]|false|true|Resolved asset unresolved streams|
|UnresolvedMetadata|[[UnresolvedMetadata](#schemaunresolvedmetadata)]|false|true|Unresolved metadata will always be empty. Reserved for future use.|
|StatusDefinitionType|[StatusDefinitionType](#schemastatusdefinitiontype)|false|false|Resolved asset status definition|
|Status|any|false|true|Resolved asset status|
|UnresolvedStatus|[UnresolvedStatus](#schemaunresolvedstatus)|false|true|Resolved asset unresolved status|
|Tags|string[]|false|true|Resolved asset tags|

```json
{
  "Id": "Heater-8911ee90-467b-4a3f-bc7b-3b3512c23dfc",
  "Name": "Heater Asset",
  "Resolved": true,
  "Description": "Heater Asset on the first floor.",
  "AssetTypeId": "Heater_AssetType-6f53c911-f5de-4b7f-981f-d6f0ec139d9f",
  "AssetTypeName": "Heater_AssetType",
  "Metadata": [
    {
      "Name": "ModelNumber",
      "SdsTypeCode": "Double",
      "Value": 0.01
    }
  ],
  "Streams": [
    {
      "Name": "ResolvedReferenceName1",
      "Type": {
        "Id": "SdsType-ffdf2227-50e8-4196-b828-f1bd2b3689c8",
        "SdsTypeCode": "Object",
        "Properties": [
          {
            "Id": "Timestamp",
            "IsKey": true,
            "SdsType": {
              "Id": "0573b425-368a-369b-95d9-71c863df45a5",
              "SdsTypeCode": "DateTime"
            },
            "InterpolationMode": "Continuous"
          },
          {
            "Id": "Pressure",
            "SdsType": {
              "Id": "9144b7d6-3d5f-3b29-8131-ff0db551e17c",
              "SdsTypeCode": "Double"
            },
            "Uom": "bar",
            "InterpolationMode": "Continuous"
          }
        ]
      },
      "StreamReferenceName": "ResolvedReferenceName1",
      "StreamId": "Stream-b3c7a344-ce8a-4578-b4cd-1a6d78ca0610",
      "PropertyMaps": [
        {
          "Id": "Timestamp",
          "SourcePropertyId": "Timestamp"
        },
        {
          "Id": "Pressure",
          "SourcePropertyId": "Pressure"
        }
      ]
    }
  ],
  "UnresolvedStreams": [],
  "UnresolvedMetadata": [],
  "StatusDefinitionType": "StreamPropertyMapping",
  "Status": {
    "StreamId": "SdsStream_id_1",
    "SourcePropertyId": "Count"
  }
}

```

---

### ResolvedMetadataItem

<a id="schemaresolvedmetadataitem"></a>
<a id="schema_ResolvedMetadataItem"></a>
<a id="tocSresolvedmetadataitem"></a>
<a id="tocsresolvedmetadataitem"></a>

Resolved metadata is a property of a resolved asset.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Metadata name|
|SdsTypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|Metadata data type represented as an SdsTypeCode|
|Value|any|false|true|Metadata static value|
|Uom|string|false|true|Metadata unit of measurement|

```json
{
  "Name": "ModelNumber",
  "SdsTypeCode": "Double",
  "Value": 0.01
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

### ResolvedStream

<a id="schemaresolvedstream"></a>
<a id="schema_ResolvedStream"></a>
<a id="tocSresolvedstream"></a>
<a id="tocsresolvedstream"></a>

Resolved stream is a property of the resolved asset.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Resolved stream name. The resolved stream name corresponds to the stream reference name as defined in the stream reference on the asset.|
|Type|[SdsType](#schemasdstype)|false|true|SdsType of the referenced stream|
|StreamReferenceName|string|false|true|Stream reference name used in the asset|
|StreamId|string|false|true|SDS stream identifier of the referenced stream|
|PropertyMaps|[[PropertyMap](#schemapropertymap)]|false|true|SDS stream property maps|

```json
{
  "Name": "string",
  "Type": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SdsTypeCode": 0,
    "IsGenericType": true,
    "IsReferenceType": true,
    "GenericArguments": "[<SdsType>]",
    "Properties": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "Order": 0,
        "IsKey": true,
        "FixedSize": 0,
        "SdsType": "<SdsType>",
        "Value": null,
        "Uom": "string",
        "InterpolationMode": 0,
        "IsQuality": true
      }
    ],
    "BaseType": "<SdsType>",
    "DerivedTypes": "[<SdsType>]",
    "InterpolationMode": 0,
    "ExtrapolationMode": 0
  },
  "StreamReferenceName": "string",
  "StreamId": "string",
  "PropertyMaps": [
    {
      "Id": "Timestamp",
      "SourcePropertyId": "Timestamp"
    }
  ]
}

```

---

### SdsType

<a id="schemasdstype"></a>
<a id="schema_SdsType"></a>
<a id="tocSsdstype"></a>
<a id="tocssdstype"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|SdsTypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|None|
|IsGenericType|boolean|false|false|None|
|IsReferenceType|boolean|false|false|None|
|GenericArguments|[[SdsType](#schemasdstype)]|false|true|None|
|Properties|[[SdsTypeProperty](#schemasdstypeproperty)]|false|true|None|
|BaseType|[SdsType](#schemasdstype)|false|true|None|
|DerivedTypes|[[SdsType](#schemasdstype)]|false|true|None|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|false|None|
|ExtrapolationMode|[SdsExtrapolationMode](#schemasdsextrapolationmode)|false|false|None|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SdsTypeCode": 0,
  "IsGenericType": true,
  "IsReferenceType": true,
  "GenericArguments": "[<SdsType>]",
  "Properties": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "Order": 0,
      "IsKey": true,
      "FixedSize": 0,
      "SdsType": "<SdsType>",
      "Value": null,
      "Uom": "string",
      "InterpolationMode": 0,
      "IsQuality": true
    }
  ],
  "BaseType": "<SdsType>",
  "DerivedTypes": "[<SdsType>]",
  "InterpolationMode": 0,
  "ExtrapolationMode": 0
}

```

---

### SdsTypeProperty

<a id="schemasdstypeproperty"></a>
<a id="schema_SdsTypeProperty"></a>
<a id="tocSsdstypeproperty"></a>
<a id="tocssdstypeproperty"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|Order|int32|false|false|None|
|IsKey|boolean|false|false|None|
|FixedSize|int32|false|false|None|
|SdsType|[SdsType](#schemasdstype)|false|true|None|
|Value|any|false|true|None|
|Uom|string|false|true|None|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|true|None|
|IsQuality|boolean|false|false|None|

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
    "GenericArguments": "[<SdsType>]",
    "Properties": "[<SdsTypeProperty>]",
    "BaseType": "<SdsType>",
    "DerivedTypes": "[<SdsType>]",
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

<h4>Enumerated Values</h4>

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

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|All|0|
|None|1|
|Forward|2|
|Backward|3|

---

### PropertyMap

<a id="schemapropertymap"></a>
<a id="schema_PropertyMap"></a>
<a id="tocSpropertymap"></a>
<a id="tocspropertymap"></a>

Property map

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Renamed Stream property identifier. Currently, Id and SourcePropertyId will always be the same. This field mapping is reserved for future use.|
|SourcePropertyId|string|false|true|The original name of the Stream Property Id as defined in the Sequential Data Store (SDS).|

```json
{
  "Id": "Timestamp",
  "SourcePropertyId": "Timestamp"
}

```

---

### UnresolvedStream

<a id="schemaunresolvedstream"></a>
<a id="schema_UnresolvedStream"></a>
<a id="tocSunresolvedstream"></a>
<a id="tocsunresolvedstream"></a>

Unresolved stream, a property of the resolved asset, is a stream that could not be resolved.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Name of the stream reference that could not be resolved|
|Reason|string|false|true|Reason why the stream reference could not be resolved|

```json
"{\n    \"Name\": \"InputTemperature\",\n    \"Reason\": \"SDS Stream 'temperature' not found\"\"\n}"

```

---

### UnresolvedMetadata

<a id="schemaunresolvedmetadata"></a>
<a id="schema_UnresolvedMetadata"></a>
<a id="tocSunresolvedmetadata"></a>
<a id="tocsunresolvedmetadata"></a>

Reserved for future use. In the current implementation, the UnresolvedMetadata will always be an empty list.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Name of the metadata which could not be resolved.|
|Reason|string|false|true|Reason why the metadata could not be resolved.|

```json
{
  "Name": "string",
  "Reason": "string"
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

|Property|Value|Description|
|---|---|---|
|Unspecified|0|Status definition type. Currently, only StreamPropertyMapping is supported.|
|StreamPropertyMapping|1|Status definition type. Currently, only StreamPropertyMapping is supported.|

---

### UnresolvedStatus

<a id="schemaunresolvedstatus"></a>
<a id="schema_UnresolvedStatus"></a>
<a id="tocSunresolvedstatus"></a>
<a id="tocsunresolvedstatus"></a>

Unresolved status, a property of the resolved asset, means asset status could not be resolved.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Reason|string|false|true|Reason why the status could not be resolved.|

```json
{
  "Reason": "Reason why status could not be resolved."
}

```

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

### MultiStatusResultOfResolvedAssetAndChildErrorTemplate

<a id="schemamultistatusresultofresolvedassetandchilderrortemplate"></a>
<a id="schema_MultiStatusResultOfResolvedAssetAndChildErrorTemplate"></a>
<a id="tocSmultistatusresultofresolvedassetandchilderrortemplate"></a>
<a id="tocsmultistatusresultofresolvedassetandchilderrortemplate"></a>

A multi status result is returned to indicate a partial success.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Reason|string|false|true|Failure reason.|
|Error|string|false|true|Error string|
|OperationId|string|false|true|Operational identifier of the call. Used for support.|
|Data|[[ResolvedAsset](#schemaresolvedasset)]|false|true|Requested information from call.|
|ChildErrors|[[ChildErrorTemplate](#schemachilderrortemplate)]|false|true|Child error pertaining to specific resources.|

```json
{
  "Reason": "string",
  "Error": "string",
  "OperationId": "string",
  "Data": [
    {
      "Id": "Heater-8911ee90-467b-4a3f-bc7b-3b3512c23dfc",
      "Name": "Heater Asset",
      "Resolved": true,
      "Description": "Heater Asset on the first floor.",
      "AssetTypeId": "Heater_AssetType-6f53c911-f5de-4b7f-981f-d6f0ec139d9f",
      "AssetTypeName": "Heater_AssetType",
      "Metadata": [
        {
          "Name": "ModelNumber",
          "SdsTypeCode": "Double",
          "Value": 0.01
        }
      ],
      "Streams": [
        {
          "Name": "ResolvedReferenceName1",
          "Type": {
            "Id": "SdsType-ffdf2227-50e8-4196-b828-f1bd2b3689c8",
            "SdsTypeCode": "Object",
            "Properties": [
              {
                "Id": "Timestamp",
                "IsKey": true,
                "SdsType": {
                  "Id": "0573b425-368a-369b-95d9-71c863df45a5",
                  "SdsTypeCode": "DateTime"
                },
                "InterpolationMode": "Continuous"
              },
              {
                "Id": "Pressure",
                "SdsType": {
                  "Id": "9144b7d6-3d5f-3b29-8131-ff0db551e17c",
                  "SdsTypeCode": "Double"
                },
                "Uom": "bar",
                "InterpolationMode": "Continuous"
              }
            ]
          },
          "StreamReferenceName": "ResolvedReferenceName1",
          "StreamId": "Stream-b3c7a344-ce8a-4578-b4cd-1a6d78ca0610",
          "PropertyMaps": [
            {
              "Id": "Timestamp",
              "SourcePropertyId": "Timestamp"
            },
            {
              "Id": "Pressure",
              "SourcePropertyId": "Pressure"
            }
          ]
        }
      ],
      "UnresolvedStreams": [],
      "UnresolvedMetadata": [],
      "StatusDefinitionType": "StreamPropertyMapping",
      "Status": {
        "StreamId": "SdsStream_id_1",
        "SourcePropertyId": "Count"
      }
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

