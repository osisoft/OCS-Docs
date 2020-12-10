---
uid: AssetCentricDataAPI
---

# Asset Centric Data API
The asset centric data API provides a quick way to take the dynamic data stored in SDS streams and store it as references within a given asset measurement mappings.

In order to retrieve stream data from an asset, you must first set up measurement mappings for a given asset. The data that is retrieved is based on the default shape of the asset.

### Example Asset
The following asset is used in all of the sample output in this topic.
```
{
    "Id": "Idsample",
    "Name": "SampleForDemo",
    "Description": "This is a demo asset.",
    "Metadata": [
        {
            "Id": "b47c9529-7fbf-4b2d-810b-fe79d7fdb2b0",
            "Name": "RoomLocation",
            "Description": "This is what room number the asset is located.",
            "SdsTypeCode": 14,
            "Value": 1.0
        }
    ],
    "StreamReferences": 
    [
        {
            "Id": "StreamReferenceId1",
            "Name": "StreamReferenceName"
            "StreamId": "PI_buildingMachine_1112"
        }
    ]
}
```

This is the measurement mappings of asset with `Id` IdSample which is used for all the example output below.
```
[
    {
        "Name": "StreamPressure",
        "StreamReferenceId": "StreamReferenceId1",
        "StreamPropertyIds": [
            "Timestamp",
            "Value"
        ]
    }
]
```
***

## `Get Asset Last Data` 
Returns the last stored value for all measurements.

### Request 
```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data/Last&measurement={measurementNames}
```

### Parameters  
`string tenantId`   
The tenant identifier

`string namespaceId`   
The namespace identifier

`string assetId`  
The asset identifier

[optional] `string[] measurement names`  
A comma-separated list of measurement names that you want returned for the last data. By default, all measurements are returned.

### Response 
The response includes a status code and a response body.

| Status Code | Body Type | Description |
|--|--|--|
| 200 OK | OK | Array of last values for all references. |
| 207 Multi-Status | partial success | Array of last values for references. Look at child errors for those that are unsuccessful. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 403 Forbidden | error | You are not authorized to view the requested asset. |
| 404 Not Found | error | The specified asset is not found. |

#### Example response body
``` 
[
    {
        "Measurement": "StreamPressure",
        "Result": [
            {
                "Timestamp": "2020-08-12T22:35:44Z",
                "Value": 73.165016
            }
        ]
    }
]
} 
```

***

## `Get Asset Sampled Data` 
Returns sampled data for all referenced measurements. 

Note: The inputs to this API matches the SDS stream Get samples values data call.  

### Request 
```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data/Sampled?startIndex={startIndex}&endIndex={endIndex}&intervals={intervals}&measurement={measurementNames} 
```

### Parameters  
`string tenantId`   
The tenant identifier 

`string namespaceId`   
The namespace identifier

`string assetId`  
The asset identifier

`string startIndex`   
The start index for the intervals

`string endIndex`   
The end index for the intervals

`int intervals`  
The number of requested intervals

[optional] `string[] measurement names`  
A comma-separated list of measurement names that you want returned for the last data. By default, all measurements are returned.

### Response 
The response includes a status code and a response body.

| Status Code | Body Type | Description |
|--|--|--|
| 200 OK | OK | Array of sampled values for all references. |
| 207 Multi-Status | partial success | Array of sampled values for  references. Look at child errors for those that are unsuccessful. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 403 Forbidden | error | You are not authorized to view the requested asset. |
| 404 Not Found | error | The specified asset with identifier is not found. |

```json 
HTTP 200 OK
Content-Type: application/json
[
    {
        "Measurement": "StreamPressure",
        "Result": [
            {
                "Timestamp": "2019-08-20T19:15:37Z",
                "Value": 218.13373
            },
            {
                "Timestamp": "2019-08-20T19:37:07Z",
                "Value": 201.36305
            },
            {
                "Timestamp": "2019-08-20T22:09:07Z",
                "Value": 247.73355
            },
            {
                "Timestamp": "2019-08-20T22:38:07Z",
                "Value": 216.15732
            },
            {
                "Timestamp": "2019-08-20T22:38:37Z",
                "Value": 217.88617
            },
            {
                "Timestamp": "2019-08-21T00:08:07Z",
                "Value": 185.70175
            },
            {
                "Timestamp": "2019-08-21T03:35:07Z",
                "Value": 249.77954
            },
            {
                "Timestamp": "2019-08-21T03:53:37Z",
                "Value": 232.56764
            },
            {
                "Timestamp": "2019-08-21T03:54:07Z",
                "Value": 234.20694
            },
            {
                "Timestamp": "2019-08-21T07:23:37Z",
                "Value": 249.29556
            },
            {
                "Timestamp": "2019-08-21T08:36:37Z",
                "Value": 202.4792
            },
            {
                "Timestamp": "2019-08-21T09:09:07Z",
                "Value": 205.28456
            },
            {
                "Timestamp": "2019-08-21T09:09:37Z",
                "Value": 203.7544
            },
            {
                "Timestamp": "2019-08-21T11:02:07Z",
                "Value": 178.63676
            },
            {
                "Timestamp": "2019-08-21T14:03:37Z",
                "Value": 228.6509
            },
            {
                "Timestamp": "2019-08-21T14:25:07Z",
                "Value": 209.00409
            },
            {
                "Timestamp": "2019-08-21T14:25:37Z",
                "Value": 211.80522
            },
            {
                "Timestamp": "2019-08-21T14:53:37Z",
                "Value": 235.39305
            },
            {
                "Timestamp": "2019-08-21T18:55:07Z",
                "Value": 147.43044
            },
            {
                "Timestamp": "2019-08-21T19:40:37Z",
                "Value": 169.46703
            }
        ]
    }
] 
```

