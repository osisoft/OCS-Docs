---
uid: DataViewsGrouping
---

# Group data items

A group can be returned from a resolved data view that describes how data view results will be grouped. The data items of a data view may be organized by _grouping_ them. It is one way of producing a meaningful, consumable shape of data.

Grouping is optional when defining the data view. If the `.GroupingFields` section is not defined on the data view, the resolved data view shows a single group with all eligible data items. If the `.GroupingFields` section is defined, the resolved data view shows multiple groups, each with the list of data items for the group and the `.GroupingValues` field showing the matching group's value(s). In this case, if a data item does not match any group, it is added to all groups.

Groups are ordered alphabetically by the first grouping value for each group. Within each group, data items are ordered alphabetically by data item id.


## Purpose of grouping
Without grouping, all of the data items returned by a `Query` will appear side-by-side. If the view includes many data items, its data records will be enormous. The fields are also likely to be ambiguous.

[Identifying](xref:DataViewsFieldSets#identifying-field) the items within each field set is one way to disambiguate the fields, but only one `Field` may be an identifying field. What if multiple metadata `Field`s are required to fully describe each data item? The [example below](xref:DataViewsGrouping#example-scenario) shows exactly that case: power inverters that are described by a site, meter, and number. Grouping can organize the data items into shapes that are consumable and/or represent a physical asset.

## How it works
To group a data view, specify one or more `Field` objects as the `DataView`'s `.GroupingFields`. 

### Eligible grouping fields
Fields whose values come from data item `FieldSource.Id`, `FieldSource.Name`, `FieldSource.Metadata`, or `FieldSource.Tags` are eligible to be used as grouping fields. Grouping field label is required. Keys are required for the grouping fields with source type `FieldSource.Metadata` and `FieldSource.Tags`. Keys are not applicable for grouping fields with source type of `FieldSource.Id` or `FieldSource.Name`.

## Uses of grouping
Grouping can be used to separate the data items from each other, and to join different types of data items together.

### Separating data items
Separating the data items from each other makes the data view's data records smaller and more granular. It is also possible to produce shapes that mimic physical or logical assets.

#### Example scenario
For the following examples, assume a subgroup of the [stream examples](xref:DataViewsExampleScenario) power inverter streams, produced by a `Query` [value](xref:sdsSearching) such as `"TypeId:docs-pi-inverter AND (Site:Rosemont OR Site:Winterthur)"`. This is to keep the example succinct.


| Site | Meter | Inverter | Measurement | Stream Id |
|--|--|--|--|--|
| Rosemont | Primary | 0 | Power In | ROSE.Meter.Primary.Inverter.0.PwrIn |
| Rosemont | Primary | 0 | Power Out | ROSE.Meter.Primary.Inverter.0.PwrOut |
| Rosemont | Primary | 1 | Power In | ROSE.Meter.Primary.Inverter.1.PwrIn |
| Rosemont | Primary | 1 | Power Out | ROSE.Meter.Primary.Inverter.1.PwrOut |
| Winterthur | Primary | 0 | Power In | WINT.Meter.Primary.Inverter.0.PwrIn |
| Winterthur | Primary | 0 | Power Out | WINT.Meter.Primary.Inverter.0.PwrOut |
| Winterthur | Secondary | 0 | Power In | WINT.Meter.Secondary.Inverter.0.PwrIn |
| Winterthur | Secondary | 0 | Power Out | WINT.Meter.Secondary.Inverter.0.PwrOut |

#### Example: No grouping
Let us start with a simple data view. It queries for the aforementioned streams, and includes the "Value" property of each stream.

```json
{
  "Id": "quickstart",
  "Queries": [
    { 
      "Id": "inverters",
      "Kind": "Stream",
      "Value": "TypeId:docs-pi-inverter AND (Site:Rosemont OR Site:Winterthur)"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "inverters",
      "DataFields": [
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "Label": "{IdentifyingValue} {Key}"
        }
      ],
    }
  ]
}
```
Unfortunately, the initial result is not very usable. The fields are ambiguous.  Eight fields are simply labeled "Value" with an index appendended to the end and the size of each data record is tied to the number of inverter streams found by the query.

| Timestamp.0 | Value.1 | Value.2 | Value.3 | ... |
|--|--|--|--|--|
| - | ROSE.Meter.Primary.Inverter.0.PwrIn/Value | ROSE.Meter.Primary.Inverter.0.PwrOut/Value | ROSE.Meter.Primary.Inverter.1.PwrIn/Value | ... |

#### Example: Complete uniqueness, grouping by data item id

A simple way of disambiguating the data items is to group them by data item id. This example includes two actions:

- Add data item id as a grouping field
- Include fields for metadata: Site, Meter, Inverter, Measurement.

```json
{
  "Id": "quickstart",
  "Queries": [
    { 
      "Id": "inverters",
      "Kind": "Stream",
      "Value": "TypeId:docs-pi-inverter AND (Site:Rosemont OR Site:Winterthur)"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "inverters",
      "DataFields": [
        {
          "Source": "Metadata",
          "Keys": [ "Site" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "Metadata",
          "Keys": [ "Meter" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "Metadata",
          "Keys": [ "Inverter" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "Metadata",
          "Keys": [ "Measurement" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "Label": "{IdentifyingValue} {Key}"
        }
      ],
    }
  ],
  "GroupingFields": [
    {
          "Source": "Id",
          "Label": "{IdentifyingValue} Id"
    },
  ]
}
```
The result is much closer to being usable. The records are no longer ambiguous. However, they do not mirror any physical or logical asset.

| Timestamp | Id | Site | Meter | Inverter | Measurement | Value |
|--|--|--|--|--|--|--|
| - | "ROSE.Meter.Primary.Inverter.0.PwrIn"   | "Rosemont" | "Primary" | "0" | "Power In" |  ROSE.Meter.Primary.Inverter.0.PwrIn/Value |
| - | "ROSE.Meter.Primary.Inverter.0.PwrOut"  | "Rosemont" | "Primary" | "0" | "Power Out" |ROSE.Meter.Primary.Inverter.0.PwrOut/Value |
| - | "ROSE.Meter.Primary.Inverter.1.PwrIn"   | "Rosemont" | "Primary" | "1" | "Power In" |ROSE.Meter.Primary.Inverter.1.PwrIn/Value |
| - | "ROSE.Meter.Primary.Inverter.1.PwrOut"  | "Rosemont" | "Primary" | "1" | "Power Out" |ROSE.Meter.Primary.Inverter.1.PwrOut/Value |
| - | "WINT.Meter.Primary.Inverter.0.PwrIn"   | "Winterthur" | "Primary" | "0" | "Power In" |WINT.Meter.Primary.Inverter.0.PwrIn/Value |
| - | "WINT.Meter.Primary.Inverter.0.PwrOut"  | "Winterthur" | "Primary" | "0" | "Power Out" |WINT.Meter.Primary.Inverter.0.PwrOut/Value |
| - | "WINT.Meter.Secondary.Inverter.0.PwrIn" | "Winterthur" | "Secondary" | "0" | "Power In" |WINT.Meter.Secondary.Inverter.0.PwrIn/Value |
| - | "WINT.Meter.Secondary.Inverter.0.PwrOu" | "Winterthur" | "Secondary" | "0" | "Power Out" |WINT.Meter.Secondary.Inverter.0.PwrOut/Value |

#### Example: Data records that reflect real-world assets
Instead of grouping by data item id, let us group by metadata. This example uses:

- the `Field`s for Site, Meter, and Inverter metadata as the data view's `.GroupingFields`
- the `Field` for Measurement metadata as the data item `FieldSet`'s `.IdentifyingField`

```json
{
  "Id": "quickstart",
  "Queries": [
    { 
      "Id": "inverters",
      "Kind": "Stream",
      "Value": "TypeId:docs-pi-inverter AND (Site:Rosemont OR Site:Winterthur)"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "inverters",
      "DataFields": [
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "Label": "{IdentifyingValue} {Key}"
        }
      ],
      "IdentifyingField": {
          "Source": "Metadata",
          "Keys": [ "Measurement" ],
          "Label": "{IdentifyingValue} {Key}"
        }
    }
  ],
  "GroupingFields": [
        {
          "Source": "Metadata",
          "Keys": [ "Site" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "Metadata",
          "Keys": [ "Meter" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "Metadata",
          "Keys": [ "Inverter" ],
          "Label": "{IdentifyingValue} {Key}"
        }
  ]
}
```
The resulting data mappings reflect the data on a per-inverter basis, mirroring the physical asset:

| Timestamp | Site | Meter | Inverter | Power In Value | Power Out Value |
|--|--|--|--|--|--|
| - | "Rosemont" | "Primary" | "0" |  ROSE.Meter.Primary.Inverter.0.PwrIn/Value | ROSE.Meter.Primary.Inverter.0.PwrOut/Value |
| - | "Rosemont" | "Primary" | "1" | ROSE.Meter.Primary.Inverter.1.PwrIn/Value |ROSE.Meter.Primary.Inverter.1.PwrOut/Value |
| - | "Winterthur" | "Primary" | "0" | WINT.Meter.Primary.Inverter.0.PwrIn/Value | WINT.Meter.Primary.Inverter.0.PwrOut/Value |
| - | "Winterthur" | "Secondary" | "0" | WINT.Meter.Secondary.Inverter.0.PwrIn/Value | WINT.Meter.Secondary.Inverter.0.PwrOut/Value |

**Note:** Grouping by Meter and Inverter overcomes the differences across Sites: not every site has a Secondary meter, and not every Meter has the same number of Inverters. This is not a problem.

### Associating data items with each other
Another use of grouping fields is to "join" the data items returned by different queries, such as adding weather data for each power inverter.

#### Example: Adding weather data to the real-world assets
This example includes two actions:

- Add a second `Query` for "site weather"
- Add a new `FieldSet` for the data items from the "site weather" query, with `Field`s for "SolarRadiation" and "Temperature"

```json
{
  "Id": "quickstart",
  "Queries": [
    { 
      "Id": "inverters",
      "Kind": "Stream",
      "Value": "TypeId:docs-pi-inverter AND (Site:Rosemont OR Site:Winterthur)"
    },
    { 
      "Id": "site weather",
      "Kind": "Stream",
      "Value": "TypeId:docs-omf-weather* AND (Site:Rosemont OR Site:Winterthur)"
    }
  ],
  "DataFieldSets": [
    {
      "QueryId": "inverters",
      "DataFields": [
        {
          "Source": "PropertyId",
          "Keys": [ "Value" ],
          "Label": "{IdentifyingValue} {Key}"
        }
      ],
      "IdentifyingField": {
          "Source": "Metadata",
          "Keys": [ "Measurement" ],
          "Label": "{IdentifyingValue} {Key}"
        }
    },
    {
      "QueryId": "site weather",
      "DataFields": [
        {
          "Source": "PropertyId",
          "Keys": [ "SolarRadiation" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "PropertyId",
          "Keys": [ "Temperature", "AmbientTemperature" ],
          "Label": "{IdentifyingValue} {Key}"
        }
      ]
    }
  ],
  "GroupingFields": [
        {
          "Source": "Metadata",
          "Keys": [ "Site" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "Metadata",
          "Keys": [ "Meter" ],
          "Label": "{IdentifyingValue} {Key}"
        },
        {
          "Source": "Metadata",
          "Keys": [ "Inverter" ],
          "Label": "{IdentifyingValue} {Key}"
        }
  ]
}
```

This "join" works because inverters and weather stations have common metadata: _Site_.

| Timestamp | Site | Meter | Inverter | Power In Value | Power Out Value | SolarRadiation | Temperature |
|--|--|--|--|--|--|--|--|
| - | "Rosemont" | "Primary" | "0" |  ROSE.Meter.Primary.Inverter.0.PwrIn/Value | ROSE.Meter.Primary.Inverter.0.PwrOut/Value | WS_ROSE/SolarRadiation | WS_ROSE/Temperature |
| - | "Rosemont" | "Primary" | "1" | ROSE.Meter.Primary.Inverter.1.PwrIn/Value |ROSE.Meter.Primary.Inverter.1.PwrOut/Value | WS_ROSE/SolarRadiation | WS_ROSE/Temperature |
| - | "Winterthur" | "Primary" | "0" | WINT.Meter.Primary.Inverter.0.PwrIn/Value | WINT.Meter.Primary.Inverter.0.PwrOut/Value | WS_WINT/SolarRadiation | WS_WINT/AmbientTemperature |
| - | "Winterthur" | "Secondary" | "0" | WINT.Meter.Secondary.Inverter.0.PwrIn/Value | WINT.Meter.Secondary.Inverter.0.PwrOut/Value | WS_WINT/SolarRadiation | WS_WINT/AmbientTemperature |
