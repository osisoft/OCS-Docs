---
uid: DataViewsAvailableFieldSets
---

# Available Field Sets

Available [field sets](xref:DataViewsFieldSets) include fields not currently included in the data view, which are available to be added. 

The list of field sets is generated based on the `.Queries`, `.GroupingFields`, and `.IndexTypeCode` of the defined data view. These fields and field sets can be readily added to the data view `.FieldSets`. Once the field is added, it is omitted from the list of available field sets. Similarly, if the field is removed from the data view, it is added back to the available field sets. This allows an iterative approach to building the data view by easily adding and removing fields from the data view. 

## Field Set Source
Available fields are organized into field sets according to their sources:

```FieldSetSourceType.Index```

The index field set represents the index field of the data view. Exactly one index field set is available per data view. Currently, this field is not mapped to anything, since interpolation is the only supported index mode.

```FieldSetSourceType.GroupingValue```

The grouping value field set represents the matching value for each group. If no grouping fields are specified, this field set is not available. Exactly one group value field set is available per data view. The group value field set contains one field per group, with each grouping field referred to by its index: `{ ... Keys: ["0"] }` for the 0th grouping field.

```FieldSetSourceType.DataItem```

The data item field set contains fields from the data item resulted from the query. For each query, a field set with unused fields will be returned. The available fields for stream data item include:
    * Id, name
    * Tags: one field with union of all tags
    * Metadata, propertyId: one field for each metadata key or property id

## Data View without GroupingFields
The example uses the following data view and the streams from the [SDS Example Scenario](xref:DataViewsExampleScenario). Note that the field sets and the grouping fields arrays are empty:
```json
{
  "Id": "example_without_grouping_fields",
  "Name": "example_without_grouping_fields",
  "Description": null,
  "Queries": [
    { 
      Id: "weather",
      Value:"*weather*" 
    }
  ],
  "FieldSets": [],
  "GroupingFields": [],
  "Shape": "Standard",
  "IndexTypeCode": "DateTime"
}
```

Accessing the ```Get Available Field Sets``` endpoint will show available fields corresponding to stream id, name, tags, metadata, and each property. Since the index field set is not included in the data view, it is also shown as available.

```json
HTTP 200 OK
{
    "TimeOfResolution": "(a timestamp in ISO 8601 format)",
    "Items": [
        {
            "SourceType": "Index",
            "Fields": [
                {
                    "Source": "None",
                    "Keys": [],
                    "Label": "Timestamp"
                }
            ]
        },
        {
            "SourceType": "DataItem",
            "QueryId": "weather",
            "Fields": [
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
                    "Source": "Tags",
                    "Keys": [
                        "Weather",
                        "Low Resolution",
                        "High Resolution",
                        "Gen1",
                        "Gen2",
                    ],
                    "Label": "{IdentifyingValue} Tags"
                },
                {
                    "Source": "Metadata",
                    "Keys": [
                        "Site"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Timestamp"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                }
            ]
        }
    ]
}
```

## Data View with GroupingFields
This data view is the same as in the first example, except it also has a `GroupingField`, which defines grouping by the metadata key "Site":

```json
{
  "Id": "example_with_grouping_fields",
  "Name": "example_with_grouping_fields",
  "Description": null,
  "Queries": [
    { 
      Id: "weather",
      Value:"*weather*" 
    }
  ],
  "FieldSets": []
  "GroupingFields": [
    {
      "Source": "Metadata",
      "Keys": [
        "Site" 
      ],
      "Label": "{IdentifyingValue} Id"
    }
  ],
  "Shape": "Standard",
  "IndexTypeCode": "DateTime"
}
```

A field set with ```SourceType.GroupingValue``` is now shown as one of the available field sets:
```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-11-14T20:31:20.856826+00:00",
    "Items": [
        {
            "SourceType": "Index",
            "Fields": [
                {
                    "Source": "None",
                    "Keys": [],
                    "Label": "Timestamp"
                }
            ]
        },
        {
            "SourceType": "GroupingValue",
            "Fields": [
                {
                    "Source": "None",
                    "Keys": [
                        "0"
                    ],
                    "Label": "{GroupingFieldLabel}"
                }
            ]
        },
        {
            "SourceType": "DataItem",
            "QueryId": "weather",
            "Fields": [
                ...
            ]
        }
    ]
}
```

