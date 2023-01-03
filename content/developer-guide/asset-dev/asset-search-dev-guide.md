---
uid: asset-search-dev-guide
---

# Asset Search Criteria

The assets search API allows you to search for your assets with search criteria.

### Searchable Properties
Assets can be searched on the following asset properties:

- Asset Top-level Properties
  - Id, Name, Description, AssetTypeId, AssetTypeName

- Metadata Properties
  - Name, Description, Value

- Stream Reference Properties
  - StreamReferenceName - Stream Reference Name
  - StreamPropertyId - SDS Stream Property Ids, not including indices

Search criteria can be chained together using an **AND**. See examples below. 

## Search Matched Fields 

Searches all assets and returns a list of asset identifiers and their matched fields. 

### Example response body

Below is a response when query string is "Name:Tracer".

- `TotalCount` - Represents the number of matched assets in the database which matched the given query.

    A list of results is returned. Each result contains:  

- `MatchProperties` - A list of matched property objects. Each `MatchProperties` object contains the matched fields and their values.

- `Id` - Identifier of the matched asset.

- `TypeId` - Asset type identifier of the asset. This is null if the asset does not reference an asset type.

- `Name` - Asset name.

- `Description` - Description of the matched asset. If the description of the matched asset is null, the description from the asset type is returned.

- `ETag` - Version tag.

- `CreatedDate` - Asset creation date.

- `LastModifiedDate` - Last modified date of the asset.

- `LastStatus` - Last status of the matched asset. If a status is not defined for the asset, this field will be null. If a status is defined, this field will correspond to Unknown, Good, Warning, or Bad. The display name of the asset status had no effect on this field.

```json 
HTTP 200 OK 
Content-Type: application/json
{
    "TotalCount": 2,
    "Results": [
        {
            "MatchedProperties": [
                {
                    "Field": "Name",
                    "Value": "Asset Tracer ced7ee16-984d-480f-8338-3055f7f39d8b"
                }
            ],
            "Id": "AssetId2b5f41ae-0929-4977-bfbd-1e046d8a66f4",
            "TypeId": "AssetTracerType",
            "Name": "Asset Tracer ced7ee16-984d-480f-8338-3055f7f39d8b",
            "Description": "First tracer device",
            "ETag": "1",
            "CreatedDate": "2021-05-26T19:05:33.8979442Z",
            "LastModifiedDate": "2021-05-26T19:05:33.8979442Z"
        },
        {
            "MatchedProperties": [
                {
                    "Field": "Name",
                    "Value": "Asset Tracer d6b984dd-b6da-4225-a2e0-59f781d065a4"
                }
            ],
            "Id": "AssetId3dbfd185-7c62-49ed-b875-7953cba07fc3",
            "TypeId": "AssetTracerType",
            "Name": "Asset Tracer d6b984dd-b6da-4225-a2e0-59f781d065a4",
            "Description": "Another tracer device",
            "ETag": "1",
            "CreatedDate": "2021-05-26T19:05:40.9043726Z",
            "LastModifiedDate": "2021-05-26T19:05:40.9043726Z"        
        }
    ]
}
```

### Examples of asset query strings

| Query String                 | Description                                                  |
| ---------------------------- | ------------------------------------------------------------ |
| Id:Id1                       | Returns the asset with `Id` equal to **Id1**.                |
| Id:Id1 Name desc             | Returns the asset with `Id` equal to **Id1** return results in descending order by Name. |
| Id:Id*                       | Returns all assets with `Id` matching **id*** wildcard.      |
| Name:Name1                   | Returns all asset with a friendly name equal to **Name1**.   |
| Id:Id AND Name:Name1         | Returns all assets with `Id` matching the **id** and with a friendly name equal to **Name1**. |
| Description:floor1*          | Returns all assets with a description that starts with **floor1**. |
| Metadata/Name:Building*      | Returns all assets with at least one metadata name whose description contains the string **Building**. |
| Metadata/Description:heater* | Returns all assets with at least one metadata whose description starts with **heater**. |
| Metadata/Value:123           | Returns all assets with at least one metadata whose Value property equals **123**. |
| Id:X* AND Metadata/Name:B*   | Returns all assets with `Id` starting with **X** and containing at least one metadata value with a name that starts with a **B**. |
| AssetTypeId:HeaterTypeId     | Returns all assets with `AssetTypeId` matching `HeaterTypeId` |
| AssetTypeName:HeaterTypeName | Returns all assets whose `Name` field of the asset type matches **HeaterTypeName** |
| StreamPropertyId:Pressure    | Returns all assets that have one or more stream references with the stream property ID **Pressure**. Note: This search only searches non-key Sds stream properties. |
| StreamReferenceName:Name1    | Returns all assets whose stream references contain a stream reference name that matches **Name1**. |
| Tags:MarkedAsset             | Returns all assets which has "MarkedAsset" as a tag.         |

### Special characters in search queries

Add the backslash escape character ( \ ) before any special characters in search queries. The following special characters require an escape character:   " |  /  *  \  ( )  : 

The following are examples of using the escape character in query strings.

