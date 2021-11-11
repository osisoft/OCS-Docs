---
uid: DataViewsFieldSets
---

# Define data field sets

A data view is likely to include multiple fields of information. One field serves as the index (e.g. Timestamp), and others contain information from or about the data items in the data view `DataFieldSet`s. Data field sets are collections of fields originating from the same query.

## Available field sets
The typical workflow for adding data field sets, and the data fields in them, is to use or adapt the [available field sets](xref:DataViewsAvailableFieldSets) that resolve for the data view. Available field sets provide the field sets and data fields which are available to a data view based on its query, but not currently included in its definition. This workflow is demonstrated in [Define a Data View](xref:DataViewsQuickStartDefine).


### Example: Defining data field sets
Let us take a subset of the power inverter streams in the [stream examples](xref:DataViewsStreamExamples), returned by the `Query` [value](xref:sdsSearching) `"TypeId:docs-pi-inverter AND Site:Winterthur"`. 

| Site | Meter | Measurement | Stream Id | Tags |
|--|--|--|--|--|
| Winterthur | Primary | Power In | WINT.Meter.Primary.Inverter.0.PwrIn | Low Resolution |
| Winterthur | Primary | Power Out | WINT.Meter.Primary.Inverter.0.PwrOut | Low Resolution |
| Winterthur | Secondary | Power In | WINT.Meter.Secondary.Inverter.0.PwrIn | Low Resolution |
| Winterthur | Secondary | Power Out | WINT.Meter.Secondary.Inverter.0.PwrOut | Low Resolution |

The following represents a data view grouped by "Meter", including fields for the grouping value, and each data item's "Tags" and property "Value":

```json
{
  "Id": "quickstart",
  "Queries": [
    {
      "Id": "inverters",
      "Kind": "Stream",
      "Value": "TypeId:docs-pi-inverter AND Site:Winterthur"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "inverters",
      "DataFields": [
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "Label": "{IdentifyingValue} Value {Uom} {SummaryType}"
        },
        {
          "Source": "Tags",
          "Keys": [ "Low Resolution", "High Resolution" ],
          "Label": "{IdentifyingValue} Tags"
        }
      ]
    }
  ],
   "GroupingFields": [
    {
      "Source": "Metadata",
      "Keys": [ "Meter" ],
      "Label": "{IdentifyingValue} Meter {Uom}"
    }
  ]
}
```

The view resolves into two groups of field mappings:

| Timestamp.0 | Meter.1 | Value.2 | Tags.3 | Value.4 | Tags.5 | Value.6 | Tags.7 | Value.8 | Tags.9 |
|--|--|--|--|--|--|--|--|--|--|
| - | Primary | ..Primary..PwrIn/PropertyId:Value | ..Primary..PwrIn/Tags |  ..Primary..PwrOut/PropertyId:Value | ..Primary..PwrOut/Tags  | | | | |
| - | Secondary |  |  |  |  | ..Secondary..PwrIn/PropertyId:Value | ..Secondary..PwrIn/Tags |  ..Secondary..PwrOut/PropertyId:Value | ..Secondary..PwrOut/Tags  |

Two things are clearly undesirable here:
1. The field identifiers are ambiguous
2. The result is sparse: the data views engine has not been told how to align the data items across groups, so it has no idea that all "Power In" streams are similar.

To fix this, we will add an `.IdentifyingField` to the field set.

## Identifying field
If the field set resolves to multiple data items in any group (or if grouping is not used), then a field should be designated as the `.IdentifyingField` of the field set. The identifying field of a data field set specifies the primary field to identify multiple items in a group. This allows the identifying field value to be used automatically in field labels of the group. If one lone criterion is not a sufficient or useful way of disambiguating the fields, then [grouping](xref:DataViewsGrouping) by additional criteria may be necessary. Field from field sources `FieldSource.Id`, `FieldSource.Name`, `FieldSource.Metadata`, `FieldSource.Tags` can be used as an identifying field. Keys are required for identifying fields with the source type of `FieldSource.Metadata` and `FieldSource.Tags`. Keys are not applicable for identifying fields with the source type of `FieldSource.Id` and `FieldSource.Name`.

### Example: Adding an identifying field
To the data view from the previous example, we will add a `Field` as the `.IdentifyingField` of its field set. In this example, it makes sense to identify each data item by its _Measurement_.

```json
{
  "Id": "quickstart",
  "Queries": [
    {
      "Id": "inverters",
      "Kind": "Stream",
      "Value": "TypeId:docs-pi-inverter AND Site:Winterthur"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "inverters",
      "DataFields": [
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "Label": "{IdentifyingValue} Value {Uom} {SummaryType}"
        },
        {
          "Source": "Tags",
          "Keys": [ "Low Resolution", "High Resolution" ],
          "Label": "{IdentifyingValue} Tags"
        }
      ],
      "IdentifyingField": {
          "Source": "Metadata",
          "Keys": [ "Measurement" ]
      }
    }
  ],
  "GroupingFields": [
    {
      "Source": "Metadata",
      "Keys": [ "Meter" ],
      "Label": "{IdentifyingValue} Meter {Uom}"
    }
  ]
}
```

The result is much more consumable. The data field identifiers are no longer ambiguous, and like data items are aligned across groups:

| Timestamp | Meter | Power In Value | Power In Tags | Power Out Value | Power Out Tags |
|--|--|--|--|--|--|
| - | Primary | ..Primary..PwrIn/PropertyId:Value | ..Primary..PwrIn/Tags |  ..Primary..PwrOut/PropertyId:Value | ..Primary..PwrOut/Tags  |
| - | Secondary | ..Secondary..PwrIn/PropertyId:Value | ..Secondary..PwrIn/Tags |  ..Secondary..PwrOut/PropertyId:Value | ..Secondary..PwrOut/Tags  |

