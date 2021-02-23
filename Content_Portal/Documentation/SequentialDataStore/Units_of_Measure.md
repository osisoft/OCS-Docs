---
uid: unitsOfMeasure
---

# Units of measure

The Sequential Data Store (SDS) provides a collection of built-in units of measure (UOM). These units of measure can be [associated](#associating-a-unit-of-measure-with-a-sdstype) with streams and types in order to provide unit information for stream data that model measurable quantities. If data has unit information associated with it, SDS is able to support unit conversions when retrieving data. See [Reading data](xref:sdsReadingData) for more information.

Since a unit of measure (meter, for example) defines the magnitude of a quantity (for example, length), SDS represents this by way of two objects: SdsUom and SdsUomQuantity. 

## SdsUom

SdsUom represents a single unit of measure, such as 'meter'.

The following table shows the required and optional SdsUom fields.

| Property         | Type   | Optionality | Details | Example  |
| ---------------- | ------ | ----------- | ------- | -------- |
| Id               | String | Required    | Unique identifier for the unit of measure | meters per second |
| Abbreviation     | String | Optional    | Abbreviation for the unit of measure  | m/s |
| Name             | String | Optional    | Full name for the unit of measure | Meters per second |
| DisplayName      | String | Optional    | Friendly display name for the unit of measure | meters per second |
| QuantityId       | String | Required    | The identifier associated with the quantity that this unit is a measure of | Velocity|
| ConversionFactor | Double | Required    | Used for unit conversions.  When a value of this unit is multiplied by the ConversionFactor and then incremented by the ConversionOffset, the value in terms of the base unit of the corresponding quantity is returned. | 1.0 |
| ConversionOffset | Double | Required    | Used for unit conversions. See details for ConversionFactor | 0.0  |

## SdsUomQuantity

SdsUomQuantity represents a single measurable quantity (for example, length).

The following table shows the required and optional SdsUomQuantity fields.

| Property   | Type    | Optionality | Details | Example  |
| ---------- | ------- | ----------- | ------- | ---------|
| Id         | String  | Required    | Unique identifier for the quantity | Velocity |
| Name       | String  | Optional    | Full name for the quantity | Velocity |
| BaseUom    | SdsUom  | Required    | The base unit of measure for this quantity. All other Uom's measuring this quantity will have ConversionFactor's and ConversionOffsets relative to the BaseUom  | SdsUom representing "meters per second" |
| Dimensions | short[] | Optional    | Reserved for internal use. Represents the seven base SI dimensions: Length, Mass, Time, Electric Current, Thermodynamic Temperature, Amount of Substance, and Luminous Density. | [1,0,-1,0,0,0,0] |

## Supported system-defined unit quantities
A list of the supported quantities and their base unit of measures is below. Supported quantities are read-only.

| Quantity Id                                 | Base Uom Id               |
| ------------------------------------------- | ------------------------- |
| Angular Velocity                            | radian per second         |
| Area                                        | square meter              |
| Computer Storage                            | byte                      |
| Density                                     | kilogram per cubic meter  |
| Dynamic Viscosity                           | pascal second             |
| Electric Charge                             | coulomb                   |
| Electric Current                            | ampere                    |
| Electric Potential                          | volt                      |
| Electric Resistance                         | ohm                       |
| Energy                                      | joule                     |
| Entropy and Heat Capacity                   | joule per kelvin          |
| Force                                       | newton                    |
| Frequency                                   | hertz                     |
| Length                                      | meter                     |
| Luminous Intensity                          | candela                   |
| Mass                                        | kilogram                  |
| Mass Flow Rate                              | kilogram per second       |
| Molar Flow Rate                             | mole per second           |
| Molecular Weight                            | kilogram per mole         |
| Amount of Substance                         | mole                      |
| Plane Angle                                 | radian                    |
| Power                                       | watt                      |
| Pressure                                    | pascal                    |
| Quantity                                    | count                     |
| Ratio                                       | percent                   |
| Specific Energy                             | joule per kilogram        |
| Specific Entropy and Specific Heat Capacity | joule per kilogram kelvin |
| Specific Volume                             | cubic meter per kilogram  |
| Speed                                       | meter per second          |
| Temperature                                 | kelvin                    |
| Temperature (Delta)                         | delta kelvin              |
| Time                                        | second                    |
| Volume                                      | cubic meter               |
| Volume Flow Rate                            | cubic meter per second    |

## Supported system-defined units of measure
A list of the supported units of measure is below. Supported units of measure are read-only.

| Uom Id                                           | Abbreviation | Quantity Id                                 | Conversion Factor | Conversion Offset |
| ------------------------------------------------ | ------------ | ------------------------------------------- | ----------------- | ----------------- |
| count                                            | count        | Quantity                                    | 1                 | 0                 |
| Ampere hour                                      | Ah           | Electric Charge                             | 3600              | 0                 |
| coulomb                                          | C            | Electric Charge                             | 1                 | 0                 |
| kilogram per second                              | kg/s         | Mass Flow Rate                              | 1                 | 0                 |
| long ton per day                                 | lton/d       | Mass Flow Rate                              | 0.011759802       | 0                 |
| million pound per day                            | MMlb/d       | Mass Flow Rate                              | 5.24991169        | 0                 |
| short ton per day                                | ston/d       | Mass Flow Rate                              | 0.010499823       | 0                 |
| thousand pound per day                           | klb/d        | Mass Flow Rate                              | 0.005249912       | 0                 |
| gram per second                                  | g/s          | Mass Flow Rate                              | 0.001             | 0                 |
| pound per second                                 | lb/s         | Mass Flow Rate                              | 0.45359237        | 0                 |
| tonne per day                                    | t/d          | Mass Flow Rate                              | 0.011574074       | 0                 |
| long ton                                         | lton         | Mass                                        | 1016.046909       | 0                 |
| million pound                                    | MM lb        | Mass                                        | 453592.37         | 0                 |
| ounce                                            | oz           | Mass                                        | 0.028349523       | 0                 |
| short ton                                        | ston         | Mass                                        | 907.18474         | 0                 |
| thousand pound                                   | klb          | Mass                                        | 453.59237         | 0                 |
| ton                                              | ton          | Mass                                        | 907.18474         | 0                 |
| gram                                             | g            | Mass                                        | 0.001             | 0                 |
| milligram                                        | mg           | Mass                                        | 1.00E-06          | 0                 |
| pound                                            | lb           | Mass                                        | 0.45359237        | 0                 |
| tonne                                            | t            | Mass                                        | 1000              | 0                 |
| kilogram                                         | kg           | Mass                                        | 1                 | 0                 |
| second                                           | s            | Time                                        | 1                 | 0                 |
| hour                                             | h            | Time                                        | 3600              | 0                 |
| day                                              | d            | Time                                        | 86400             | 0                 |
| month                                            | month        | Time                                        | 2628000           | 0                 |
| week                                             | week         | Time                                        | 604800            | 0                 |
| year                                             | yr           | Time                                        | 31536000          | 0                 |
| minute                                           | min          | Time                                        | 60                | 0                 |
| dyne                                             | dyne         | Force                                       | 1.00E-05          | 0                 |
| kilogram-force                                   | kgf          | Force                                       | 9.80665           | 0                 |
| pound-force                                      | lbf          | Force                                       | 4.448221615       | 0                 |
| newton                                           | N            | Force                                       | 1                 | 0                 |
| watt                                             | W            | Power                                       | 1                 | 0                 |
| million British thermal unit per day             | MM Btu/d     | Power                                       | 12211.29459       | 0                 |
| million British thermal unit per hour            | MM Btu/h     | Power                                       | 293071.0702       | 0                 |
| gigawatt                                         | GW           | Power                                       | 1000000000        | 0                 |
| megawatt                                         | MW           | Power                                       | 1000000           | 0                 |
| British thermal unit per hour                    | Btu/h        | Power                                       | 0.29307107        | 0                 |
| calorie per second                               | cal/s        | Power                                       | 4.1868            | 0                 |
| horsepower                                       | hp           | Power                                       | 745.6998716       | 0                 |
| joule per second                                 | J/s          | Power                                       | 1                 | 0                 |
| kilowatt                                         | kW           | Power                                       | 1000              | 0                 |
| megajoule per hour                               | MJ/h         | Power                                       | 277.7777778       | 0                 |
| million calorie per hour                         | MMcal/h      | Power                                       | 1163              | 0                 |
| mole per second                                  | mol/s        | Molar Flow Rate                             | 1                 | 0                 |
| gram mole per second                             | gmol/s       | Molar Flow Rate                             | 1                 | 0                 |
| kilogram mole per second                         | kmol/s       | Molar Flow Rate                             | 1000              | 0                 |
| pound mole per second                            | lbmol/s      | Molar Flow Rate                             | 453.59237         | 0                 |
| meter                                            | m            | Length                                      | 1                 | 0                 |
| centimeter                                       | cm           | Length                                      | 0.01              | 0                 |
| inch                                             | in           | Length                                      | 0.0254            | 0                 |
| International nautical mile                      | nmi          | Length                                      | 1852              | 0                 |
| kilometer                                        | km           | Length                                      | 1000              | 0                 |
| millimeter                                       | mm           | Length                                      | 0.001             | 0                 |
| foot                                             | ft           | Length                                      | 0.3048            | 0                 |
| mile                                             | mi           | Length                                      | 1609.344          | 0                 |
| sixteenth of an inch                             | sxi          | Length                                      | 0.0015875         | 0                 |
| yard                                             | yd           | Length                                      | 0.9144            | 0                 |
| candela                                          | cd           | Luminous Intensity                          | 1                 | 0                 |
| meter per second                                 | m/s          | Speed                                       | 1                 | 0                 |
| centimeter per second                            | cm/s         | Speed                                       | 0.01              | 0                 |
| foot per second                                  | ft/s         | Speed                                       | 0.3048            | 0                 |
| International nautical mile per hour             | nmi/h        | Speed                                       | 0.514444444       | 0                 |
| kilometer per hour                               | km/h         | Speed                                       | 0.277777778       | 0                 |
| mile per hour                                    | mi/h         | Speed                                       | 0.44704           | 0                 |
| revolution per minute                            | rpm          | Angular Velocity                            | 0.104719755       | 0                 |
| radian per second                                | rad/s        | Angular Velocity                            | 1                 | 0                 |
| barrel per day                                   | bbl/d        | Volume Flow Rate                            | 1.84E-06          | 0                 |
| cubic centimeter per second                      | cm3/s        | Volume Flow Rate                            | 1.00E-06          | 0                 |
| cubic foot per second                            | ft3/s        | Volume Flow Rate                            | 0.028316847       | 0                 |
| cubic meter per hour                             | m3/h         | Volume Flow Rate                            | 0.000277778       | 0                 |
| Imperial gallon per minute                       | Imp gal/min  | Volume Flow Rate                            | 7.58E-05          | 0                 |
| liter per second                                 | L/s          | Volume Flow Rate                            | 0.001             | 0                 |
| US gallon per minute                             | US gal/min   | Volume Flow Rate                            | 6.31E-05          | 0                 |
| cubic meter per second                           | m3/s         | Volume Flow Rate                            | 1                 | 0                 |
| pascal                                           | Pa           | Pressure                                    | 1                 | 0                 |
| atmosphere                                       | atm          | Pressure                                    | 101325            | 0                 |
| bar                                              | bar          | Pressure                                    | 100000            | 0                 |
| inches of mercury                                | inHg         | Pressure                                    | 3386.388158       | 0                 |
| kilogram-force per square centimeter             | kgf/cm2      | Pressure                                    | 98066.5           | 0                 |
| kilogram-force per square meter                  | kgf/m2       | Pressure                                    | 9.80665           | 0                 |
| kilopascal                                       | kPa          | Pressure                                    | 1000              | 0                 |
| millimeter of mercury                            | mmHg         | Pressure                                    | 133.3223684       | 0                 |
| newton per square meter                          | N/m2         | Pressure                                    | 1                 | 0                 |
| pound-force per square inch                      | psi          | Pressure                                    | 6894.757293       | 0                 |
| pound-force per square inch (customary)          | psia         | Pressure                                    | 6894.757293       | 0                 |
| torr                                             | torr         | Pressure                                    | 133.3223684       | 0                 |
| square meter                                     | m2           | Area                                        | 1                 | 0                 |
| square foot                                      | ft2          | Area                                        | 0.09290304        | 0                 |
| acre                                             | acre         | Area                                        | 4046.856422       | 0                 |
| square mile                                      | mi2          | Area                                        | 2589988.11        | 0                 |
| square yard                                      | yd2          | Area                                        | 0.83612736        | 0                 |
| hectare                                          | ha           | Area                                        | 10000             | 0                 |
| square centimeter                                | cm2          | Area                                        | 0.0001            | 0                 |
| square inch                                      | in2          | Area                                        | 0.00064516        | 0                 |
| square kilometer                                 | km2          | Area                                        | 1000000           | 0                 |
| square millimeter                                | mm2          | Area                                        | 1.00E-06          | 0                 |
| yobibyte                                         | YiB          | Computer Storage                            | 1.21E+24          | 0                 |
| zebibyte                                         | ZiB          | Computer Storage                            | 1.18E+21          | 0                 |
| exbibyte                                         | EiB          | Computer Storage                            | 1.15E+18          | 0                 |
| pebibyte                                         | PiB          | Computer Storage                            | 1.13E+15          | 0                 |
| tebibyte                                         | TiB          | Computer Storage                            | 1.10E+12          | 0                 |
| gibibyte                                         | GiB          | Computer Storage                            | 1073741824        | 0                 |
| mebibyte                                         | MiB          | Computer Storage                            | 1048576           | 0                 |
| kibibyte                                         | KiB          | Computer Storage                            | 1024              | 0                 |
| yottabyte                                        | YB           | Computer Storage                            | 1.00E+24          | 0                 |
| zettabyte                                        | ZB           | Computer Storage                            | 1.00E+21          | 0                 |
| exabyte                                          | EB           | Computer Storage                            | 1.00E+18          | 0                 |
| petabyte                                         | PB           | Computer Storage                            | 1.00E+15          | 0                 |
| terabyte                                         | TB           | Computer Storage                            | 1.00E+12          | 0                 |
| gigabyte                                         | GB           | Computer Storage                            | 1000000000        | 0                 |
| megabyte                                         | MB           | Computer Storage                            | 1000000           | 0                 |
| kilobyte                                         | kB           | Computer Storage                            | 1000              | 0                 |
| byte                                             | B            | Computer Storage                            | 1                 | 0                 |
| kelvin                                           | K            | Temperature                                 | 1                 | 0                 |
| degree Celsius                                   | °C           | Temperature                                 | 1                 | 273.15            |
| degree Rankine                                   | °R           | Temperature                                 | 0.555555556       | -2.56E-13         |
| degree Fahrenheit                                | °F           | Temperature                                 | 0.555555556       | 255.3722222       |
| milliampere                                      | mA           | Electric Current                            | 0.001             | 0                 |
| ampere                                           | A            | Electric Current                            | 1                 | 0                 |
| joule per gram                                   | J/g          | Specific Energy                             | 1000              | 0                 |
| joule per kilogram                               | J/kg         | Specific Energy                             | 1                 | 0                 |
| British thermal unit per pound                   | Btu/lb       | Specific Energy                             | 2326              | 0                 |
| kilocalorie per kilogram                         | kcal/kg      | Specific Energy                             | 4186.8            | 0                 |
| kilojoule per kilogram                           | kJ/kg        | Specific Energy                             | 1000              | 0                 |
| kilojoule per pound                              | kJ/lb        | Specific Energy                             | 2204.622622       | 0                 |
| British thermal unit per degree Rankine          | Btu/°R       | Entropy and Heat Capacity                   | 1899.100535       | 0                 |
| British thermal unit per degree Fahrenheit       | Btu/°F       | Entropy and Heat Capacity                   | 1899.100535       | 0                 |
| kilojoule per kelvin                             | kJ/K         | Entropy and Heat Capacity                   | 1000              | 0                 |
| joule per kelvin                                 | J/K          | Entropy and Heat Capacity                   | 1                 | 0                 |
| cubic foot per pound                             | ft3/lb       | Specific Volume                             | 0.062427961       | 0                 |
| cubic centimeter per gram                        | cm3/g        | Specific Volume                             | 0.001             | 0                 |
| cubic meter per kilogram                         | m3/kg        | Specific Volume                             | 1                 | 0                 |
| hertz                                            | Hz           | Frequency                                   | 1                 | 0                 |
| mole                                             | mol          | Amount of Substance                         | 1                 | 0                 |
| gram mole                                        | gmol         | Amount of Substance                         | 1                 | 0                 |
| kilogram mole                                    | kmol         | Amount of Substance                         | 1000              | 0                 |
| pound mole                                       | lbmol        | Amount of Substance                         | 453.59237         | 0                 |
| percent                                          | %            | Ratio                                       | 1                 | 0                 |
| parts per billion                                | ppb          | Ratio                                       | 1.00E-07          | 0                 |
| parts per million                                | ppm          | Ratio                                       | 0.0001            | 0                 |
| ohm                                              | Ω            | Electric Resistance                         | 1                 | 0                 |
| gram per gram mole                               | g/gmol       | Molecular Weight                            | 0.001             | 0                 |
| pound per pound mole                             | lb/lbmol     | Molecular Weight                            | 0.001             | 0                 |
| kilogram per mole                                | kg/mol       | Molecular Weight                            | 1                 | 0                 |
| kilogram per kilogram mole                       | kg/kmol      | Molecular Weight                            | 0.001             | 0                 |
| British thermal unit per pound degree Rankine    | Btu/(lb °R)  | Specific Entropy and Specific Heat Capacity | 4186.8            | 0                 |
| British thermal unit per pound degree Fahrenheit | Btu/(lb °F)  | Specific Entropy and Specific Heat Capacity | 4186.8            | 0                 |
| joule per gram kelvin                            | J/(g K)      | Specific Entropy and Specific Heat Capacity | 1000              | 0                 |
| kilojoule per kilogram kelvin                    | kJ/(kg K)    | Specific Entropy and Specific Heat Capacity | 1000              | 0                 |
| joule per kilogram kelvin                        | J/(kg K)     | Specific Entropy and Specific Heat Capacity | 1                 | 0                 |
| kilovolt                                         | kV           | Electric Potential                          | 1000              | 0                 |
| millivolt                                        | mV           | Electric Potential                          | 0.001             | 0                 |
| megavolt                                         | MV           | Electric Potential                          | 1000000           | 0                 |
| volt                                             | V            | Electric Potential                          | 1                 | 0                 |
| joule                                            | J            | Energy                                      | 1                 | 0                 |
| gigawatt hour                                    | GWh          | Energy                                      | 3.60E+12          | 0                 |
| megawatt hour                                    | MWh          | Energy                                      | 3600000000        | 0                 |
| watt hour                                        | Wh           | Energy                                      | 3600              | 0                 |
| British thermal unit                             | Btu          | Energy                                      | 1055.055853       | 0                 |
| calorie                                          | cal          | Energy                                      | 4.1868            | 0                 |
| gigajoule                                        | GJ           | Energy                                      | 1000000000        | 0                 |
| kilojoule                                        | kJ           | Energy                                      | 1000              | 0                 |
| kilowatt hour                                    | kWh          | Energy                                      | 3600000           | 0                 |
| megajoule                                        | MJ           | Energy                                      | 1000000           | 0                 |
| watt second                                      | Ws           | Energy                                      | 1                 | 0                 |
| kilocalorie                                      | kcal         | Energy                                      | 4186.8            | 0                 |
| million calorie                                  | MMcal        | Energy                                      | 4186800           | 0                 |
| million British thermal unit                     | MM Btu       | Energy                                      | 1055055853        | 0                 |
| acre foot                                        | acre ft      | Volume                                      | 1233.481838       | 0                 |
| million imperial gallon                          | Imp Mgal     | Volume                                      | 4546.09           | 0                 |
| thousand imperial gallon                         | Imp kgal     | Volume                                      | 4.54609           | 0                 |
| barrel                                           | bbl          | Volume                                      | 0.158987295       | 0                 |
| Imperial gallon                                  | Imp gal      | Volume                                      | 0.00454609        | 0                 |
| million US gallon                                | US Mgal      | Volume                                      | 3785.411784       | 0                 |
| thousand US gallon                               | US kgal      | Volume                                      | 3.785411784       | 0                 |
| cubic centimeter                                 | cm3          | Volume                                      | 1.00E-06          | 0                 |
| cubic foot                                       | ft3          | Volume                                      | 0.028316847       | 0                 |
| kiloliter                                        | kL           | Volume                                      | 1                 | 0                 |
| liter                                            | L            | Volume                                      | 0.001             | 0                 |
| megaliter                                        | M L          | Volume                                      | 1000              | 0                 |
| milliliter                                       | mL           | Volume                                      | 1.00E-06          | 0                 |
| thousand cubic meter                             | k m3         | Volume                                      | 1000              | 0                 |
| US gallon                                        | US gal       | Volume                                      | 0.003785412       | 0                 |
| million barrel                                   | MMbbl        | Volume                                      | 158987.2949       | 0                 |
| thousand barrel                                  | kbbl         | Volume                                      | 158.9872949       | 0                 |
| cubic meter                                      | m3           | Volume                                      | 1                 | 0                 |
| kilogram per cubic meter                         | kg/m3        | Density                                     | 1                 | 0                 |
| gram per liter                                   | g/L          | Density                                     | 1                 | 0                 |
| kilogram per liter                               | kg/L         | Density                                     | 1000              | 0                 |
| pound per barrel                                 | lb/bbl       | Density                                     | 2.853010174       | 0                 |
| pound per cubic foot                             | lb/ft3       | Density                                     | 16.01846337       | 0                 |
| pound per US gallon                              | lb/US gal    | Density                                     | 119.8264273       | 0                 |
| tonne per cubic meter                            | t/m3         | Density                                     | 1000              | 0                 |
| radian                                           | rad          | Plane Angle                                 | 1                 | 0                 |
| degree                                           | °            | Plane Angle                                 | 0.017453293       | 0                 |
| revolution                                       | r            | Plane Angle                                 | 6.283185307       | 0                 |
| pascal second                                    | Pa*s         | Dynamic Viscosity                           | 1                 | 0                 |
| poise                                            | P            | Dynamic Viscosity                           | 0.1               | 0                 |
| delta degree Fahrenheit                          | delta °F     | Temperature (Delta)                         | 0.555555556       | 0                 |
| delta degree Rankine                             | delta °R     | Temperature (Delta)                         | 0.555555556       | 0                 |
| delta kelvin                                     | delta K      | Temperature (Delta)                         | 1                 | 0                 |
| delta degree Celsius                             | delta °C     | Temperature (Delta)                         | 1                 | 0                 |

# SdsUomQuantity API
The REST APIs provide programmatic access to read and write SDS data. The APIs in this section interact with SdsUomQuantitys. When working in .NET, convenient SDS client libraries methods are available. The ``ISdsMetadataService`` interface, accessed using the ``SdsService.GetMetadataService( )`` helper, defines the available functions. See [Units of Measure](#units-of-measure) for general [SdsUomQuantity](#sdsuomquantity) information.
***
## `Get Quantities`

Returns a list of all quantities available within a given namespace.

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities?skip={skip}&count={count}
 ```
##### Parameters
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`int skip`  
An optional parameter representing the zero-based offset of the first SdsUomQuantity to retrieve. If not specified, a default value of 0 is used.

`int count`  
An optional parameter representing the maximum number of SdsUomQuantity to retrieve. If not specified, a default value of 100 is used.

#### Response   
The response includes a status code and a response body.

##### Response body   
A list of SdsUomQuantity objects

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Id": "Angular Velocity",
        "Name": "Angular Velocity",
        "BaseUom": {
            "Id": "radian per second",
            "Abbreviation": "rad/s",
            "Name": "radian per second",
            "DisplayName": "radian per second",
            "QuantityId": "Angular Velocity",
            "ConversionFactor": 1
        },
        "Dimensions": [
            0,
            0,
            -1,
            0,
            0,
            0,
            0
        ]
    },
    {
        "Id": "Area",
        "Name": "Area",
        "BaseUom": {
            "Id": "square meter",
            "Abbreviation": "m2",
            "Name": "square meter",
            "DisplayName": "square meter",
            "QuantityId": "Area",
            "ConversionFactor": 1
        },
        "Dimensions": [
            2,
            0,
            0,
            0,
            0,
            0,
            0
        ]
    },
    ...
]
```
#### .NET client libraries method
```csharp
    Task<IEnumerable<SdsUomQuantity>> GetQuantitiesAsync(int skip = 0, int count = 100);
```
***

## `Get Quantity`
Returns the quantity corresponding to the specified quantityId within a given namespace.

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}
```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier

#### Response
The response includes a status code and a response body.

##### Response body
The requested SdsUomQuantity.

##### Example response body when `quantityId = "Length"` is passed
```json
HTTP/1.1 200
Content-Type: application/json

{
    "Id": "Length",
    "Name": "Length",
    "BaseUom": {
        "Id": "meter",
        "Abbreviation": "m",
        "Name": "meter",
        "DisplayName": "meter",
        "QuantityId": "Length",
        "ConversionFactor": 1
    },
    "Dimensions": [
        1,
        0,
        0,
        0,
        0,
        0,
        0
    ]
}
```

#### .NET client libraries method
```csharp
   Task<SdsUomQuantity> GetQuantityAsync(string quantityId);
```

***



## `Get Quantity UOMs`

Returns the list of units of measure that belongs to the quantity with the specified quantityId.

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units
 ```
##### Parameters
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier

#### Response  
The response includes a status code and a response body.

##### Response body  
A collection of SdsUom objects for the specified quantity

##### Example response body when `quantityId = "Electric Current"` is passed
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Id": "milliampere",
        "Abbreviation": "mA",
        "Name": "milliampere",
        "DisplayName": "milliampere",
        "QuantityId": "Electric Current",
        "ConversionFactor": 0.001
    },
    {
        "Id": "ampere",
        "Abbreviation": "A",
        "Name": "ampere",
        "DisplayName": "ampere",
        "QuantityId": "Electric Current",
        "ConversionFactor": 1
    }
]
```

#### .NET client libraries method
```csharp
   Task<IEnumerable<SdsUom>> GetQuantityUomsAsync(string quantityId);
