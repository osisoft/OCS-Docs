---
uid: DataViewsApi
---

# DataViews

APIs for Working with Data Views

### Properties

Property | Type | Required | Descriptions
 --- | --- | --- | ---
Id | string | False | Id of the Data View
Name | string | False | Name of the Data View
Description | string | False | Description of the Data View
Queries | [QueryInfo] | True | A list of queries to select the data items to be displayed in the Data View
GroupRules | [GroupRule] | False | A list of group rules to organize data items into data groups
Mappings | Mappings | False | Defines the names of the columns and the stream properties that get mapped to them
IndexDataType | IndexDataType | True | Defines the index data type that index config uses
IndexConfig | IndexConfig | False | Defines the index information from which to retrieve data. Currently, only interpolation mode is supported



 ## `IndexDataType` 
 The IndexDataType can have the following values: 

Value | Type | Description
 --- | --- | ---
DateTime | string | Use DateTime as index type


## `Full Body Example` 
 ```json
{
  "Id": "DataViewDefinition_Id",
  "Name": "DataViewDefinition_Name",
  "Description": "DataViewDefinition_Description",
  "Queries": [
    {
      "Id": "pump",
      "Query": "id:*TestPump*"
    }
  ],
  "GroupRules": [
    {
      "Id": "group by stream name",
      "Resource": "Streams",
      "Field": "Name"
    }
  ],
  "Mappings": {
    "SharedMappingRules": [
      {
        "Id": "shared mapping rule",
        "Pattern": "{measurement}",
        "MappingRule": {
          "PropertyPaths": [
            "Value"
          ],
          "ItemIdentifier": {
            "Resource": "Streams",
            "Field": "Id",
            "Value": "{measurement}"
          }
        }
      }
    ],
    "Columns": [
      {
        "Name": "keyColumn",
        "MappingRule": {
          "PropertyPaths": [
            "path"
          ]
        },
        "IsKey": true,
        "DataType": "DateTime"
      },
      {
        "Name": "group rule",
        "MappingRule": {
          "GroupRuleId": "id",
          "GroupRuleValue": "StreamId"
        },
        "IsKey": false,
        "DataType": "string"
      },
      {
        "Name": "column1",
        "MappingRule": {
          "PropertyPaths": [
            "path"
          ]
        },
        "IsKey": false
      },
      {
        "Name": "column2",
        "MappingRule": {
          "PropertyPaths": [
            "path"
          ],
          "ItemIdentifier": {
            "Resource": "Streams",
            "Field": "Id",
            "Value": "test"
          }
        },
        "IsKey": false
      },
      {
        "Name": "column3",
        "MappingRule": {
          "SharedMappingRuleId": "shared mapping rule",
          "Value": "{measurement}"
        },
        "IsKey": false
      }
    ]
  },
  "IndexDataType": 0,
  "IndexConfig": {
    "StartIndex": "2018-01-01T00:00:00Z",
    "EndIndex": "2018-01-02T00:00:00Z",
    "Mode": "Interpolated",
    "Interval": "00:05:00"
  }
}
``` 

***

## `Get Data Views`

Get all created Data Views

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


The number of data views to skip
```csharp
Int32 skip [FromQuery] [Optional] [Default = 0]
```


The number of data views to display per page. Maximum count allowed is 1000
```csharp
Int32 count [FromQuery] [Optional] [Default = 100]
```


### Returns

#### 200

OK - retrieved the Data Views (could be an empty array)

```json
[
{
  "DataViews": [
    {
      "Id": "String",
      "Name": "String",
      "Description": "String",
      "Queries": [
        {
          "Id": "String",
          "Query": "String"
        }
      ],
      "GroupRules": [
        {
          "Id": "String",
          "GroupRuleResource": "GroupRuleResource enumeration",
          "GroupRuleField": "GroupRuleField enumeration",
          "Values": [
            {
              "Chars": "Char",
              "Length": "Int32"
            }
          ]
        }
      ],
      "Mappings": {
        "TimeOfResolution": "DateTimeOffset",
        "SharedMappingRules": [
          {
            "Id": "String",
            "Pattern": "String",
            "MappingRule": {
              "PropertyPaths": [
                {
                  "Chars": "Char",
                  "Length": "Int32"
                }
              ],
              "ItemIdentifier": {
                "FilterResource": "FilterResource enumeration",
                "FilterField": "FilterField enumeration",
                "Name": "String",
                "Value": "String"
              }
            }
          }
        ],
        "Columns": [
          {
            "Name": "String",
            "MappingRule": {},
            "IsKey": "Boolean",
            "DataType": "String"
          }
        ]
      },
      "IndexDataType": "IndexDataType enumeration",
      "IndexConfig": {
        "StartIndex": "String",
        "EndIndex": "String",
        "DataRetrievalMode": "DataRetrievalMode enumeration",
        "Interval": "String"
      }
    }
  ]
}
]
```