***

## `Get Asset Summary Data` 
Returns summary data for all referenced measurements. 

### Request 
```text 
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data/Summaries?startIndex={startIndex}&endIndex={endIndex}&count={count}&measurement={measurement=measurementNames}
```

###  Parameters  
`string tenantId`   
The tenant identifier 

`string namespaceId`   
The namespace identifier

`string assetId`  
The asset identifier

`string startIndex`   
The start index for the intervals

`string endIndex`   
The end index for the intervals

`int count`   
The number of requested intervals

[optional] `string[] measurements names`  
A comma-separated list of measurement names that you want returned for the last data. By default, all measurements are returned.

### Response 
The response includes a status code and a response body.

| Status Code | Body Type | Description |
|--|--|--|
| 200 OK | OK | Array of summary values for all references. |
| 207 Multi-Status | partial success | Array of summary values for  references. Look at child errors for those that are unsuccessful. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 403 Forbidden | error | You are not authorized to view the requested asset. |
| 404 Not Found | error | The specified asset with identifier is not found. |

```json 
HTTP 200 OK
Content-Type: application/json
[
    {
        "Measurement": "StreamPressure",
        "Result": [
            {
                "Start": {
                    "Timestamp": "2020-01-01T12:00:00Z",
                    "Value": 139.56558
                },
                "End": {
                    "Timestamp": "2021-01-01T12:00:00Z"
                },
                "Summaries": {
                    "Count": {
                        "Timestamp": 211615,
                        "Value": 211613
                    },
                    "Minimum": {
                        "Value": 47.00091552734375
                    },
                    "Maximum": {
                        "Value": 249.99899291992188
                    },
                    "Range": {
                        "Value": 202.99807739257812
                    },
                    "Mean": {
                        "Value": 136.30853664128998
                    },
                    "StandardDeviation": {
                        "Value": 57.04227640108317
                    },
                    "PopulationStandardDeviation": {
                        "Value": 57.04214162121664
                    },
                    "Total": {
                        "Value": 28844658.36427307
                    },
                    "Skewness": {
                        "Value": 0.3037505109882242
                    },
                    "Kurtosis": {
                        "Value": -2.7748546694726244
                    },
                    "WeightedMean": {
                        "Value": 112.71120677110477
                    },
                    "WeightedStandardDeviation": {
                        "Value": 55.216968157263885
                    },
                    "WeightedPopulationStandardDeviation": {
                        "Value": 55.21683769086423
                    }
                }
            }
        ]
    }
]
```

***

## `Get Asset Window Data`
Returns window data for all referenced measurements.

### Request
```
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Data?startIndex={startIndex}&endIndex={endIndex}&measurement={measurementNames}
```

### Parameters
`string tenantId`  
The tenant identifier

`string namespaceId`   
The namespace identifier

`string assetId`  
The asset identifier

`string startIndex`   
The start index for the intervals

`string endIndex`   
The end index for the intervals

[optional] `string[] measurement names`  
A comma-separated list of measurement names that you want returned for the last data. By default, all measurements are returned.

### Response
The response includes a status code and a response body.

| Status Code | Body Type | Description |
|--|--|--|
| 200 OK | OK | Array of window values for all references. |
| 207 Multi-Status | partial success | Array of window values for  references. Look at child errors for unsuccessful values. |
| 400 Bad Request | error | The request is not valid. See the response body for additional details. |
| 403 Forbidden | error | You are not authorized to view the requested asset. |
| 404 Not Found | error | The specified asset with identifier is not found. |

```json 
HTTP 200 OK
Content-Type: application/json
[
    {
        "Measurement": "StreamPressure",
          "Result": [
            {
                "Timestamp": "2020-01-01T12:00:11Z",
                "Value": 107.64254
            },
            {
                "Timestamp": "2020-01-01T12:00:41Z",
                "Value": 106.129585
            },
            {
                "Timestamp": "2020-01-01T12:01:11Z",
                "Value": 109.109985
            },
            {
                "Timestamp": "2020-01-01T12:01:41Z",
                "Value": 108.936676
            },
            {
                "Timestamp": "2020-01-01T12:02:11Z",
                "Value": 110.982666
            },
            {
                "Timestamp": "2020-01-01T12:02:41Z",
                "Value": 109.05698
            },
            {
                "Timestamp": "2020-01-01T12:03:11Z",
                "Value": 110.33701
            }
        ]
    }
]
```