```
***
## `Get Quantity UOM`

Returns the unit of measure associated with the specified uomId belonging to the quantity with the specified quantityId.

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}
 ```
##### Parameters
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier

`string uomId`  
The unit of measure identifier

#### Response 
The response includes a status code and a response body.

##### Response body
The requested SdsUom

##### Example response body when `quantityId = "Length"` and `uomId ="mile"` are passed
```json
HTTP/1.1 200
Content-Type: application/json

{
    "Id": "mile",
    "Abbreviation": "mi",
    "Name": "mile",
    "DisplayName": "mile",
    "QuantityId": "Length",
    "ConversionFactor": 1609.344
}
```
#### .NET client libraries method
```csharp
   Task<SdsUom> GetQuantityUomAsync(string quantityId, string uomId);
```
***

## `Get Quantities Access Control List`

Gets the default ACL for the Quantities collection. For more information on ACLs, see [Role-based access control](xref:accessControl).

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Quantities
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

### Response  
The response includes a status code and a response body.

| Status Code | Response Type | Description |
|--|--|--|
| 200 OK | `AccessControlList` | See [Access Control](xref:accessControl) |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### Response body  
The default ACL for Quantities

#### Response headers

Successful (200 OK) responses include an additional response header.

| Header | Description |
|--|--|
| ETag | An entity tag, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified. |