#### 207

Multi Status - retrieved valid Data Views along with Errors

```json
[
{
  "Errors": [
    {
      "OperationId": "String",
      "Error": "String",
      "Reason": "String",
      "Resolution": "String",
      "AdditionalParameters": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "DataViews": [
    {
      "Id": "String",
      "Name": "String",
      "Description": "String",
      "Queries": [
        {
          "Id": "String",
          "Query": "String"
        }
      ],
      "GroupRules": [
        {
          "Id": "String",
          "GroupRuleResource": "GroupRuleResource enumeration",
          "GroupRuleField": "GroupRuleField enumeration",
          "Values": [
            {
              "Chars": "Char",
              "Length": "Int32"
            }
          ]
        }
      ],
      "Mappings": {
        "TimeOfResolution": "DateTimeOffset",
        "SharedMappingRules": [
          {
            "Id": "String",
            "Pattern": "String",
            "MappingRule": {
              "PropertyPaths": [
                {
                  "Chars": "Char",
                  "Length": "Int32"
                }
              ],
              "ItemIdentifier": {
                "FilterResource": "FilterResource enumeration",
                "FilterField": "FilterField enumeration",
                "Name": "String",
                "Value": "String"
              }
            }
          }
        ],
        "Columns": [
          {
            "Name": "String",
            "MappingRule": {},
            "IsKey": "Boolean",
            "DataType": "String"
          }
        ]
      },
      "IndexDataType": "IndexDataType enumeration",
      "IndexConfig": {
        "StartIndex": "String",
        "EndIndex": "String",
        "DataRetrievalMode": "DataRetrievalMode enumeration",
        "Interval": "String"
      }
    }
  ]
}
]
```

#### 400

Bad request


#### 500

Internal server error

***

## `Get Data View`

