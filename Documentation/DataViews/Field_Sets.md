---
uid: DataViewsFieldSets
---

# Field Sets

A data view is likely to include multiple fields of information. One field serves as the index (e.g. Timestamp), and others contain information from or about the data items in the data view. 

Individual fields are organized into `FieldSet`s. Field sets are collections of fields that share a common role or source type. Each field set performs a specific type of role:
- FieldSetSourceType.**Index** - Provides the index field for the data view. A data view must have exactly one Index field set.
- FieldSetSourceType.**GroupingValue** - Displays values that the view is [grouped](xref:DataViewsGrouping) by.
- FieldSetSourceType.**DataItem** - Resolves for each data item from a particular query.

## Using field sets

### Available field sets
The typical workflow for adding field sets, and the fields in them, is to use or adapt the [available field sets](xref:DataViewsAvailableFieldSets) that resolve for the data view. This workflow is demonstrated in the [Quick Start - Define a Data View](xref:DataViewsQuickStartDefine).

### Index field set
A data view must have exactly one field set serving as its index: a field set whose `.SourceType` is `FieldSetSourceType.Index`. Currently, because the supported index type is a non-compound "DateTime", the index field set may contain only one `Field`. That `Field` must be of `.Source` `FieldSource.None`, because the data views engine provides interpolated index values.

### Data item field sets
Field sets whose source is the `DataItem`s from a `Query` will "resolve" into fields for each data item. If the data items have been [grouped](xref:DataViewsGrouping), then this happens within the context of each group.

#### Example: Defining field sets
Let us take a subset of the [example scenario](xref:DataViewsExampleScenario)'s power inverter streams, returned by the `Query` [value](xref:sdsSearching) `"TypeId:docs-pi-inverter AND Site:Winterthur"`. 

| Site | Meter | Measurement | Stream Id | Tags |
|--|--|--|--|--|--|
| Winterthur | Primary | Power In | WINT.Meter.Primary.Inverter.0.PwrIn | Low Resolution |
| Winterthur | Primary | Power Out | WINT.Meter.Primary.Inverter.0.PwrOut | Low Resolution |
| Winterthur | Secondary | Power In | ROSE.Meter.Secondary.Inverter.0.PwrIn | Low Resolution |
| Winterthur | Secondary | Power Out | ROSE.Meter.Secondary.Inverter.0.PwrOut | Low Resolution |

The following represents a data view grouped by "Meter", including fields for the grouping value, and each data item's "Tags" and property "Value":

