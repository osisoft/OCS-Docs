---
uid: ResolvedDataViewPreviewAPI

---

# Preview resolved data views

This portion of the overall [data views API](xref:DataViewsAPIOverview) specifies the resources that resolve per-user for an input data view. The preview APIs require a data view to be passed in the request body for each request, which provides the user the flexibility to change the data view on the fly without saving/updating it.

## `Get Available Field Sets`

<a id="opIdPreviewDataViewsResolved_Get Available Field Sets"></a>

Returns the collection of field sets that are available for use in the data view, and which are not already included in the data view.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/dataviews/resolved/availablefieldsets
?cache={cache}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string cache`
<br/>"Refresh" to force the resource to re-resolve.<br/>"Preserve" to use cached information, if available. This is the default value.<br/><br/>

<h4>Request Body</h4>

A `DataView` object to get the results for.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "IndexField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  },
  "Queries": [
    {
      "Id": "string",
      "Kind": 1,
      "Value": "string"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "DefaultStartIndex": "string",
  "DefaultEndIndex": "string",
  "DefaultInterval": "string",
  "IndexTypeCode": 0,
  "Shape": 0
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResolvedItemsOfFieldSet](#schemaresolveditemsoffieldset)|An object with a "TimeOfResolution" and a collection of "Items", the `FieldSet`s that resolved and which are still available.|
|400|[ErrorResponse](#schemaerrorresponse)|The data view or the query parameters are not valid. See the response body for details.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
    "Items": [
        {
            "QueryId": "weather",
            "DataFields": [
                {
                    "Source": "Id",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Id"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} SolarRadiation {Uom} {SummaryType}"
                },
                {
                    "Source": "Metadata",
                    "Keys": [
                        "Site"
                    ],
                    "Label": "{IdentifyingValue} Site {Uom}"
                },
                {
                    "Source": "Tags",
                    "Keys": [
                        "Weather",
                        "Low Resolution",
                        "High Resolution",
                        "Gen1",
                        "Gen2",
                    ],
                    "Label": "{IdentifyingValue} Tags"
                }
            ]
        }
    ]
}
```
> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get All Field Sets`

<a id="opIdPreviewDataViewsResolved_Get All Field Sets"></a>

ERROR: Parameter "allfieldsets-get" could not be found in external reference file

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/dataviews/resolved/allfieldsets
?cache={cache}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string cache`
<br/>"Refresh" to force the resource to re-resolve.<br/>"Preserve" to use cached information, if available. This is the default value.<br/><br/>

<h4>Request Body</h4>

