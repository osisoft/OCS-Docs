---
uid: Introduction
---

# Introduction to Data Views

### Data views quick start guide

This page will give an overview of the data view definition and how to create data views. The intention is to get users started with the basic ways to use data views. For more in depth information about individual components, see their respective pages.

### Data sources

To illustrate the examples below, the following SdsStreams have been created and populated with test data: Arizona_Stream, California_Stream, and Pennsylvania_Stream. All streams have the same properties: FlowRate, Volume, and Temperature. For information on how to create such streams, see the [Sequential Data Store](xref:sds) documentation. 

### Simple example

The following is an example of creating a data view definition with a query to retrieve data from streams whose id contain "_Stream", like the streams defined above. Queries can also use logical operators to create complex expressions. See the [queries](xref:Queries) page for more information. 

This is the simplest form of creating a data view and uses default settings for all components. The result would include columns mapped to every property in every stream of the query.

```json
{
  "Id": "SimpleDataView",
  "Queries": [
    {
      "Id": "Query1",
      "Query": {
        "Resource": "Streams",
        "Field": "Id" ,
        "Value": "_Stream" ,
        "Operator": "Contains"
      }
    }
  ],
  "IndexDataType": "datetime"
}
```

Since such data might not be very friendly to work with, there are ways to shape the resulting data set by defining the output columns, grouping the data items, and configuring the index. The following sections provide overviews of these tasks. See their respective pages for more information.

### Defining the columns

To define the columns of the output, the Mappings object can be added. The simplest way that users can do this is by using the default mappings. See the first example below. This will create default columns mapped to all the properties of the query, which would result in a wide table. 

To explicitly define the columns and their mapping to a data source, users would create these in the Mappings object. The second example  object creates a Timestamp column to use as key, along with three columns to map certain properties of a stream. This is done using the mapping rule object of the column to define the data source by specifying the property path and an item identifier to identify its containing stream:
```json
    "Mappings": {
        "IsDefault": true
    },
```
```json
    "Mappings": {
        "Columns": [
            {
                "Name": "Timestamp",
                "MappingRule": {
                    "PropertyPaths": [
                        "Time"
                    ]
                },
                "IsKey": true,
                "DataType": "string"
            },
            {
                "Name": "Arizona flow rate",
                "MappingRule": {
                    "PropertyPaths": [
                        "FlowRate"
                    ],
                    "ItemIdentifier": {
                        "Resource": "Streams",
                        "Field": "Id",
                        "Name": null,
                        "Value": "Arizona_Stream",
                        "Operator": "Equals"
                    }
                }
            },
            {
                "Name": "Pennsylvania volume",
                "MappingRule": {
                    "PropertyPaths": [
                        "Volume"
                    ],
                    "ItemIdentifier": {
                        "Resource": "Streams",
                        "Field": "Id",
                        "Name": null,
                        "Value": "Pennsylvania_Stream",
                        "Operator": "Equals"
                    }
                }
            },
                        {
                "Name": "California temperature",
                "MappingRule": {
                    "PropertyPaths": [
                        "Temperature"
                    ],
                    "ItemIdentifier": {
                        "Resource": "Streams",
                        "Field": "Id",
                        "Name": null,
                        "Value": "California_Stream",
                        "Operator": "Equals"
                    }
                }
            }
        ]
    },
```
This mapping will create columns for the properties specified as property paths of the different streams, and display their values along with the timestamp key column, resulting in an output like the following:

```json
...
    {
        "Timestamp": "2019-03-16T17:24:30.5270905Z",
        "Arizona flow rate": 23,
        "Pennsylvania volume": 120,
        "California temperature": 9
    },
...
```

To more efficiently combine components, the mapping rule can also be linked to shared mapping rules and group rules. See the [mappings](xref:Mappings) page for more information.


### Adding grouping

Using the default configurations, the result would be returned with no grouping, which for the streams used above would look something like the following:

```json
    {
        "Time": "2018-10-03T03:00:00Z",
        "Az_Stream_Temperature": 5,
        "Az_Stream_FlowRate": 2,
        "Az_Stream_Volume": 100,
        "Cali_Stream_Temperature": 24,
        "Cali_Stream_FlowRate": 44,
        "Cali_Stream_Volume": 245,
        "Philly_Stream_Temperature": 24,
        "Philly_Stream_FlowRate": 44,
        "Philly_Stream_Volume": 245
    },
```

To illustrate the effect of grouping, applying the following group rule to the data view would yield the results shown below:
```json
    "GroupRules": [
        {
            "Id": "SimpleGroupRule",
            "Type": "StreamId"
        }
    ],
```
```json
    {
        "Time": "2018-10-03T03:00:00Z",
        "SimpleGroupRule": "Arizona_Stream",
        "Temperature": 5,
        "FlowRate": 2,
        "Volume": 100,
        "Value": ""
    },
    ...
    {
        "Time": "2018-10-03T03:00:00Z",
        "SimpleGroupRule": "California_Stream",
        "Temperature": 24,
        "FlowRate": 44,
        "Volume": 245,
        "Value": ""
    },
    ...
    {
        "Time": "2018-10-03T03:00:00Z",
        "SimpleGroupRule": "Pennsylvania_Stream",
        "Temperature": 24,
        "FlowRate": 44,
        "Volume": 245,
        "Value": ""
    },
    ...
```

As shown, the Group Rule object can organize data items into data groups within the view to generate more meaningful results and let users compare similar properties in the resulting data set. 

Group rules can be more advanced and apply to metadata and tags of Sds streams. For more information see the [group rules](xref:GroupRules) page.

### Configuring the index

Users can define the index config for data views by setting the Start and End times, a time interval, and the mode, all to be used when retrieving the data. See the [index config](xref:IndexConfig) page for information.

