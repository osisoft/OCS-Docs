---
uid: DataViewsFieldSets
---

# Define data field sets

A data view is likely to include multiple fields of information. One field serves as the index (e.g. Timestamp), and others contain information from or about the data items in the data view `DataFieldSet`s. Data field sets are collections of fields originating from the same query.

### Available field sets
The typical workflow for adding data field sets, and the data fields in them, is to use or adapt the [available field sets](xref:DataViewsAvailableFieldSets) that resolve for the data view. This workflow is demonstrated in [Define a Data View](xref:DataViewsQuickStartDefine).


#### Example: Defining data field sets
Let us take a subset of the power inverter streams in the [stream examples](xref:DataViewsExampleScenario), returned by the `Query` [value](xref:sdsSearching) `"TypeId:docs-pi-inverter AND Site:Winterthur"`. 

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
          "Label": "{IdentifyingValue} {FirstKey}"
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
      "Label": "{IdentifyingValue} {FirstKey}"
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

#### Identifying field
If the field set resolves to multiple data items in any group (or if grouping is not used), then a field should be designated as the `.IdentifyingField` of the field set. If one lone criterion is not a sufficient or useful way of disambiguating the fields, then [grouping](xref:DataViewsGrouping) by additional criteria may be necessary. Field from field sources `FieldSource.Id`, `FieldSource.Name`, `FieldSource.Metadata`, `FieldSource.Tags` can be used as an identifying field. Keys are required for identifying fields with the source type of `FieldSource.Metadata` and `FieldSource.Tags`. Keys are not applicable for identifying fields with the source type of `FieldSource.Id` and `FieldSource.Name`.

#### Example: Adding an identifying field
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
          "Label": "{IdentifyingValue} {FirstKey}"
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
      "Label": "{IdentifyingValue} {FirstKey}"
    }
  ]
}
```

The result is much more consumable. The data field identifiers are no longer ambiguous, and like data items are aligned across groups:

| Timestamp | Meter | Power In Value | Power In Tags | Power Out Value | Power Out Tags |
|--|--|--|--|--|--|
| - | Primary | ..Primary..PwrIn/PropertyId:Value | ..Primary..PwrIn/Tags |  ..Primary..PwrOut/PropertyId:Value | ..Primary..PwrOut/Tags  |
| - | Secondary | ..Secondary..PwrIn/PropertyId:Value | ..Secondary..PwrIn/Tags |  ..Secondary..PwrOut/PropertyId:Value | ..Secondary..PwrOut/Tags  |

## Field
Each data field represents a particular source of information, such as a data item's `.Id` or the values from one of its properties.

### Label
A data field's label is a friendly name. Null, empty or whitespace is not allowed for a data field label.

When the data view is resolved and data fields produce field mappings, labels are trimmed of whitespace and used as the field mappings' identifier. For example:
| Timestamp | Power In Value | Power Out Value |
|--|--|--|

In cases where the identifiers are unique, the identifier is suffixed with an ordinal number, its position. For example:

| Timestamp.0 | Value.1 | Value.2 |
|--|--|--|

There are four special parameters available for use in field labels:
- `{IdentifyingValue}` - the value of the identifying field
- `{FirstKey}` - the value of the first of the `"Keys"` specified on the field
- `{QueryId}` - the id of the query that produced the field
- `{MeasurementFirstKey}` *(Coming Soon)* - the value of the first of the `"MeasurementKeys"` specified on the field

If a special parameter fails to resolve, it becomes an empty string, `""`.

### Source
A field's [`.Source`](xref:DataViewsQuickStartDefine#fieldsource-enumeration) indicates where the field's values will come from, if applicable. A field of source type `FieldSource.NotApplicable` cannot be used as a data field.

### Keys
In certain cases, a field may need to address data _within_ its data source, such as a particular Metadata value of a data item. This applies to the sources `Metadata`, `PropertyId`, and `PropertyName`.

Multiple keys may be specified in the field's `.Keys`. This is a way to overcome differences in properties or metadata across data items. Keys are evaluated in order specified until a match is found, i.e. first-match-wins.

For field sources that do not use keys (`FieldSource.NotApplicable`, `FieldSource.Id` and `FieldSource.Name`), any keys specified are ignored.

#### Special case: Tags
The field source `FieldSource.Tags` is a special case due to the nature of tags.

On a field of source `FieldSource.Tags`, its collection of `.Keys` represents a whitelist.

##### Example
Given a stream with tags `[ "Weather", "Low Resolution", "Gen2" ]`  

A field of source `FieldSource.Tags` and `.Keys` `[ "Low Resolution", "High Resolution", "Gen1", "Gen2" ]`

The field's value when resolved will be `[ "Low Resolution", "Gen2" ]`

#### Special Case: Asset measurements (Coming Soon)
*Note: This section covers features that are not yet generally available. If you are interested in trialing these pre-release features, contact your account team for more details.*

Asset measurements are a special case because they require two pieces of information in order to address the data within the measurement: the measurement name and the measurement property id. In order to reference an asset measurement, a field must contain at least one measurement name in the `.MeasurementKeys` collection and at least one property id in the `.Keys` collection.

`.MeasurementKeys` only applies to fields with source `FieldSource.PropertyId`. For all other field sources, `.MeasurementKeys` are ignored. 

Similar to `.Keys`, `.MeasurementKeys` are evaluated in order specified until a match is found, i.e. first-match-wins.
