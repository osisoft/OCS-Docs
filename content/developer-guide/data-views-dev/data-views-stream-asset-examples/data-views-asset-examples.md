---
uid: DataViewsAssetExamples
---

# Asset examples

This section defines some example assets that add context around the streams and types defined in [stream examples](xref:DataViewsStreamExamples) in order to illustrate how assets can be used within a data view.

## Solar inverter assets
Each solar inverter assets contain 2 stream references: power in and power out for the corresponding inverter stream. 

### Asset IDs
8 inverter assets are defined:
```text
"Biltmore Primary Inverter 0",
"Biltmore Primary Inverter 1",
"Biltmore Primary Inverter 2",
"Biltmore Secondary Inverter 0",
"Rosecliff Primary Inverter 0",
"Rosecliff Primary Inverter 1",
"Winterthur Primary Inverter 0",
"Winterthur Secondary Inverter 0",
```

### Asset metadata
Each solar inverter asset contains metadata for site, meter, and inverter.

```json
"Metadata": [
    {
        "Id": "Site",
        "Name": "Site",
        "SdsTypeCode": "String",
        "Value": one of ( "Biltmore" | "Rosecliff" | "Winterthur" )
    },
    {
        "Id": "Meter",
        "Name": "Meter",
        "SdsTypeCode": "String",
        "Value": one of ( "Primary" | "Secondary" )
    },
    {
        "Id": "Inverter",
        "Name": "Inverter",
        "SdsTypeCode": "Int32",
        "Value": one of ( 0 | 1 | 2 )
    },
    {
        "Id": "Nominal Power",
        "Name": "Nominal Power",
        "SdsTypeCode": "Double",
        "Value": 1.21
    }
]
```

### Asset stream references
Each solar inverter asset contains 2 stream references to the correspnding SDS streams for the solar inverter.

```json
"StreamReferences": [
    {
        "Id": "Power In",
        "Name": "Power In",
        "StreamId": one of ( "BILT.Meter.Primary.Inverter.0.PwrIn" | "BILT.Meter.Primary.Inverter.1.PwrIn" | "BILT.Meter.Primary.Inverter.2.PwrIn" | "BILT.Meter.Secondary.Inverter.0.PwrIn" | "ROSE.Meter.Primary.Inverter.0.PwrIn" | "ROSE.Meter.Primary.Inverter.1.PwrIn" | "WINT.Meter.Primary.Inverter.0.PwrIn" | "WINT.Meter.Secondary.Inverter.0.PwrIn" )
    },
    {
        "Id": "Power Out",
        "Name": "Power Out", 
        "StreamId": one of ( "BILT.Meter.Primary.Inverter.0.PwrOut" | "BILT.Meter.Primary.Inverter.1.PwrOut" | "BILT.Meter.Primary.Inverter.2.PwrOut" | "BILT.Meter.Secondary.Inverter.0.PwrOut" | "ROSE.Meter.Primary.Inverter.0.PwrOut" | "ROSE.Meter.Primary.Inverter.1.PwrOut" | "WINT.Meter.Primary.Inverter.0.PwrOut" | "WINT.Meter.Secondary.Inverter.0.PwrOut" )
    }
]
```

### An example asset
```json
{
    "Id": "Biltmore Primary Inverter 0",
    "Name": "Biltmore Primary Inverter 0",
    "Metadata": [
        {
            "Id": "Site",
            "Name": "Site",
            "SdsTypeCode": "String",
            "Value": "Biltmore"
        },
        {
            "Id": "Meter",
            "Name": "Meter",
            "SdsTypeCode": "String",
            "Value": "Primary"
        },
        {
            "Id": "Inverter",
            "Name": "Inverter",
            "SdsTypeCode": "Int64",
            "Value": 0
        },
        {
            "Id": "Nominal Power",
            "Name": "Nominal Power",
            "SdsTypeCode": "Double",
            "Value": 1.21
        }
    ],
    "StreamReferences": [
        {
            "Id": "Power In",
            "Name": "Power In",
            "StreamId": "BILT.Meter.Primary.Inverter.0.PwrIn"
        },
        {
            "Id": "Power Out",
            "Name": "Power Out", 
            "StreamId": "BILT.Meter.Primary.Inverter.0.PwrOut"
        }
    ]
}
```