## Working with assets

If assets are defined, data field sets can be defined to show the properties from stream references of the assets. 

To define data field sets with asset properties, two pieces of information are required: the stream reference name and the property id. In order to reference an asset property, a field must contain at least one stream reference name included in the `.StreamReferenceNames` collection and at least one property id included in the `.Keys` collection.

`.StreamReferenceNames` only applies to fields with source `FieldSource.PropertyId`. For all other field sources, `.StreamReferenceNames` are ignored. 

Similar to `.Keys`, `.StreamReferenceNames` are evaluated in order specified until a match is found, i.e. first-match-wins.

### Example: Defining data field sets with assets

The following example presents a subset of the power inverter streams in the [asset examples](xref:DataViewsAssetExamples), returned by the `Query` [value](xref:assets-assets-search) `"Id:*Inverter* AND Metadata/Value:Winterthur"`. 

| Site | Meter | Asset Id |
|--|--|--|
| Winterthur | Primary | Winterthur Primary Inverter 0 |
| Winterthur | Secondary | Winterthur Secondary Inverter |

The following represents a data view grouped by "Meter", including fields for the grouping value, and each data item's "Tags" and property "Value":

```json
{
  "Id": "quickstart",
  "Queries": [
    {
      "Id": "inverters",
      "Kind": "Asset",
      "Value": "Id:*Inverter* AND Metadata/Value:Winterthur"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "inverters",
      "DataFields": [
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "StreamReferenceNames": [ "Power In" ],
          "Label": "{IdentifyingValue} Power In Value {SummaryType} {Uom}"
        },
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "StreamReferenceNames": [ "Power Out" ],
          "Label": "{IdentifyingValue} Power Out Value {SummaryType} {Uom}"
        }
      ]
    }
  ],
   "GroupingFields": [
    {
      "Source": "Metadata",
      "Keys": [ "Meter" ],
      "StreamReferenceNames": [],
      "Label": "{IdentifyingValue} Meter {Uom}"
    }
  ]
}
```

The view resolves nicely into the following results:

| Timestamp | Meter | Power In Value | Power Out Value |
|--|--|--|--|
| - | Primary | ..Primary..PwrIn/PropertyId:Value | ..Primary..PwrOut/PropertyId:Value |
| - | Secondary | ..Secondary..PwrIn/PropertyId:Value | ..Secondary..PwrOut/PropertyId:Value |

The presence of context allows data views to align the data fields, without the addition of an `.IdentifyingField` as shown in the stream example above.

## Field
Each data field represents a particular source of information, such as a data item's `.Id` or the values from one of its properties.

### Label
A data field's label is a friendly name that can by specified directly or via rules. Null, empty or whitespace is not allowed for a data field label.

When the data view is resolved and data fields produce field mappings, labels are trimmed of whitespace and used as the field mappings' identifier. For example:
| Timestamp | Power In Value | Power Out Value |
|--|--|--|

In cases where the identifiers are unique, the identifier is suffixed with an ordinal number, its position. For example:

| Timestamp.0 | Value.1 | Value.2 |
|--|--|--|

There are seven special parameters available for use in field labels:
- `{IdentifyingValue}` - the value of the identifying field
- `{Key}` - the value of the first of the `"Keys"` specified on the field
- `{StreamReferenceName}` - the value of the first of the `"StreamReferenceNames"` specified on the field
- `{Uom}` - the value of the unit of measure of the field (if UOM is present in the source)
- `{SummaryType}` - the value of the summary type of the field (if defined)
- `{SummaryDirection}` - the value of the summary direction of the field (if summary type is defined)
- `{QueryId}` - the id of the query that produced the field

If a special parameter fails to resolve, it becomes an empty string, `""`.

### Source
A field's [`.Source`](xref:DataViewsQuickStartDefine#fieldsource-enumeration) indicates where the field's values will come from, if applicable. A field of source type `FieldSource.NotApplicable` cannot be used as a data field.

### Keys
The collection of data items in the data view represents all OCS resources that match the `.Queries` field of the data view, excluding data items that are ineligible. The list of data items can be retrieved from a resolved data view. The ineligible data items can be retrieved from a resolved data view to determine OCS resources that match the queries but cannot be included in the data view results. A data item is ineligible if it does not contain at least one eligible non-key data item field. In certain cases, a field may need to address data _within_ its data source, such as a particular Metadata value of a data item.  This applies to the sources `Metadata`, `PropertyId`, and `PropertyName`.

Multiple keys may be specified in the field's `.Keys`. This is a way to overcome differences in properties or metadata across data items. Keys are evaluated in order specified until a match is found, i.e. first-match-wins.

For field sources that do not use keys (`FieldSource.NotApplicable`, `FieldSource.Id` and `FieldSource.Name`), any keys specified are ignored.

#### Special case: Tags
The field source `FieldSource.Tags` is a special case due to the nature of tags.

On a field of source `FieldSource.Tags`, its collection of `.Keys` represents a whitelist.

##### Example
Given a stream with tags `[ "Weather", "Low Resolution", "Gen2" ]`  

A field of source `FieldSource.Tags` and `.Keys` `[ "Low Resolution", "High Resolution", "Gen1", "Gen2" ]`

The field's value when resolved will be `[ "Low Resolution", "Gen2" ]`