#### .NET client libraries method
```csharp
   Task<AccessControlList> GetQuantitiesAccessControlListAsync();
   Task<SdsETagResult<AccessControlList>> GetQuantitiesAccessControlListWithETagAsync();
```

***
## `Update Quantities Access Control List`

Updates the default ACL for the Quantities collection. For more information on ACLs, see [Role-based access control](xref:accessControl).

#### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Quantities
 ```

##### Parameters
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

##### Request body
Serialized ACL

#### Response
The response includes a status code.

#### .NET client libraries method
```csharp
   Task UpdateQuantitiesAccessControlListAsync(AccessControlList quantitiesAcl);
```

***********************

## `Patch Quantities Access Control List`

Updates the default ACL for the Quantities collection  using an [RFC 6902](https://tools.ietf.org/html/rfc6902) compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List. For more information on ACLs, see [Role-based access control](xref:accessControl).

#### Request
 ```text
    PATCH api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Quantities
 ```

##### Parameters
`string tenantId`  
The tenant identifier  
  
`string namespaceId`  
The namespace identifier  

#### Request body 
An [RFC 6902](https://tools.ietf.org/html/rfc6902) JSON Patch document that will be applied to the ACL.

The example below inserts a new **Access Control Entry** into the **Access Control List** giving **Read** and **Write** access to the role with the Id `11111111-1111-1111-1111-111111111111`. The remainder of the existing ACL remains unmodified.
```json
[
    {
        "op": "add",
        "path": "/RoleTrusteeAccessControlEntries",
        "value": {
            "Trustee": {
                "Type": 3,
                "ObjectId": "11111111-1111-1111-1111-111111111111"
            },
            "AccessType": 0,
            "AccessRights": 3
        }
    }
]
```

#### Request headers

The **If-Match** header can be used to prevent modification of an ACL since it was last read using the `ETag` header from the response.

| Header | Description |
|--|--|
| If-Match | The entity tag header from a previous read of the ACL. If provided, the ACL will not be patched unless the current `ETag` of the ACL, on the server, matches the value passed into the `If-Match` header. |

### Response  
The response includes a status code.

| Status Code | Response Type | Description |
|--|--|--|
| 204 No Content || The ACL was successfully patched. |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 412 Precondition Failed | error | The `If-Match` header did not match `ETag` on the ACL, or a `test` operation in the JSON Patch document failed to evaluate to `true`.
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### .NET client libraries method
```csharp
   Task PatchQuantitiesAccessControlListAsync(JsonPatchDocument<AccessControlList> quantitiesAclPatch);
   Task PatchQuantitiesAccessControlListWithETagAsync(string etag, JsonPatchDocument<AccessControlList> quantitiesAclPatch);