A `DataView` object to get the results for.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "IndexField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  },
  "Queries": [
    {
      "Id": "string",
      "Kind": 1,
      "Value": "string"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "DefaultStartIndex": "string",
  "DefaultEndIndex": "string",
  "DefaultInterval": "string",
  "IndexTypeCode": 0,
  "Shape": 0
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResolvedItemsOfFieldSet](#schemaresolveditemsoffieldset)|An object with a "TimeOfResolution" and a collection of "Items", the `FieldSet`s that resolved and which are still available.|
|400|[ErrorResponse](#schemaerrorresponse)|The data view or the query parameters are not valid. See the response body for details.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "ERROR": "Parameter \"allfieldsets-get\" could not be found in external reference file"
}
```

> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Statistics`

<a id="opIdPreviewDataViewsResolved_Get Statistics"></a>

Returns the statistics about the size and shape on how the data view resolved. 

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/dataviews/resolved/statistics
?cache={cache}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string cache`
<br/>"Refresh" to force the resource to re-resolve.<br/>"Preserve" to use cached information, if available. This is the default value.<br/><br/>

<h4>Request Body</h4>

A `DataView` object to get the results for.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "IndexField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  },
  "Queries": [
    {
      "Id": "string",
      "Kind": 1,
      "Value": "string"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "DefaultStartIndex": "string",
  "DefaultEndIndex": "string",
  "DefaultInterval": "string",
  "IndexTypeCode": 0,
  "Shape": 0
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResolvedItemOfStatistics](#schemaresolveditemofstatistics)|Successfully retrieved data.|
|400|[ErrorResponse](#schemaerrorresponse)|The data view or the query parameters are not valid. See the response body for details.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
    "DataItemCount": 24,
    "GroupCount": 2,
    "FieldMappingCount": 10,
    "DataFieldSets": [
        {
            "DataItemCount": 18,
            "UnmappedDataItemCount": 3,
            "DataFields": [
                {
                    "FieldMappingCount": 3,
                    "DataMappingCount": 6,
                    "EmptyDataMappingCount": 0,
                    "UnmappedGroupCount": 0
                },
                {
                    "FieldMappingCount": 3,
                    "DataMappingCount": 6,
                    "EmptyDataMappingCount": 2,
                    "UnmappedGroupCount": 1
                }
            ]
        },
        {
            "DataItemCount": 6,
            "UnmappedDataItemCount": 0,
            "DataFields": [
                {
                    "FieldMappingCount": 2,
                    "DataMappingCount": 4,
                    "EmptyDataMappingCount": 2,
                    "UnmappedGroupCount": 1
                }
            ]
        }
    ]
}
```
> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Data Items by Query`

<a id="opIdPreviewDataViewsResolved_Get Data Items by Query"></a>

Returns the paged collection of data items that are the results of an individual query, and which are eligible for use in the current data view. A data view has a collection of zero or more queries. Each query has an identifier. Those identifiers are used here as part of the request path.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/dataviews/resolved/dataitems/{queryId}
?cache={cache}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string queryId`
<br/>Query identifier.<br/><br/>
`[optional] string cache`
<br/>"Refresh" to force the resource to re-resolve.<br/>"Preserve" to use cached information, if available. This is the default value.<br/><br/>`[optional] integer skip`
<br/>An optional parameter representing the zero-based offset of the first data item to retrieve. If not specified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>An optional parameter representing the maximum number of data items to retrieve. If not specified, a default value of 100 is used.<br/><br/>

<h4>Request Body</h4>

A `DataView` object to get the results for.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "IndexField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  },
  "Queries": [
    {
      "Id": "string",
      "Kind": 1,
      "Value": "string"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "DefaultStartIndex": "string",
  "DefaultEndIndex": "string",
  "DefaultInterval": "string",
  "IndexTypeCode": 0,
  "Shape": 0
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResolvedItemsOfDataItem](#schemaresolveditemsofdataitem)|An object with a "TimeOfResolution" and a collection of "Items", the `DataItem`s that resolved.|
|400|[ErrorResponse](#schemaerrorresponse)|The data view or the query parameters are not valid. See the response body for details.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total count of data items visible to the current user.|
|200|Link|string|Hyperlinks to the first page and next page of results as applicable.|
|200|Next-Page|string|Hyperlink to the next page of results.|
|200|First-Page|string|Hyperlink to the first page of results.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
Content-Type: application/json  
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
    {
      "Id": "WS_BILT",
      "Name": "WS_BILT",
      "TypeId": "quickstart-omf-weather-gen1",
      "ResourceType": "Stream",
      "Tags": [
        "Weather",
        "High Resolution",
        "Gen1"
       ],
       "Metadata": [
         {
           "Name": "Site",
           "Value": "Biltmore",
           "TypeCode": "String"
         }
       ],
       "DataItemFields": [
         {
           "Id": "Timestamp",
           "Name": "Timestamp",
           "TypeCode": "DateTime",
           "IsKey": true
         },
         {
           "Id": "SolarRadiation",
           "Name": "SolarRadiation",
           "TypeCode": "Int32",
           "IsKey": false
         },
         {
           "Id": "Temperature",
           "Name": "Temperature",
           "TypeCode": "Double",
           "IsKey": false
         }
      ],
      "IneligibleDataItemFields": []
    }
  ]
}
```
> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Ineligible Data Items by Query`

<a id="opIdPreviewDataViewsResolved_Get Ineligible Data Items by Query"></a>

Returns the paged collection of data items that are the results of an individual query, but which are not eligible for use in the current data view. A common reason for ineligibility is that the item's index property is of a different type than the data view expects. A data view has a collection of zero or more queries. Each query has an identifier. Those identifiers are used here as part of the request path.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/dataviews/resolved/ineligibledataitems/{queryId}
?cache={cache}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string queryId`
<br/>Query identifier.<br/><br/>
`[optional] string cache`
<br/>"Refresh" to force the resource to re-resolve.<br/>"Preserve" to use cached information, if available. This is the default value.<br/><br/>`[optional] integer skip`
<br/>An optional parameter representing the zero-based offset of the first data item to retrieve. If not specified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>An optional parameter representing the maximum number of data items to retrieve. If not specified, a default value of 100 is used.<br/><br/>

<h4>Request Body</h4>

A `DataView` object to get the results for.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "IndexField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  },
  "Queries": [
    {
      "Id": "string",
      "Kind": 1,
      "Value": "string"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "DefaultStartIndex": "string",
  "DefaultEndIndex": "string",
  "DefaultInterval": "string",
  "IndexTypeCode": 0,
  "Shape": 0
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResolvedItemsOfDataItem](#schemaresolveditemsofdataitem)|An object with a "TimeOfResolution" and a collection of "Items", the `DataItem`s that resolved.|
|400|[ErrorResponse](#schemaerrorresponse)|The data view or the query parameters are not valid. See the response body for details.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total count of data items visible to the current user.|
|200|Link|string|Hyperlinks to the first page and next page of results as applicable.|
|200|Next-Page|string|Hyperlink to the next page of results.|
|200|First-Page|string|Hyperlink to the first page of results.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
Content-Type: application/json
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
    {
      "Id": "SOME_INELIGIBLE_STREAM",
      "Name": "Some Ineligible Stream",
      "TypeId": "type-with-different-index",
      "ResourceType": "Stream",
      "Tags": [],
      "Metadata": [],
      "DataItemFields": [],
      "IneligibleDataItemFields": [
         {
           "Id": "Depth",
           "Name": "Depth",
           "TypeCode": "Double",
           "IsKey": true
         },
         {
           "Id": "Density",
           "Name": "Density",
           "TypeCode": "Double",
           "IsKey": false
         }
      ]
    }
  ]
}
```
# access control responses
> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Field Mappings`

<a id="opIdPreviewDataViewsResolved_Get Field Mappings"></a>

Returns the collection of field mappings resolved for the data view. These show the exact data behind every field, for each data item, for each group.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/dataviews/resolved/fieldmappings
?cache={cache}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string cache`
<br/>"Refresh" to force the resource to re-resolve.<br/>"Preserve" to use cached information, if available. This is the default value.<br/><br/>`[optional] integer skip`
<br/>An optional parameter representing the zero-based offset of the first field mapping to retrieve. If not specified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>An optional parameter representing the maximum number of field mappings to retrieve. If not specified, a default value of 100 is used.<br/><br/>

<h4>Request Body</h4>

A `DataView` object to get the results for.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "IndexField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  },
  "Queries": [
    {
      "Id": "string",
      "Kind": 1,
      "Value": "string"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "DefaultStartIndex": "string",
  "DefaultEndIndex": "string",
  "DefaultInterval": "string",
  "IndexTypeCode": 0,
  "Shape": 0
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResolvedItemsOfFieldMapping](#schemaresolveditemsoffieldmapping)|An object with a "TimeOfResolution" and a collection of "Items", the `FieldMapping`s that resolved.|
|400|[ErrorResponse](#schemaerrorresponse)|The data view or the query parameters are not valid. See the response body for details.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total count of field mappings.|
|200|Link|string|Hyperlinks to the first page and next page of results as applicable.|
|200|Next-Page|string|Hyperlink to the next page of results.|
|200|First-Page|string|Hyperlink to the first page of results.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
    "Items": [
      {
        "Id": "Timestamp",
        "Label": "Timestamp",
        "FieldKind": "IndexField",
        "TypeCode": "DateTime",
        "DataMappings": [
          {
            "TypeCode": "DateTime"
          },
          {
            "TypeCode": "DateTime"
          },
          {
            "TypeCode": "DateTime"
          }
        ]
      },
      {
        "Id": "Temperature",
        "Label": "Temperature",
        "FieldKind": "DataField",
        "TypeCode": "Double",
        "DataMappings": [
          {
            "TargetId": "WS_BILT",
            "TargetFieldKey": "Temperature",
            "TypeCode": "Double",
            "FieldSetIndex": 1,
            "FieldIndex": 0
          },
          {
            "TargetId": "WS_ROSE",
            "TargetFieldKey": "Temperature",
            "TypeCode": "Double",
            "FieldSetIndex": 1,
            "FieldIndex": 0
          },
          {
            "TargetId": "WS_WINT",
            "TargetFieldKey": "AmbientTemperature",
            "TypeCode": "Double",
            "FieldSetIndex": 1,
            "FieldIndex": 0
          }
        ]
      },
    ]
}
```
> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Groups`

<a id="opIdPreviewDataViewsResolved_Get Groups"></a>

Returns the collection of `Group`s that resolved for the data view.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/preview/dataviews/resolved/groups
?cache={cache}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string cache`
<br/>"Refresh" to force the resource to re-resolve.<br/>"Preserve" to use cached information, if available. This is the default value.<br/><br/>`[optional] integer skip`
<br/>An optional parameter representing the zero-based offset of the first group to retrieve. If not specified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>An optional parameter representing the maximum number of groups to retrieve. If not specified, a default value of 100 is used.<br/><br/>

<h4>Request Body</h4>

A `DataView` object to get the results for.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "IndexField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  },
  "Queries": [
    {
      "Id": "string",
      "Kind": 1,
      "Value": "string"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "DefaultStartIndex": "string",
  "DefaultEndIndex": "string",
  "DefaultInterval": "string",
  "IndexTypeCode": 0,
  "Shape": 0
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResolvedItemsOfGroup](#schemaresolveditemsofgroup)|An object with a "TimeOfResolution" and a collection of "Items", the `Group`s that resolved.|
|400|[ErrorResponse](#schemaerrorresponse)|The data view or the query parameters are not valid. See the response body for details.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|The total count of groups.|
|200|Link|string|Hyperlinks to the first page and next page of results as applicable.|
|200|Next-Page|string|Hyperlink to the next page of results.|
|200|First-Page|string|Hyperlink to the first page of results.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
Content-Type: application/json
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
    {
      "GroupingValues": [ 
        {
          "Value": "Biltmore",
          "TypeCode": "String"
        }
      ],
      "DataItems": {
        "Query1": [
          {
            "Id": "WS_BILT",
            "Name": "WS_BILT",
            "TypeId": "quickstart-omf-weather-gen1",
            "ResourceType": "Stream",
            "Tags": [
                "Weather",
                "High Resolution",
                "Gen1"
            ],
            "Metadata": [
              {
                "Name": "Site",
                "Value": "Biltmore",
                "TypeCode": "String"
              }
            ],
            "DataItemFields": [
                {
                    "Id": "Timestamp",
                    "Name": "Timestamp",
                    "TypeCode": "DateTime",
                    "IsKey": true
                },
                {
                    "Id": "SolarRadiation",
                    "Name": "SolarRadiation",
                    "TypeCode": "Int32",
                    "IsKey": false
                },
                {
                    "Id": "Temperature",
                    "Name": "Temperature",
                    "TypeCode": "Double",
                    "IsKey": false
                }
            ],
            "IneligibleDataItemFields": []
          }
        ]
      }
    }
  ]
}
```
> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---
## Definitions

### ResolvedItemsOfFieldSet

<a id="schemaresolveditemsoffieldset"></a>
<a id="schema_ResolvedItemsOfFieldSet"></a>
<a id="tocSresolveditemsoffieldset"></a>
<a id="tocsresolveditemsoffieldset"></a>

Holds a collection of items that were resolved at a specific time.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TimeOfResolution|date-time|false|false|The time the Items were resolved|
|Items|[[FieldSet](#schemafieldset)]|false|true|The collection of items that were resolved|

```json
{
  "TimeOfResolution": "2019-08-24T14:15:22Z",
  "Items": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ]
}

```

---

### FieldSet

<a id="schemafieldset"></a>
<a id="schema_FieldSet"></a>
<a id="tocSfieldset"></a>
<a id="tocsfieldset"></a>

A set of fields defined for a particular source of data.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|QueryId|string|false|true|The identifier of the Query this field set uses.|
|DataFields|[[Field](#schemafield)]|false|true|The collection of Data Fields defined in this field set.|
|IdentifyingField|[Field](#schemafield)|false|true|The field used to identify each data item resolved by this field set.|

```json
{
  "QueryId": "string",
  "DataFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "IdentifyingField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  }
}

```

---

### Field

<a id="schemafield"></a>
<a id="schema_Field"></a>
<a id="tocSfield"></a>
<a id="tocsfield"></a>

A data field that targets information resolved within its FieldSet

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Source|[FieldSource](#schemafieldsource)|false|false|The target part of a data item, if this Field targets a data item. NotApplicable otherwise.|
|Keys|string[]|false|true|The collection of keys this field can match on its target data source Can be used to account for differences across target data types, e.g. matching either "Temperature" or "temperature_val"|
|StreamReferenceNames|string[]|false|true|The collection of possible stream reference names|
|Label|string|false|true|A friendly label|
|SummaryType|[SdsSummaryType](#schemasdssummarytype)|false|false|Specifies summary operation|
|SummaryDirection|[SummaryDirection](#schemasummarydirection)|false|true|Specifies summary direction|
|IncludeUom|boolean|false|false|Specifies whether to include this field's unit of measure as an additional field mapping in the resolved data view|

```json
{
  "Source": 0,
  "Keys": [
    "string"
  ],
  "StreamReferenceNames": [
    "string"
  ],
  "Label": "string",
  "SummaryType": 0,
  "SummaryDirection": 1,
  "IncludeUom": true
}

```

---

### FieldSource

<a id="schemafieldsource"></a>
<a id="schema_FieldSource"></a>
<a id="tocSfieldsource"></a>
<a id="tocsfieldsource"></a>

The targeted part of a DataItem

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|NotApplicable|0|
|Id|1|
|Name|2|
|PropertyId|3|
|PropertyName|4|
|Metadata|5|
|Tags|6|

---

### SdsSummaryType

<a id="schemasdssummarytype"></a>
<a id="schema_SdsSummaryType"></a>
<a id="tocSsdssummarytype"></a>
<a id="tocssdssummarytype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|None|0|
|Count|1|
|Minimum|2|
|Maximum|4|
|Range|8|
|Mean|16|
|StandardDeviation|32|
|PopulationStandardDeviation|64|
|Total|128|
|Skewness|256|
|Kurtosis|512|
|WeightedMean|1024|
|WeightedStandardDeviation|2048|
|WeightedPopulationStandardDeviation|4096|

---

### SummaryDirection

<a id="schemasummarydirection"></a>
<a id="schema_SummaryDirection"></a>
<a id="tocSsummarydirection"></a>
<a id="tocssummarydirection"></a>

Specifies summary direction for a Field

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Forward|1|
|Backward|2|

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|
|Parameters|object|false|true|None|
|ChildErrors|object|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}

```

---

### DataView

<a id="schemadataview"></a>
<a id="schema_DataView"></a>
<a id="tocSdataview"></a>
<a id="tocsdataview"></a>

A declarative way to select, label and shape data from OSIsoft Cloud Services

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|The data view's unique identifier|
|Name|string|false|true|The data view's friendly name|
|Description|string|false|true|The data view's description|
|IndexField|[Field](#schemafield)|false|true|The data view's index field|
|Queries|[[Query](#schemaquery)]|false|true|The collection of queries used by the data view|
|DataFieldSets|[[FieldSet](#schemafieldset)]|false|true|The collection of data field sets defined on the data view|
|GroupingFields|[[Field](#schemafield)]|false|true|The collection of fields to be used as grouping fields|
|DefaultStartIndex|string|false|true|The default start index used when data view data is queried, if no explicit value is specified|
|DefaultEndIndex|string|false|true|The default end index used when data view data is queried, if no explicit value is specified|
|DefaultInterval|string|false|true|The default interval used when data view data is retrieved, if no explicit value is specified|
|IndexTypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|The data type of the index field|
|Shape|[DataViewShape](#schemadataviewshape)|false|false|The output shape of the data view|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "IndexField": {
    "Source": 0,
    "Keys": [
      "string"
    ],
    "StreamReferenceNames": [
      "string"
    ],
    "Label": "string",
    "SummaryType": 0,
    "SummaryDirection": 1,
    "IncludeUom": true
  },
  "Queries": [
    {
      "Id": "string",
      "Kind": 1,
      "Value": "string"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "string",
      "DataFields": [
        {
          "Source": 0,
          "Keys": [
            "string"
          ],
          "StreamReferenceNames": [
            "string"
          ],
          "Label": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "IncludeUom": true
        }
      ],
      "IdentifyingField": {
        "Source": 0,
        "Keys": [
          "string"
        ],
        "StreamReferenceNames": [
          "string"
        ],
        "Label": "string",
        "SummaryType": 0,
        "SummaryDirection": 1,
        "IncludeUom": true
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": 0,
      "Keys": [
        "string"
      ],
      "StreamReferenceNames": [
        "string"
      ],
      "Label": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "IncludeUom": true
    }
  ],
  "DefaultStartIndex": "string",
  "DefaultEndIndex": "string",
  "DefaultInterval": "string",
  "IndexTypeCode": 0,
  "Shape": 0
}

```

---

### Query

<a id="schemaquery"></a>
<a id="schema_Query"></a>
<a id="tocSquery"></a>
<a id="tocsquery"></a>

A query for data items of a specified resource type.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|The unique identifier of this query|
|Kind|[DataItemResourceType](#schemadataitemresourcetype)|false|false|The type of resource being queried|
|Value|string|false|true|The text of this query|

```json
{
  "Id": "string",
  "Kind": 1,
  "Value": "string"
}

```

---

### DataItemResourceType

<a id="schemadataitemresourcetype"></a>
<a id="schema_DataItemResourceType"></a>
<a id="tocSdataitemresourcetype"></a>
<a id="tocsdataitemresourcetype"></a>

The type of resource that a data item represents

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Stream|1|
|Asset|2|

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

### DataViewShape

<a id="schemadataviewshape"></a>
<a id="schema_DataViewShape"></a>
<a id="tocSdataviewshape"></a>
<a id="tocsdataviewshape"></a>

The shape of the data view. By default, each Field will resolve to one or more FieldMappings. In narrow shape, all Fields that map to a DataItem are "pivoted" vertically, into two fields: Label and Value.

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Standard|0|
|Narrow|1|

---

### ResolvedItemOfStatistics

<a id="schemaresolveditemofstatistics"></a>
<a id="schema_ResolvedItemOfStatistics"></a>
<a id="tocSresolveditemofstatistics"></a>
<a id="tocsresolveditemofstatistics"></a>

Holds an item that was resolved at a specific time.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TimeOfResolution|date-time|false|false|The time the Item was resolved|
|Item|[Statistics](#schemastatistics)|false|true|The item that was resolved|

```json
{
  "TimeOfResolution": "2019-08-24T14:15:22Z",
  "Item": {
    "DataItemCount": 0,
    "GroupCount": 0,
    "FieldMappingCount": 0,
    "Queries": [
      {
        "QueryId": "string",
        "DataItemCount": 0,
        "DataItemWithIneligibleFieldsCount": 0,
        "IneligibleDataItemCount": 0
      }
    ],
    "DataFieldSets": [
      {
        "DataItemCount": 0,
        "UnmappedDataItemCount": 0,
        "DataFields": [
          {
            "FieldMappingCount": 0,
            "DataMappingCount": 0,
            "EmptyDataMappingCount": 0,
            "UnmappedGroupCount": 0
          }
        ]
      }
    ]
  }
}

```

---

### Statistics

<a id="schemastatistics"></a>
<a id="schema_Statistics"></a>
<a id="tocSstatistics"></a>
<a id="tocsstatistics"></a>

Statistics about how a data view resolved

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|DataItemCount|int32|false|false|The total count of data items resolved by the data view|
|GroupCount|int32|false|false|The total count of groups resolved by the data view|
|FieldMappingCount|int32|false|false|The total count of field mappings resolved by the data view|
|Queries|[[QueryStatistics](#schemaquerystatistics)]|false|true|Statistics about the data items resolved (or not resolved) for each query|
|DataFieldSets|[[DataFieldSetStatistics](#schemadatafieldsetstatistics)]|false|true|Statistics about how the data view data field sets resolved|

```json
{
  "DataItemCount": 0,
  "GroupCount": 0,
  "FieldMappingCount": 0,
  "Queries": [
    {
      "QueryId": "string",
      "DataItemCount": 0,
      "DataItemWithIneligibleFieldsCount": 0,
      "IneligibleDataItemCount": 0
    }
  ],
  "DataFieldSets": [
    {
      "DataItemCount": 0,
      "UnmappedDataItemCount": 0,
      "DataFields": [
        {
          "FieldMappingCount": 0,
          "DataMappingCount": 0,
          "EmptyDataMappingCount": 0,
          "UnmappedGroupCount": 0
        }
      ]
    }
  ]
}

```

---

### QueryStatistics

<a id="schemaquerystatistics"></a>
<a id="schema_QueryStatistics"></a>
<a id="tocSquerystatistics"></a>
<a id="tocsquerystatistics"></a>

Statistics about the data items associated with a particular query

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|QueryId|string|false|true|The id of the query these statistics come from|
|DataItemCount|int32|false|false|The total count of eligible data items|
|DataItemWithIneligibleFieldsCount|int32|false|false|The total count of eligible data items that have ineligible fields|
|IneligibleDataItemCount|int32|false|false|The total count of data items that are completely ineligible|

```json
{
  "QueryId": "string",
  "DataItemCount": 0,
  "DataItemWithIneligibleFieldsCount": 0,
  "IneligibleDataItemCount": 0
}

```

---

### DataFieldSetStatistics

<a id="schemadatafieldsetstatistics"></a>
<a id="schema_DataFieldSetStatistics"></a>
<a id="tocSdatafieldsetstatistics"></a>
<a id="tocsdatafieldsetstatistics"></a>

Statistics about how a data field set resolved

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|DataItemCount|int32|false|false|The total count of data items resolved for the data field set|
|UnmappedDataItemCount|int32|false|false|The total count of data items not referenced by a field mapping resolved for the data field set|
|DataFields|[[DataFieldStatistics](#schemadatafieldstatistics)]|false|true|Statistics about how the data field set data fields resolved|

```json
{
  "DataItemCount": 0,
  "UnmappedDataItemCount": 0,
  "DataFields": [
    {
      "FieldMappingCount": 0,
      "DataMappingCount": 0,
      "EmptyDataMappingCount": 0,
      "UnmappedGroupCount": 0
    }
  ]
}

```

---

### DataFieldStatistics

<a id="schemadatafieldstatistics"></a>
<a id="schema_DataFieldStatistics"></a>
<a id="tocSdatafieldstatistics"></a>
<a id="tocsdatafieldstatistics"></a>

Statistics about how a data field resolved

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|FieldMappingCount|int32|false|false|The total count of field mappings associated with the data field|
|DataMappingCount|int32|false|false|The total count of data mappings associated with the data field|
|EmptyDataMappingCount|int32|false|false|The total count of data mappings associated with the data field that do not map to any data|
|UnmappedGroupCount|int32|false|false|The total count of groups that do not map to any field mappings in the data field|

```json
{
  "FieldMappingCount": 0,
  "DataMappingCount": 0,
  "EmptyDataMappingCount": 0,
  "UnmappedGroupCount": 0
}

```

---

### ResolvedItemsOfDataItem

<a id="schemaresolveditemsofdataitem"></a>
<a id="schema_ResolvedItemsOfDataItem"></a>
<a id="tocSresolveditemsofdataitem"></a>
<a id="tocsresolveditemsofdataitem"></a>

Holds a collection of items that were resolved at a specific time.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TimeOfResolution|date-time|false|false|The time the Items were resolved|
|Items|[[DataItem](#schemadataitem)]|false|true|The collection of items that were resolved|

```json
{
  "TimeOfResolution": "2019-08-24T14:15:22Z",
  "Items": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "TypeId": "string",
      "ResourceType": 1,
      "Tags": [
        "string"
      ],
      "Metadata": [
        {
          "Name": "string",
          "Value": null,
          "Description": "string",
          "TypeCode": 0,
          "Uom": "string"
        }
      ],
      "DataItemFields": [
        {
          "Id": "string",
          "Name": "string",
          "StreamReferenceName": "string",
          "TypeCode": 0,
          "Uom": "string",
          "IsKey": true,
          "StreamId": "string"
        }
      ],
      "IneligibleDataItemFields": [
        {
          "Id": "string",
          "Name": "string",
          "StreamReferenceName": "string",
          "TypeCode": 0,
          "Uom": "string",
          "IsKey": true,
          "StreamId": "string"
        }
      ]
    }
  ]
}

```

---

### DataItem

<a id="schemadataitem"></a>
<a id="schema_DataItem"></a>
<a id="tocSdataitem"></a>
<a id="tocsdataitem"></a>

A data item resolved by the data view. Can represent various DataItemResourceTypes from OSIsoft Cloud Services

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|The data item's unique identifier|
|Name|string|false|true|The data item's friendly name|
|Description|string|false|true|The data item's description|
|TypeId|string|false|true|The identifier of the data item's type|
|ResourceType|[DataItemResourceType](#schemadataitemresourcetype)|false|false|The type of resource this data item comes from|
|Tags|string[]|false|true|The collection of tags specified on this data item|
|Metadata|[[MetadataValueOfObject](#schemametadatavalueofobject)]|false|true|The list of metadata value objects specified on this data item|
|DataItemFields|[[DataItemField](#schemadataitemfield)]|false|true|The collection of data fields this data item exposes|
|IneligibleDataItemFields|[[DataItemField](#schemadataitemfield)]|false|true|The collection of ineligible data fields this data item exposes. These fields are not supported by data views and will not be included in the available field sets These fields can be manually added to a data view but the data result will show null values.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TypeId": "string",
  "ResourceType": 1,
  "Tags": [
    "string"
  ],
  "Metadata": [
    {
      "Name": "string",
      "Value": null,
      "Description": "string",
      "TypeCode": 0,
      "Uom": "string"
    }
  ],
  "DataItemFields": [
    {
      "Id": "string",
      "Name": "string",
      "StreamReferenceName": "string",
      "TypeCode": 0,
      "Uom": "string",
      "IsKey": true,
      "StreamId": "string"
    }
  ],
  "IneligibleDataItemFields": [
    {
      "Id": "string",
      "Name": "string",
      "StreamReferenceName": "string",
      "TypeCode": 0,
      "Uom": "string",
      "IsKey": true,
      "StreamId": "string"
    }
  ]
}

```

---

### MetadataValueOfObject

<a id="schemametadatavalueofobject"></a>
<a id="schema_MetadataValueOfObject"></a>
<a id="tocSmetadatavalueofobject"></a>
<a id="tocsmetadatavalueofobject"></a>

Individual metadata value from the metadata list of a DataItem

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Name of the metadata value|
|Value|any|false|true|Value of the metadata value|
|Description|string|false|true|Description of the metadata value|
|TypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|SDS type of the metadata value|
|Uom|string|false|true|Unit of measurement of the metadata value|

```json
{
  "Name": "string",
  "Value": null,
  "Description": "string",
  "TypeCode": 0,
  "Uom": "string"
}

```

---

### DataItemField

<a id="schemadataitemfield"></a>
<a id="schema_DataItemField"></a>
<a id="tocSdataitemfield"></a>
<a id="tocsdataitemfield"></a>

A field exposed by some DataItem

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|The field's unique identifier|
|Name|string|false|true|The field's friendly name|
|StreamReferenceName|string|false|true|Name of the corresponding asset stream reference, if applicable|
|TypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|The field's data type|
|Uom|string|false|true|The field's unit of measure unique identifier|
|IsKey|boolean|false|false|Whether or not this field is its data item's primary key/index True if the field is its data item's primary key/index; false otherwise.|

```json
{
  "Id": "string",
  "Name": "string",
  "StreamReferenceName": "string",
  "TypeCode": 0,
  "Uom": "string",
  "IsKey": true
}

```

---

### ResolvedItemsOfFieldMapping

<a id="schemaresolveditemsoffieldmapping"></a>
<a id="schema_ResolvedItemsOfFieldMapping"></a>
<a id="tocSresolveditemsoffieldmapping"></a>
<a id="tocsresolveditemsoffieldmapping"></a>

Holds a collection of items that were resolved at a specific time.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TimeOfResolution|date-time|false|false|The time the Items were resolved|
|Items|[[FieldMapping](#schemafieldmapping)]|false|true|The collection of items that were resolved|

```json
{
  "TimeOfResolution": "2019-08-24T14:15:22Z",
  "Items": [
    {
      "Id": "string",
      "Label": "string",
      "FieldKind": 1,
      "TypeCode": 0,
      "Uom": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "DataMappings": [
        {
          "TargetId": "string",
          "TargetStreamReferenceName": "string",
          "TargetFieldKey": "string",
          "TypeCode": 0,
          "Uom": "string",
          "SummaryType": 0,
          "SummaryDirection": 1,
          "FieldSetIndex": 0,
          "FieldIndex": 0
        }
      ]
    }
  ]
}

```

---

### FieldMapping

<a id="schemafieldmapping"></a>
<a id="schema_FieldMapping"></a>
<a id="tocSfieldmapping"></a>
<a id="tocsfieldmapping"></a>

A resolved field of the data view, identifying its data source for each group.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|The unique identifier|
|Label|string|false|true|The friendly name|
|FieldKind|[FieldKind](#schemafieldkind)|false|false|The kind of the field|
|TypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|The primary data type of this FieldMapping. This value comes from the field mapping's first non-empty DataMapping.|
|Uom|string|false|true|The unit of measure unique identifier of this FieldMapping. Unit of measure is null unless all DataMapping unit of measures within the FieldMapping are equal.|
|SummaryType|[SdsSummaryType](#schemasdssummarytype)|false|true|The SummaryType when all DataMapping SummaryType values for this field are consistent, otherwise null.|
|SummaryDirection|[SummaryDirection](#schemasummarydirection)|false|true|The SummaryDirection when all DataMapping SummaryDirection values for this field are consistent, otherwise null.|
|DataMappings|[[DataMapping](#schemadatamapping)]|false|true|The collection of mappings corresponding indexwise to each Group resolved by the data view.|

```json
{
  "Id": "string",
  "Label": "string",
  "FieldKind": 1,
  "TypeCode": 0,
  "Uom": "string",
  "SummaryType": 0,
  "SummaryDirection": 1,
  "DataMappings": [
    {
      "TargetId": "string",
      "TargetStreamReferenceName": "string",
      "TargetFieldKey": "string",
      "TypeCode": 0,
      "Uom": "string",
      "SummaryType": 0,
      "SummaryDirection": 1,
      "FieldSetIndex": 0,
      "FieldIndex": 0
    }
  ]
}

```

---

### FieldKind

<a id="schemafieldkind"></a>
<a id="schema_FieldKind"></a>
<a id="tocSfieldkind"></a>
<a id="tocsfieldkind"></a>

Identifies the type of field

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|IndexField|1|
|GroupingField|2|
|DataField|3|
|FieldId|4|
|FieldUom|5|

---

### DataMapping

<a id="schemadatamapping"></a>
<a id="schema_DataMapping"></a>
<a id="tocSdatamapping"></a>
<a id="tocsdatamapping"></a>

Information about the data source resolved for an individual Field for a specific Group

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TargetId|string|false|true|The identifier of the target data source|
|TargetStreamReferenceName|string|false|true|The name of the target stream reference|
|TargetFieldKey|string|false|true|The subpath within the target data source Null in case of non-"keyed" mapping (e.g. stream id, as opposed to a specific Stream property)|
|TypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|The field's data type|
|Uom|string|false|true|The DataMapping's unit of measure unique identifier|
|SummaryType|[SdsSummaryType](#schemasdssummarytype)|false|false|The DataMapping's summary operation|
|SummaryDirection|[SummaryDirection](#schemasummarydirection)|false|true|The direction of the DataMapping's summary operation|
|FieldSetIndex|int32|false|true|The field set this DataMapping comes from, identified by its index in the data view's collection of FieldSets The FieldSet object is easily retrieved from the DataView's FieldSets using this index value. This only applies to FieldKind.DataField and FieldKind.FieldId.|
|FieldIndex|int32|false|true|The field corresponding to this DataMapping, identified by its index in the FieldSet's collection of Fields The Field object is easily retrieved from the FieldSet's Fields using this index value. This applies to FieldKind.GroupingField, FieldKind.DataField, and FieldKind.FieldId.|

```json
{
  "TargetId": "string",
  "TargetStreamReferenceName": "string",
  "TargetFieldKey": "string",
  "TypeCode": 0,
  "Uom": "string",
  "SummaryType": 0,
  "SummaryDirection": 1,
  "FieldSetIndex": 0,
  "FieldIndex": 0
}

```

---

### ResolvedItemsOfGroup

<a id="schemaresolveditemsofgroup"></a>
<a id="schema_ResolvedItemsOfGroup"></a>
<a id="tocSresolveditemsofgroup"></a>
<a id="tocsresolveditemsofgroup"></a>

Holds a collection of items that were resolved at a specific time.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TimeOfResolution|date-time|false|false|The time the Items were resolved|
|Items|[[Group](#schemagroup)]|false|true|The collection of items that were resolved|

```json
{
  "TimeOfResolution": "2019-08-24T14:15:22Z",
  "Items": [
    {
      "GroupingValues": [
        {
          "Value": null,
          "TypeCode": 0,
          "Uom": "string"
        }
      ],
      "DataItems": {
        "property1": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "TypeId": "string",
            "ResourceType": 1,
            "Tags": [
              "string"
            ],
            "Metadata": [
              {
                "Name": "string",
                "Value": null,
                "Description": "string",
                "TypeCode": 0,
                "Uom": "string"
              }
            ],
            "DataItemFields": [
              {
                "Id": "string",
                "Name": "string",
                "StreamReferenceName": "string",
                "TypeCode": 0,
                "Uom": "string",
                "IsKey": true,
                "StreamId": "string"
              }
            ],
            "IneligibleDataItemFields": [
              {
                "Id": "string",
                "Name": "string",
                "StreamReferenceName": "string",
                "TypeCode": 0,
                "Uom": "string",
                "IsKey": true,
                "StreamId": "string"
              }
            ]
          }
        ],
        "property2": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "TypeId": "string",
            "ResourceType": 1,
            "Tags": [
              "string"
            ],
            "Metadata": [
              {
                "Name": "string",
                "Value": null,
                "Description": "string",
                "TypeCode": 0,
                "Uom": "string"
              }
            ],
            "DataItemFields": [
              {
                "Id": "string",
                "Name": "string",
                "StreamReferenceName": "string",
                "TypeCode": 0,
                "Uom": "string",
                "IsKey": true,
                "StreamId": "string"
              }
            ],
            "IneligibleDataItemFields": [
              {
                "Id": "string",
                "Name": "string",
                "StreamReferenceName": "string",
                "TypeCode": 0,
                "Uom": "string",
                "IsKey": true,
                "StreamId": "string"
              }
            ]
          }
        ]
      }
    }
  ]
}

```

---

### Group

<a id="schemagroup"></a>
<a id="schema_Group"></a>
<a id="tocSgroup"></a>
<a id="tocsgroup"></a>

A group resolved by a data view

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|GroupingValues|[[GroupingValueOfObject](#schemagroupingvalueofobject)]|false|true|The collection of values resolved by the grouping fields defined in the data view|
|DataItems|object|false|true|The collections of data items in this group, keyed by query id|

```json
{
  "GroupingValues": [
    {
      "Value": null,
      "TypeCode": 0,
      "Uom": "string"
    }
  ],
  "DataItems": {
    "property1": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "TypeId": "string",
        "ResourceType": 1,
        "Tags": [
          "string"
        ],
        "Metadata": [
          {
            "Name": "string",
            "Value": null,
            "Description": "string",
            "TypeCode": 0,
            "Uom": "string"
          }
        ],
        "DataItemFields": [
          {
            "Id": "string",
            "Name": "string",
            "StreamReferenceName": "string",
            "TypeCode": 0,
            "Uom": "string",
            "IsKey": true,
            "StreamId": "string"
          }
        ],
        "IneligibleDataItemFields": [
          {
            "Id": "string",
            "Name": "string",
            "StreamReferenceName": "string",
            "TypeCode": 0,
            "Uom": "string",
            "IsKey": true,
            "StreamId": "string"
          }
        ]
      }
    ],
    "property2": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "TypeId": "string",
        "ResourceType": 1,
        "Tags": [
          "string"
        ],
        "Metadata": [
          {
            "Name": "string",
            "Value": null,
            "Description": "string",
            "TypeCode": 0,
            "Uom": "string"
          }
        ],
        "DataItemFields": [
          {
            "Id": "string",
            "Name": "string",
            "StreamReferenceName": "string",
            "TypeCode": 0,
            "Uom": "string",
            "IsKey": true,
            "StreamId": "string"
          }
        ],
        "IneligibleDataItemFields": [
          {
            "Id": "string",
            "Name": "string",
            "StreamReferenceName": "string",
            "TypeCode": 0,
            "Uom": "string",
            "IsKey": true,
            "StreamId": "string"
          }
        ]
      }
    ]
  }
}

```

---

### GroupingValueOfObject

<a id="schemagroupingvalueofobject"></a>
<a id="schema_GroupingValueOfObject"></a>
<a id="tocSgroupingvalueofobject"></a>
<a id="tocsgroupingvalueofobject"></a>

The value resolved by a grouping field defined in the data view

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|any|false|true|The grouping value|
|TypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|SDS type of the grouping value|
|Uom|string|false|true|Unit of measurement of the grouping value|

```json
{
  "Value": null,
  "TypeCode": 0,
  "Uom": "string"
}

```

---

### DataItemOfObject

<a id="schemadataitemofobject"></a>
<a id="schema_DataItemOfObject"></a>
<a id="tocSdataitemofobject"></a>
<a id="tocsdataitemofobject"></a>

A data item resolved by the data view. Can represent various DataItemResourceTypes from OSIsoft Cloud Services

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|The data item's unique identifier|
|Name|string|false|true|The data item's friendly name|
|Description|string|false|true|The data item's description|
|TypeId|string|false|true|The identifier of the data item's type|
|ResourceType|[DataItemResourceType](#schemadataitemresourcetype)|false|false|The type of resource this data item comes from|
|Tags|string[]|false|true|The collection of tags specified on this data item|
|Metadata|[[MetadataValueOfObject](#schemametadatavalueofobject)]|false|true|The list of metadata value objects specified on this data item|
|DataItemFields|[[DataItemField](#schemadataitemfield)]|false|true|The collection of data fields this data item exposes|
|IneligibleDataItemFields|[[DataItemField](#schemadataitemfield)]|false|true|The collection of ineligible data fields this data item exposes. These fields are not supported by data views and will not be included in the available field sets These fields can be manually added to a data view but the data result will show null values.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TypeId": "string",
  "ResourceType": 1,
  "Tags": [
    "string"
  ],
  "Metadata": [
    {
      "Name": "string",
      "Value": null,
      "Description": "string",
      "TypeCode": 0,
      "Uom": "string"
    }
  ],
  "DataItemFields": [
    {
      "Id": "string",
      "Name": "string",
      "StreamReferenceName": "string",
      "TypeCode": 0,
      "Uom": "string",
      "IsKey": true,
      "StreamId": "string"
    }
  ],
  "IneligibleDataItemFields": [
    {
      "Id": "string",
      "Name": "string",
      "StreamReferenceName": "string",
      "TypeCode": 0,
      "Uom": "string",
      "IsKey": true,
      "StreamId": "string"
    }
  ]
}

```

---
