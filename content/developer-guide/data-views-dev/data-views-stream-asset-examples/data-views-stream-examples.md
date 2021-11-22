---
uid: DataViewsStreamExamples
---

# Stream examples

This section uses example streams to illustrate data view concepts. The streams are of three types:
- docs-pi-inverter | _simulates solar power inverter data collected via PI to OCS_
- docs-omf-weather-gen1 | _simulates weather data collected from an OMF source_
- docs-omf-weather-gen2 | _simulates weather data collected from an OMF source, but with some additional/renamed properties_

Each solar inverter is associated with some physical location. There is a weather stream for each location. 

Use the [bulk uploader](https://github.com/osisoft/sample-ocs-bulk_upload-dotnet) to create the types and streams from the stream examples. See the configuration files specific to the data views stream examples in the [sample collections](https://github.com/osisoft/sample-ocs-bulk_upload-dotnet/tree/master/SampleCollections/DataViewQuickStart).

Data views are made to bring order to a tangle of data streams. Despite appearing complex and verbose, this example is likely much simpler than your real-world data. This example illustrates how data views can render real-world data consumable for data science.

## Solar inverter streams
These streams represent values collected via PI to OCS, originally collected by a PI System. Each stream value contains a timestamp _(Timestamp)_ and a measurement _(Value)_.

### Type
```json
  {
    "Id": "docs-pi-inverter",
    "Name": "Inverter",
    "SdsTypeCode": "Object",
    "Properties": [
      {
        "Id": "Timestamp",
        "Name": "Timestamp",
        "IsKey": true,
        "SdsType": { "SdsTypeCode": "DateTime" }
      },
      {
        "Id": "Value",
        "Name": "Value",
        "SdsType": { "SdsTypeCode": "Double" }
      }
    ]
  }
```
### Stream IDs
16 inverter streams are defined:
```text
"BILT.Meter.Primary.Inverter.0.PwrIn",
"BILT.Meter.Primary.Inverter.0.PwrOut",
"BILT.Meter.Primary.Inverter.1.PwrIn",
"BILT.Meter.Primary.Inverter.1.PwrOut",
"BILT.Meter.Primary.Inverter.2.PwrIn",
"BILT.Meter.Primary.Inverter.2.PwrOut",
"BILT.Meter.Secondary.Inverter.0.PwrIn",
"BILT.Meter.Secondary.Inverter.0.PwrOut",
"ROSE.Meter.Primary.Inverter.0.PwrIn",
"ROSE.Meter.Primary.Inverter.0.PwrOut",
"ROSE.Meter.Primary.Inverter.1.PwrIn",
"ROSE.Meter.Primary.Inverter.1.PwrOut",
"WINT.Meter.Primary.Inverter.0.PwrIn",
"WINT.Meter.Primary.Inverter.0.PwrOut",
"WINT.Meter.Secondary.Inverter.0.PwrIn",
"WINT.Meter.Secondary.Inverter.0.PwrOut",
```
### Tags and metadata
Each inverter stream has some descriptive tags assigned, and metadata key-values describing its function.
```text
Tags: some subset of [ "Commercial", "Residential", "Critical Asset" ]
Metadata: { 
            "Site" : one of ( "Biltmore" | "Rosecliff" | "Winterthur" ),
            "Measurement": one of ( "Power In" | "Power Out" ),
            "Meter": one of ( "Primary" | "Secondary" ),
            "Inverter": one of ( "0" | "1" | "2" )
            "Nominal Power MW": "1.21"
          }
```
## Weather streams
These streams simulate data collected via OMF from a weather station. There are two "generations" represented: Gen2 adds one property and renames another, as compared to Gen1.

### Tags and metadata
Each weather stream has some descriptive tags assigned, and one metadata key-value indicating its Site. These are the same sites with which the inverters are associated.
```text
Tags: some subset of [ "Weather", "Low Resolution", "High Resolution", "Gen1", "Gen2" ]
Metadata: { "Site" : one of ( "Biltmore" | "Rosecliff" | "Winterthur" ) }
```

### Weather, generation 1
#### Type
```json
  {
    "Id": "docs-omf-weather-gen1",
    "Name": "WeatherGen1",
    "SdsTypeCode": "Object",
    "Properties": [
      {
        "Id": "Timestamp",
        "Name": "Timestamp",
        "IsKey": true,
        "SdsType": { "SdsTypeCode": "DateTime" }
      },
      {
        "Id": "SolarRadiation",
        "Name": "Solar Radiation",
        "SdsType": { "SdsTypeCode": "Int32" }
      },
      {
        "Id": "Temperature",
        "Name": "Temperature",
        "SdsType": { "SdsTypeCode": "Double" }
      }
    ]
  }
```
#### Stream IDs
Two streams of this type are defined:
```text
"WS_BILT",
"WS_ROSE",
```

### Weather, generation 2
The latest and greatest Gen2 weather stations report a new property, _Cloud Cover_, but also rename _Temperature_ to _Ambient Temperature_. They are otherwise similar to Gen1.

#### Type
```json
  {
    "Id": "docs-omf-weather-gen2",
    "Name": "WeatherGen2",
    "SdsTypeCode": "Object",
    "Properties": [
      {
        "Id": "Timestamp",
        "Name": "Timestamp",
        "IsKey": true,
        "SdsType": { "SdsTypeCode": "DateTime" }
      },
      {
        "Id": "SolarRadiation",
        "Name": "Solar Radiation",
        "SdsType": { "SdsTypeCode": "Int32" }
      },
      {
        "Id": "AmbientTemperature",
        "Name": "Ambient Temperature",
        "SdsType": { "SdsTypeCode": "Double" }
      },
      {
        "Id": "CloudCover",
        "Name": "Cloud Cover",
        "SdsType": { "SdsTypeCode": "Int32" }
      }
    ]
  }
```

#### Stream IDs
One stream of this type is defined:
```text
"WS_WINT"
```