```

***

## `Get Quantity Access Control List`

Gets the ACL of the specified quantity. For more information on ACLs, see [Role-based access control](xref:accessControl).

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/AccessControl
 ```

##### Parameters
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

### Response  
The response includes a status code and a response body.

| Status Code | Response Type | Description |
|--|--|--|
| 200 OK | `AccessControlList` | See [Access Control](xref:accessControl) |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### Response body  
The ACL for the specified quantity.

#### Response headers

Successful (200 OK) responses include an additional response header.

| Header | Description |
|--|--|
| ETag | An entity tag, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified. |

#### .NET client libraries method
```csharp
   Task<AccessControlList> GetQuantityAccessControlListAsync(string quantityId);
   Task<SdsETagResult<AccessControlList>> GetQuantityAccessControlListWithETagAsync(string quantityId);
```

***********************

## `Update Quantity Access Control List`

Updates the ACL of the specified quantity. For more information on ACLs, see [Role-based access control](xref:accessControl).

#### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/AccessControl
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

##### Request body
Serialized ACL

#### Response 
The response includes a status code.

#### .NET client libraries method
```csharp
   Task UpdateQuantityAccessControlListAsync(string quantityId, AccessControlList quantityAcl);
```

***

## `Patch Quantity Access Control List`

Updates the ACL of the specified quantity using an [RFC 6902](https://tools.ietf.org/html/rfc6902) compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List. For more information on ACLs, see [Role-based access control](xref:accessControl).

#### Request
 ```text
    PATCH api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/AccessControl
 ```

##### Parameters

`string tenantId`  
The tenant identifier  
  
`string namespaceId`  
The namespace identifier  
  
`string quantityId`  
The quantity identifier  

#### Request body 
An [RFC 6902](https://tools.ietf.org/html/rfc6902) JSON Patch document that will be applied to the ACL.

The example below inserts a new **Access Control Entry** into the **Access Control List** giving **Read** and **Write** access to the role with the Id `11111111-1111-1111-1111-111111111111`. The remainder of the existing ACL remains unmodified.
```json
[
    {
        "op": "add",
        "path": "/RoleTrusteeAccessControlEntries",
        "value": {
            "Trustee": {
                "Type": 3,
                "ObjectId": "11111111-1111-1111-1111-111111111111"
            },
            "AccessType": 0,
            "AccessRights": 3
        }
    }
]
```

#### Request headers

The **If-Match** header can be used to prevent modification of an ACL since it was last read using the `ETag` header from the response.

| Header | Description |
|--|--|
| If-Match | The entity tag header from a previous read of the ACL. If provided, the ACL will not be patched unless the current `ETag` of the ACL, on the server, matches the value passed into the `If-Match` header. |

### Response  
The response includes a status code.

| Status Code | Response Type | Description |
|--|--|--|
| 204 No Content || The ACL was successfully patched. |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 412 Precondition Failed | error | The `If-Match` header did not match `ETag` on the ACL, or a `test` operation in the JSON Patch document failed to evaluate to `true`.
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### .NET client libraries method
```csharp
   Task PatchQuantityAccessControlListAsync(string quantityId, JsonPatchDocument<AccessControlList> quantityAclPatch);
   Task PatchQuantityAccessControlListWithETagAsync(string quantityId, string etag, JsonPatchDocument<AccessControlList> quantityAclPatch);
```

***********************

## `Get Quantity Owner`

Gets the Owner of the specified quantity. For more information on Owners, see [Role-based access control](xref:accessControl).

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Owner
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

#### Response 
The response includes a status code and a response body.

##### Response body  
The Owner for the specified quantity

#### .NET client libraries method
```csharp
   Task<Trustee> GetQuantityOwnerAsync(string quantityId);
```
***********************

## `Update Quantity Owner`

Updates the Owner of the specified quantity. For more information on Owners, see [Role-based access control](xref:accessControl).

#### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Owner
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

##### Request body  
Serialized Owner

#### Response  
The response includes a status code.

#### .NET client libraries method
```csharp
   Task UpdateQuantityOwnerAsync(string quantityId, Trustee quantityOwner);
```
***

## `Get Quantity Access Rights`

Gets the Access Rights associated with the specified quantity for the requesting identity.  For 
more information on Access Rights, see [Role-based access control](xref:accessControl#commonaccessrightsenum).

#### Request
 ```text
    GET api/v1//Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/AccessRights
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

#### Response    
The response includes a status code and a response body.

##### Response body 
The Access Rights of the specified quantity for the requesting identity.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

["Read", "Write"]
```

#### .NET client libraries method
```csharp
   Task<string[]> GetQuantityAccessRightsAsync(string quantityId);
```
***********************

# SdsUom API
The REST APIs provide programmatic access to read and write SDS data. The APIs in this section interact with SdsUoms. When working in .NET, convenient SDS Client Libraries are available. The ``ISdsMetadataService`` interface, accessed using the ``SdsService.GetMetadataService( )`` helper, defines the available functions. See [Units of Measure](#units-of-measure) for general [SdsUom](#sdsuom) information.

***

## ``Get UOMs``

Returns a list of all available units of measure in the system.

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Units?skip={skip}&count={count}
 ```
##### Parameters
``string tenantId``  
The tenant identifier  

``string namespaceId``  
The namespace identifier  

``int skip``  
An optional parameter representing the zero-based offset of the first SdsUomQuantity to retrieve. If not specified, a default value of 0 is used.

``int count``  
An optional parameter representing the maximum number of SdsUomQuantity to retrieve. If not specified, a default value of 100 is used.

#### Response  
The response includes a status code and a response body.

##### Response body    
A list of SdsUom objects

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json
[
    {
        "Id": "count",
        "Abbreviation": "count",
        "Name": "count",
        "DisplayName": "count",
        "QuantityId": "Quantity",
        "ConversionFactor": 1
    },
    {
        "Id": "Ampere hour",
        "Abbreviation": "Ah",
        "Name": "Ampere hour",
        "DisplayName": "Ampere hour",
        "QuantityId": "Electric Charge",
        "ConversionFactor": 3600
    },
    {
        "Id": "coulomb",
        "Abbreviation": "C",
        "Name": "coulomb",
        "DisplayName": "coulomb",
        "QuantityId": "Electric Charge",
        "ConversionFactor": 1
    }
    ...
]
```
#### .NET client libraries method
```csharp
   Task<IEnumerable<SdsUom>> GetUomsAsync(int skip = 0, int count = 100);
```
***
## ``Get Uom``

Returns the unit of measure corresponding to the specified uomId within a given namespace.

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Units/{uomId}
 ```
##### Parameters
`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string uomId`  
The unit of measure identifier

#### Response   
The response includes a status code and a response body.

##### Response body   
The requested SdsUom

##### Example response body when `uomId = "ounce"` is passed
```json
HTTP/1.1 200
Content-Type: application/json

{
    "Id": "ounce",
    "Abbreviation": "oz",
    "Name": "ounce",
    "DisplayName": "ounce",
    "QuantityId": "Mass",
    "ConversionFactor": 0.028349523
}
```
#### .NET client libraries method
```csharp
   Task<SdsUom> GetUomAsync(string uomId);
```
***

## `Get UOM Access Control List`

Gets the ACL of the specified unit of measure. For more information on ACLs, see [Access Control](xref:accessControl).

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/AccessControl
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

`string uomId`  
The unit of measure identifier

### Response  
The response includes a status code and a response body.

| Status Code | Response Type | Description |
|--|--|--|
| 200 OK | `AccessControlList` | See [Access Control](xref:accessControl) |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### Response body  
The ACL for the specified UOM.

#### Response headers

Successful (200 OK) responses include an additional response header.

| Header | Description |
|--|--|
| ETag | An entity tag, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified. |

#### .NET client libraries method
```csharp
   Task<AccessControlList> GetQuantityUomAccessControlListAsync(string quantityId, string uomId);
   Task<SdsETagResult<AccessControlList>> GetQuantityUomAccessControlListWithETagAsync(string quantityId, string uomId);
```

***********************

## `Update UOM Access Control List`

Updates the ACL of the specified unit of measure. For more information on ACLs, see [Access Control](xref:accessControl).

#### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{UOMId}/AccessControl
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

`string uomId`  
The unit of measure identifier

##### Request body  
Serialized ACL

#### Response   
The response includes a status code.

#### .NET client libraries method
```csharp
   Task UpdateQuantityUomAccessControlListAsync(string quantityId, string UOMId, AccessControlList uomAcl);
```
***
## `Patch UOM Access Control List`

Updates the ACL of the specified unit of measure using an [RFC 6902](https://tools.ietf.org/html/rfc6902) compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List. For more information on ACLs, see [Access Control](xref:accessControl).

#### Request
 ```text
    PATCH api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/AccessControl
 ```

##### Parameters

`string tenantId`  
The tenant identifier  
  
`string namespaceId`  
The namespace identifier  
  
`string quantityId`  
The quantity identifier  

`string uomId`  
The unit of measure identifier

#### Request body 
An [RFC 6902](https://tools.ietf.org/html/rfc6902) JSON Patch document that will be applied to the ACL.

The example below inserts a new **Access Control Entry** into the **Access Control List** giving **Read** and **Write** access to the role with the Id `11111111-1111-1111-1111-111111111111`. The remainder of the existing ACL remains unmodified.
```json
[
    {
        "op": "add",
        "path": "/RoleTrusteeAccessControlEntries",
        "value": {
            "Trustee": {
                "Type": 3,
                "ObjectId": "11111111-1111-1111-1111-111111111111"
            },
            "AccessType": 0,
            "AccessRights": 3
        }
    }
]
```

#### Request headers

The **If-Match** header can be used to prevent modification of an ACL since it was last read using the `ETag` header from the response.

| Header | Description |
|--|--|
| If-Match | The entity tag header from a previous read of the ACL. If provided, the ACL will not be patched unless the current `ETag` of the ACL, on the server, matches the value passed into the `If-Match` header. |

### Response  
The response includes a status code.

| Status Code | Response Type | Description |
|--|--|--|
| 204 No Content || The ACL was successfully patched. |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The resource does not exist |
| 412 Precondition Failed | error | The `If-Match` header did not match `ETag` on the ACL, or a `test` operation in the JSON Patch document failed to evaluate to `true`.
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### .NET client libraries method
```csharp
   Task PatchQuantityUomAccessControlListAsync(string quantityId, string uomId, JsonPatchDocument<AccessControlList> uomAclPatch);
   Task PatchQuantityUomAccessControlListWithETagAsync(string quantityId, string uomId, string etag, JsonPatchDocument<AccessControlList> uomAclPatch);
```

***********************

## `Get UOM Owner`

Gets the Owner of the specified unit of measure. For more information on Owners, see [Access Control](xref:accessControl).

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/Owner
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

`string uomId`  
The unit of measure identifier

#### Response   
The response includes a status code and a response body.

##### Response Body  
The Owner for the specified Uom 

#### .NET client libraries method
```csharp
   Task<Trustee> GetQuantityUomOwnerAsync(string quantityId, string uomId);
```
***********************

## `Update UOM Owner`

Updates the Owner of the specified unit of measure. For more information on Owners, see [Access Control](xref:accessControl).

#### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/Owner
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

`string uomId`  
The unit of measure identifier

##### Request body 
Serialized Owner

#### Response    
The response includes a status code.

#### .NET client libraries method
```csharp
   Task UpdateQuantityUomOwnerAsync(string quantityId, string uomId, Trustee uomOwner);
```
***

## `Get UOM Access Rights`

Gets the Access Rights associated with the specified unit of measure for the requesting identity. For 
more information on Access Rights, see [Access Control](xref:accessControl#commonaccessrightsenum).

#### Request
 ```text
    GET api/v1//Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/AccessRights
 ```

##### Parameters

`string tenantId`  
The tenant identifier  

`string namespaceId`  
The namespace identifier  

`string quantityId`  
The quantity identifier  

`string uomId`  
The unit of measure identifier

#### Response  
The response includes a status code and a response body.

##### Response Body  
The Access Rights of the specified unit of measure for the requesting identity.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

["Read", "Write"]
```

#### .NET client libraries method
```csharp
   Task<string[]> GetQuantityUomAccessRightsAsync(string quantityId, string uomId);
```
***********************


## Associating a unit of measure with a type
At [type](xref:sdsTypes) creation, SdsUom can be associated with an [SdsTypeProperty](xref:sdsTypes#sdstypeproperty). 

## Associating a unit of measure with a stream
At [stream](xref:sdsStreams) creation, you can override any unit of measure associated with an SdsTypeProperty belonging to the type of the stream. This enables the reuse of a type that may have default unit information associated with it already.