Get a Data View by id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": [
    {
      "Id": "String",
      "Query": "String"
    }
  ],
  "GroupRules": [
    {
      "Id": "String",
      "GroupRuleResource": "GroupRuleResource enumeration",
      "GroupRuleField": "GroupRuleField enumeration",
      "Values": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "Mappings": {
    "TimeOfResolution": "DateTimeOffset",
    "SharedMappingRules": [
      {
        "Id": "String",
        "Pattern": "String",
        "MappingRule": {
          "PropertyPaths": [
            {
              "Chars": "Char",
              "Length": "Int32"
            }
          ],
          "ItemIdentifier": {
            "FilterResource": "FilterResource enumeration",
            "FilterField": "FilterField enumeration",
            "Name": "String",
            "Value": "String"
          }
        }
      }
    ],
    "Columns": [
      {
        "Name": "String",
        "MappingRule": {},
        "IsKey": "Boolean",
        "DataType": "String"
      }
    ]
  },
  "IndexDataType": "IndexDataType enumeration",
  "IndexConfig": {
    "StartIndex": "String",
    "EndIndex": "String",
    "DataRetrievalMode": "DataRetrievalMode enumeration",
    "Interval": "String"
  }
}
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Create Data View`

Create a new Data View

### Request
`POST api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```

### Parameters from request body: 

DataViewDefinition object
```csharp
DataViewDefinition dataViewDefinitionDto [FromBody] [Required] [No Default Value]
```

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": [
    {
      "Id": "String",
      "Query": "String"
    }
  ],
  "GroupRules": [
    {
      "Id": "String",
      "GroupRuleResource": "GroupRuleResource enumeration",
      "GroupRuleField": "GroupRuleField enumeration",
      "Values": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "Mappings": {
    "TimeOfResolution": "DateTimeOffset",
    "SharedMappingRules": [
      {
        "Id": "String",
        "Pattern": "String",
        "MappingRule": {
          "PropertyPaths": [
            {
              "Chars": "Char",
              "Length": "Int32"
            }
          ],
          "ItemIdentifier": {
            "FilterResource": "FilterResource enumeration",
            "FilterField": "FilterField enumeration",
            "Name": "String",
            "Value": "String"
          }
        }
      }
    ],
    "Columns": [
      {
        "Name": "String",
        "MappingRule": {},
        "IsKey": "Boolean",
        "DataType": "String"
      }
    ]
  },
  "IndexDataType": "IndexDataType enumeration",
  "IndexConfig": {
    "StartIndex": "String",
    "EndIndex": "String",
    "DataRetrievalMode": "DataRetrievalMode enumeration",
    "Interval": "String"
  }
}
```

Automatically generate default mappings
```csharp
bool defaultMappings [FromQuery] [Optional] [Default = False]
```


### Returns

#### 201

Successfully created a Data View Definition

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": [
    {
      "Id": "String",
      "Query": "String"
    }
  ],
  "GroupRules": [
    {
      "Id": "String",
      "GroupRuleResource": "GroupRuleResource enumeration",
      "GroupRuleField": "GroupRuleField enumeration",
      "Values": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "Mappings": {
    "TimeOfResolution": "DateTimeOffset",
    "SharedMappingRules": [
      {
        "Id": "String",
        "Pattern": "String",
        "MappingRule": {
          "PropertyPaths": [
            {
              "Chars": "Char",
              "Length": "Int32"
            }
          ],
          "ItemIdentifier": {
            "FilterResource": "FilterResource enumeration",
            "FilterField": "FilterField enumeration",
            "Name": "String",
            "Value": "String"
          }
        }
      }
    ],
    "Columns": [
      {
        "Name": "String",
        "MappingRule": {},
        "IsKey": "Boolean",
        "DataType": "String"
      }
    ]
  },
  "IndexDataType": "IndexDataType enumeration",
  "IndexConfig": {
    "StartIndex": "String",
    "EndIndex": "String",
    "DataRetrievalMode": "DataRetrievalMode enumeration",
    "Interval": "String"
  }
}
```

#### 400

Bad request


#### 403

Unauthorized


#### 500

Internal server error

***

## `Create Data View With Id`

Create a new Data View

### Request
`POST api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

DataViewDefinition object
```csharp
DataViewDefinition dataViewDefinitionDto [FromBody] [Required] [No Default Value]
```

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": [
    {
      "Id": "String",
      "Query": "String"
    }
  ],
  "GroupRules": [
    {
      "Id": "String",
      "GroupRuleResource": "GroupRuleResource enumeration",
      "GroupRuleField": "GroupRuleField enumeration",
      "Values": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "Mappings": {
    "TimeOfResolution": "DateTimeOffset",
    "SharedMappingRules": [
      {
        "Id": "String",
        "Pattern": "String",
        "MappingRule": {
          "PropertyPaths": [
            {
              "Chars": "Char",
              "Length": "Int32"
            }
          ],
          "ItemIdentifier": {
            "FilterResource": "FilterResource enumeration",
            "FilterField": "FilterField enumeration",
            "Name": "String",
            "Value": "String"
          }
        }
      }
    ],
    "Columns": [
      {
        "Name": "String",
        "MappingRule": {},
        "IsKey": "Boolean",
        "DataType": "String"
      }
    ]
  },
  "IndexDataType": "IndexDataType enumeration",
  "IndexConfig": {
    "StartIndex": "String",
    "EndIndex": "String",
    "DataRetrievalMode": "DataRetrievalMode enumeration",
    "Interval": "String"
  }
}
```

Automatically generate default mappings
```csharp
bool defaultMappings [FromQuery] [Optional] [Default = False]
```


### Returns

#### 201

Successfully created a Data View Definition

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": [
    {
      "Id": "String",
      "Query": "String"
    }
  ],
  "GroupRules": [
    {
      "Id": "String",
      "GroupRuleResource": "GroupRuleResource enumeration",
      "GroupRuleField": "GroupRuleField enumeration",
      "Values": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "Mappings": {
    "TimeOfResolution": "DateTimeOffset",
    "SharedMappingRules": [
      {
        "Id": "String",
        "Pattern": "String",
        "MappingRule": {
          "PropertyPaths": [
            {
              "Chars": "Char",
              "Length": "Int32"
            }
          ],
          "ItemIdentifier": {
            "FilterResource": "FilterResource enumeration",
            "FilterField": "FilterField enumeration",
            "Name": "String",
            "Value": "String"
          }
        }
      }
    ],
    "Columns": [
      {
        "Name": "String",
        "MappingRule": {},
        "IsKey": "Boolean",
        "DataType": "String"
      }
    ]
  },
  "IndexDataType": "IndexDataType enumeration",
  "IndexConfig": {
    "StartIndex": "String",
    "EndIndex": "String",
    "DataRetrievalMode": "DataRetrievalMode enumeration",
    "Interval": "String"
  }
}
```

#### 400

Bad request


#### 403

Unauthorized


#### 409

Data View Definition with the specified Id already exists


#### 500

Internal server error

***

## `Create or Update Data View`

Update the Data View with specified Id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated DataViewDefinition object in the request body
```csharp
DataViewDefinition dataViewDefinitionDto [FromBody] [Required] [No Default Value]
```

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": [
    {
      "Id": "String",
      "Query": "String"
    }
  ],
  "GroupRules": [
    {
      "Id": "String",
      "GroupRuleResource": "GroupRuleResource enumeration",
      "GroupRuleField": "GroupRuleField enumeration",
      "Values": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "Mappings": {
    "TimeOfResolution": "DateTimeOffset",
    "SharedMappingRules": [
      {
        "Id": "String",
        "Pattern": "String",
        "MappingRule": {
          "PropertyPaths": [
            {
              "Chars": "Char",
              "Length": "Int32"
            }
          ],
          "ItemIdentifier": {
            "FilterResource": "FilterResource enumeration",
            "FilterField": "FilterField enumeration",
            "Name": "String",
            "Value": "String"
          }
        }
      }
    ],
    "Columns": [
      {
        "Name": "String",
        "MappingRule": {},
        "IsKey": "Boolean",
        "DataType": "String"
      }
    ]
  },
  "IndexDataType": "IndexDataType enumeration",
  "IndexConfig": {
    "StartIndex": "String",
    "EndIndex": "String",
    "DataRetrievalMode": "DataRetrievalMode enumeration",
    "Interval": "String"
  }
}
```

Automatically generate default mappings
```csharp
bool defaultMappings [FromQuery] [Optional] [Default = False]
```


### Returns

#### 204

Data View successfully created or updated


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Delete Data View`

Delete the Data View with specified Id

### Request
`DELETE api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 204

Successfully deleted the Data View


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Data View Name`

Get Data View name by Data View id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/name`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View name

```json
{
  "Chars": "Char",
  "Length": "Int32"
}
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Name`

Update Data View name specified by Data View id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/name`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated name in the request body
```csharp
string name [FromBody] [Required] [No Default Value]
```

```json
{
  "Chars": "Char",
  "Length": "Int32"
}
```

### Returns

#### 204

Successfully updated the Data View name


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Data View Description`

Get Data View description by Data View id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/description`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View description

```json
{
  "Chars": "Char",
  "Length": "Int32"
}
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Description`

Update Data View description specified by Data View id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/description`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated description in the request body
```csharp
string description [FromBody] [Required] [No Default Value]
```

```json
{
  "Chars": "Char",
  "Length": "Int32"
}
```

### Returns

#### 204

Successfully updated the Data View description


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Delete Data View Description`

Delete Data View description specified by Data View id

### Request
`DELETE api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/description`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 204

Successfully deleted the Data View description


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Data View Queries`

Get Data View queries by Data View id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/queries`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View queries

```json
[
{
  "Id": "String",
  "Query": "String"
}
]
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Queries`

Update Data View queries specified by Data View id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/queries`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated queries in the request body
```csharp
[QueryInfo] queriesDto [FromBody] [Required] [No Default Value]
```

```json
[
{
  "Id": "String",
  "Query": "String"
}
]
```

### Returns

#### 204

Successfully updated the Data View queries


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Data View Group Rules`

Get Data View group rules by Data View id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/grouprules`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View group rules

```json
[
{
  "Id": "String",
  "GroupRuleResource": "GroupRuleResource enumeration",
  "GroupRuleField": "GroupRuleField enumeration",
  "Values": [
    {
      "Chars": "Char",
      "Length": "Int32"
    }
  ]
}
]
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Group Rules`

Update Data View group rules specified by Data View id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/grouprules`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated group rules in the request body
```csharp
[GroupRule] groupRulesDto [FromBody] [Required] [No Default Value]
```

```json
[
{
  "Id": "String",
  "GroupRuleResource": "GroupRuleResource enumeration",
  "GroupRuleField": "GroupRuleField enumeration",
  "Values": [
    {
      "Chars": "Char",
      "Length": "Int32"
    }
  ]
}
]
```

### Returns

#### 204

Successfully updated the Data View group rules


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Delete Data View Group Rules`

Delete Data View group rules specified by Data View id

### Request
`DELETE api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/grouprules`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 204

Successfully deleted the Data View group rules


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Data View Mappings`

Get Data View mappings by Data View id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/mappings`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View mappings

```json
{
  "TimeOfResolution": "DateTimeOffset",
  "SharedMappingRules": [
    {
      "Id": "String",
      "Pattern": "String",
      "MappingRule": {
        "PropertyPaths": [
          {
            "Chars": "Char",
            "Length": "Int32"
          }
        ],
        "ItemIdentifier": {
          "FilterResource": "FilterResource enumeration",
          "FilterField": "FilterField enumeration",
          "Name": "String",
          "Value": "String"
        }
      }
    }
  ],
  "Columns": [
    {
      "Name": "String",
      "MappingRule": {},
      "IsKey": "Boolean",
      "DataType": "String"
    }
  ]
}
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Mappings`

Update Data View mappings specified by Data View id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/mappings`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated mappings in the request body
```csharp
Mappings mappingsDto [FromBody] [Required] [No Default Value]
```

```json
{
  "TimeOfResolution": "DateTimeOffset",
  "SharedMappingRules": [
    {
      "Id": "String",
      "Pattern": "String",
      "MappingRule": {
        "PropertyPaths": [
          {
            "Chars": "Char",
            "Length": "Int32"
          }
        ],
        "ItemIdentifier": {
          "FilterResource": "FilterResource enumeration",
          "FilterField": "FilterField enumeration",
          "Name": "String",
          "Value": "String"
        }
      }
    }
  ],
  "Columns": [
    {
      "Name": "String",
      "MappingRule": {},
      "IsKey": "Boolean",
      "DataType": "String"
    }
  ]
}
```

Automatically generate default mappings
```csharp
bool defaultMappings [FromQuery] [Optional] [Default = False]
```


### Returns

#### 204

Successfully updated the Data View mappings


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Delete Data View Mappings`

Delete Data View mappings specified by Data View id

### Request
`DELETE api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/mappings`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 204

Successfully deleted the Data View mappings


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Data View Index Data Type`

Get Data View index data type by Data View id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/indexdatatype`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View index data type

```json
{
  "Chars": "Char",
  "Length": "Int32"
}
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Index Data Type`

Update Data View index data type specified by Data View id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/indexdatatype`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated index data type in the request body
```csharp
IndexDataType indexDataTypeDto [FromBody] [Required] [No Default Value]
```

```json
{}
```

### Returns

#### 204

Successfully updated the Data View index data type


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Data View Index Config`

Get Data View index config by Data View id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/indexconfig`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View index config

```json
{
  "StartIndex": "String",
  "EndIndex": "String",
  "DataRetrievalMode": "DataRetrievalMode enumeration",
  "Interval": "String"
}
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Index Config`

Update Data View index config specified by Data View id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/indexconfig`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated index config in the request body
```csharp
IndexConfig indexDto [FromBody] [Required] [No Default Value]
```

```json
{
  "StartIndex": "String",
  "EndIndex": "String",
  "DataRetrievalMode": "DataRetrievalMode enumeration",
  "Interval": "String"
}
```

### Returns

#### 204

Successfully updated the Data View index config


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Delete Data View Index Config`

Delete Data View index config specified by Data View id

### Request
`DELETE api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/indexconfig`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 204

Successfully deleted the Data View index config


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