```json
{
  "Id": "quickstart",
  "Queries": [
    { 
      "Id": "inverters",
      "Value": "TypeId:docs-pi-inverter AND Site:Winterthur"
    }
  ],
  "GroupingFields": [
    {
          "Source": "Metadata",
          "Keys": [ "Meter" ],
          "Label": "{IdentifyingValue} {FirstKey}"
    },
  ],
  "FieldSets": [
    {
      "SourceType": "Index",
      "Fields": [
        {
          "Label": "Timestamp"
        }
      ]
    },
    {
      "SourceType": "GroupingValue",
      "Fields": [
        {
          "Keys": [ "0" ],
          "Label": "{GroupingFieldLabel}"
        }
      ],
    },
    {
      "SourceType": "DataItem",
      "QueryId": "inverters",
      "Fields": [
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "Label": "{IdentifyingValue} {FirstKey}"
        },
        {
          "Source": "Tags",
          "Keys": [ "Low Resolution", "High Resolution" ],
          "Label": "{IdentifyingValue} Tags"
        },
      ],
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

To fix this, we will add a `.IdentifyingField` to the field set.

#### Identifying field
If the field set resolves to multiple data items in any group (or if grouping is not used), then a field should be designated as the field set's `.IdentifyingField`. If one lone criterion is not a sufficient or useful way of disambiguating the fields, then [grouping](xref:DataViewsGrouping) by additional criteria may be necessary.

#### Example: Adding an identifying field
To the data view from the previous example, we will add a `Field` as the `.IdentifyingField` of its field set. In this example, it makes sense to identify each data item by its _Measurement_.

```json
{
  "Id": "quickstart",
  "Queries": [
    { 
      "Id": "inverters",
      "Value": "TypeId:docs-pi-inverter AND Site:Winterthur"
    }
  ],
  "GroupingFields": [
    {
          "Source": "Metadata",
          "Keys": [ "Meter" ],
          "Label": "{IdentifyingValue} {FirstKey}"
    },
  ],
  "FieldSets": [
    {
      "SourceType": "Index",
      "Fields": [
        {
          "Label": "Timestamp"
        }
      ]
    },
    {
      "SourceType": "GroupingValue",
      "Fields": [
        {
          "Keys": [ "0" ],
          "Label": "{GroupingFieldLabel}"
        }
      ],
    },
    {
      "SourceType": "DataItem",
      "QueryId": "inverters",
      "IdentifyingField": {
        {
          "Source": "Metadata",
          "Keys": [ "Measurement" ],
        },
      },
      "Fields": [
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "Label": "{IdentifyingValue} {FirstKey}"
        },
        {
          "Source": "Tags",
          "Keys": [ "Low Resolution", "High Resolution" ],
          "Label": "{IdentifyingValue} Tags"
        },
      ],
    }
  ]
}
```

The result is much more consumable. The field identifiers are no longer ambiguous, and like data items are aligned across groups:

| Timestamp | Meter | Power In Value | Power In Tags | Power Out Value | Power Out Tags |
|--|--|--|--|--|--|
| - | Primary | ..Primary..PwrIn/PropertyId:Value | ..Primary..PwrIn/Tags |  ..Primary..PwrOut/PropertyId:Value | ..Primary..PwrOut/Tags  |
| - | Secondary | ..Secondary..PwrIn/PropertyId:Value | ..Secondary..PwrIn/Tags |  ..Secondary..PwrOut/PropertyId:Value | ..Secondary..PwrOut/Tags  |

## Field
Each field represents a particular source of information, such as a data item's `.Id` or the values from one of its properties.

### Label
A field's label is a friendly name. 

When the data view is resolved and fields produce field mappings, labels are trimmed of whitespace and used as the field mappings' identifier. For example:
| Timestamp | Power In Value | Power Out Value |
|--|--|--|

In cases where the identifiers are unique, the identifier is suffixed with an ordinal number, its position. For example:

| Timestamp.0 | Value.1 | Value.2 |
|--|--|--|

There are three special parameters available for use in field labels:
- `{GroupingFieldLabel}` - the value of the grouping field
- `{IdentifyingValue}` - the value of the identifying field
- `{FirstKey}` - the value of the first of the `"Keys"` specified on the field

If a special parameter fails to resolve, it becomes an empty string, `""`.

### Source
A field's [`.Source`](xref:DataView#fieldsource-enumeration) indicates where the field's values will come from, if applicable.

### Keys
In certain cases, a field may need to address data _within_ its data source, such as a particular Metadata value of a data item. This applies to the sources `Metadata`, `PropertyId`, and `PropertyName`.

Multiple keys may be specified in the field's `.Keys`. This is a way to overcome differences in properties or metadata across data items. Keys are evaluated in order specified until a match is found, i.e. first-match-wins.

For field sources that do not use keys (`FieldSource.None`, `FieldSource.Id` and `FieldSource.Name`), any keys specified are ignored.

#### Special case: Tags
The field source `FieldSource.Tags` is a special case due to the nature of tags.

On a field of source `FieldSource.Tags`, its collection of `.Keys` represents a whitelist.

##### Example
Given a stream with tags `[ "Weather", "Low Resolution", "Gen2" ]`  

A field of source `FieldSource.Tags` and `.Keys` `[ "Low Resolution", "High Resolution", "Gen1", "Gen2" ]`

The field's value when resolved will be `[ "Low Resolution", "Gen2" ]`

