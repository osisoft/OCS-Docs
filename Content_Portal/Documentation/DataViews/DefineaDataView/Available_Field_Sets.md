---
uid: DataViewsAvailableFieldSets
---

# Retrieve available field sets

Available [field sets](xref:DataViewsFieldSets) include fields not currently included in the data view, which are available to be added. 

The list of field sets is generated based on the `.Queries` and `.GroupingFields` of the defined data view. A grouping field is part of a data view definition that identifies a data item which is used to group related data items together. These fields and field sets can be readily added to the data view `.DataFieldSets`. Once the field is added, it is omitted from the list of available field sets. Similarly, if the field is removed from the data view, it is added back to the available field sets. This allows an iterative approach to building the data view by easily adding and removing fields from the data view. 

## Example
The example uses the following data view and the streams from the [Stream examples](xref:DataViewsExampleScenario). Note that the field sets and the grouping fields arrays are empty:
```json
{
  "Id": "example_without_grouping_fields",
  "Name": "example_without_grouping_fields",
  "IndexField": { "Label": "Timestamp" },
  "Queries": [
    { 
      "Id": "weather",
      "Kind": "Stream",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [],
  "GroupingFields": [],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```

Accessing the ```Get Available Field Sets``` endpoint will show available fields corresponding to stream id, name, tags, metadata, and each property. 

```json
HTTP 200 OK
{
    "TimeOfResolution": "(a timestamp in ISO 8601 format)",
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
                    "Source": "Name",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Name"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "Metadata",
                    "Keys": [
                        "Site"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
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