| Example Field Value                    | Query String                               |
| -------------------------------------- | ------------------------------------------ |
| Austin\Dallas\Fort Worth               | Austin\\\Dallas\\\Fort Worth               |
| 1:100                                  | 1\\:100                                    |

### Examples of asset filter strings

Filter strings are not case sensitive. Numeric types must be passed as strings according to English locale. For example, a double of 1.1 must be sent as **"1.1"**.

| Query String                                 | Description                                                  |
| -------------------------------------------- | ------------------------------------------------------------ |
| filter[location]=Earth                       | Filter that only returns assets that contain the metadata name = **location** with **Earth** as the metadata value. |
| filter[location]=Earth&filter[device]=tracer | Filter that only returns assets that contain both of the following metadata. The first metadata name = **location** with **Earth** as the metadata value, and the second metadata is name = **device** with **tracer** as the metadata value. |
| filter[AssetTypeName]=HeaterType             | Filter that only returns assets with an AssetTypeName of **HeaterType**. |
| filter[status]=Bad                           | Filter that returns only assets with a bad status. Status filters can have the values **Good**, **Bad**, **Warning**, and **Unknown**. |

### Special characters in filter values

Only `" \` special characters need to be escaped with the backslash escape character ( \ ) in filter values.

The following are examples of using the escape character in filter value.

| Example Location Value                 | Filter String                              |
| -------------------------------------- | ------------------------------------------ |
| Austin\Dallas\Fort Worth               | filter[location]=Austin\\Dallas\\Fort Worth|
| "Austin" Texas                         | filter[location]=\"Austin\" Texas          |

## Faceted Search

Asset faceted search allows for searching using asset facets.

### Example

If you have the following assets in your system:

| Assets in System                                             |
| ------------------------------------------------------------ |
| "Id": "CaliforniaAsset",    "Metadata": [      { "Name": "Manufacturer", "Value": "GE", "SdsTypeCode": "String" },      { "Name": "Location", "Value": "California", "SdsTypeCode": "String" },    ] |
| "Id": "CaliforniaAsset1",    "Metadata": [      { "Name": "Manufacturer", "Value": "Rockwell", "SdsTypeCode": "String" },      { "Name": "Location", "Value": "California", "SdsTypeCode": "String" },    ] |
| "Id": "PhillyAsset",    "Metadata": [      { "Name": "Manufacturer", "Value": "GE", "SdsTypeCode": "String" },      { "Name": "Location", "Value": "Philly", "SdsTypeCode": "String" },    ] |


Performing a `GET search/assets/facets?Name=Location` returns the following response. 


```json 
HTTP 200 OK 
Content-Type: application/json
[
    {
        "Name": "Location",
        "FacetValues": [
            {
                "Value": "California",
                "DocumentCount": 2
            },
            {
                "Value": "Philly",
                "DocumentCount": 1
            }
        ]
    }
]
```

## Asset Autocomplete

Asset autocomplete allows you to query assets and retrieve a list of suggested assets based on your search criteria. 

### Example 

Assume you have the following assets in your system.

| Assets in System                                             |
| ------------------------------------------------------------ |
| "Id": "AutoCompletedAsset_1", "Name": "tracerRound", "Description": "Traced Asset 1", "Metadata": [{ "Id": "1", "Name": "tractorNumber", "Value": "t100", "SdsTypeCode": "String:}] |
| "Id": "AutoCompletedAsset_2", "Name": "tracerRound", "Description": "None", "Metadata": [{ "Id": "2", "Name": "tractorNumber", "Value": "tractor3",        "SdsTypeCode": "String"}] |
| "Id": "AutoCompletedAsset_3", "Name": "tracerRound_Type2", "Description": "None", "Metadata": {"Id": "17", "Name": "track", "SdsTypeCode": "String", "Value": "100"}] |

Performing a `GET Search/Assets/Autocomplete?term=t&termcount=10&facetcount=10` returns the following response. 


```json 
{
    "Facets": [
        {
            "Value": "trackUnit1",
            "FacetCategories": [
                {
                    "Name": "track",
                    "DocumentCount": 1
                }
            ]
        },
        {
            "Value": "t1000",
            "FacetCategories": [
                {
                    "Name": "tractorNumber",
                    "DocumentCount": 1
                }
            ]
        }
    ],
    "Tokens": [
        {
            "Value": "tracerround",
            "DocumentCount": 2
        },
        {
            "Value": "tractornumber",
            "DocumentCount": 2
        },
        {
            "Value": "tracerround_type2",
            "DocumentCount": 1
        },
        {
            "Value": "track",
            "DocumentCount": 1
        },
        {
            "Value": "t1000",
            "DocumentCount": 1
        }
    ]
}
```

Performing a `GET Search/Assets/Autocomplete?term=t&facetcount=10` returns the following response. 


```json 
{
    "Facets": [
        {
            "Value": "trackUnit1",
            "FacetCategories": [
                {
                    "Name": "track",
                    "DocumentCount": 1
                }
            ]
        },
        {
            "Value": "t1000",
            "FacetCategories": [
                {
                    "Name": "tractorNumber",
                    "DocumentCount": 1
                }
            ]
        }
    ],
    "Tokens": []
}
```
