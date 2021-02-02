---
uid: MetadataRulesOverview
---

# Metadata rules
Metadata, or data about data, is a collection of properties that asset instances of an asset type are expected to provide. The type and units of measure for the value can be defined. Metadata enriches sequential data in OCS and it logically segregates and contextualizes data. It supports data analysis, visualization, organization, and search capabilities.

A metadata rule is a user-defined stream name pattern in which each part is assigned a metadata type. Metadata rules capture any streams currently stored in an OCS namespace, as well as matching streams that are subsequently added to the namespace.

## The metadata rules feature
The Metadata Rules feature in the OCS Portal simplifies the process of assigning metadata to streams. The user interface guides users through the process of designating  metadata types for a stream name pattern.

## Metadata rules example
Users base metadata rules on an existing stream name in the OCS Portal. Stream name parts are “delimited,” or separated, by non-alphanumeric characters placed within the name, typically to separate meaningful sections of the name.
An example metadata rule stream name pattern follows:
```
UFL.DS1:InternalPumpLeakage
```
In the above example, a metadata rule is based on the stream name UFL.DS1:InternalPumpLeakage. A period delimits “UFL” and “DS1,” the first two parts of the stream name. A colon delimits “DS1” and “InternalPumpLeakage,” the second and third parts of the stream name.  The three parts of the stream name have the following meanings:

- UFL = facility location
- DS1 = a specific device
- InternalPumpLeakage = the data provided by the stream

Each part of the example stream name is assigned a query condition:

- UFL, the facility location, is assigned string literal, which captures only stream names exactly matching “UFL” in the first part of the stream name.
- DS1, the device identifier, is assigned wildcard, which captures streams with any value in the second part of the stream name.
- InternalPumpLeakage, the data provided by the example stream, is assigned metadata, expressed as a key-value pair.

This metadata rule identifies all stream names beginning with “UFL,” with any value for the device identifier, and creates a key-value pair for InternalPumpLeakage. This rule provides a way to quickly search for every stream containing Internal Pump Leakage data for every device in the UFL facility location.

The defined metadata is assigned to every stream that matches the stream name pattern.  When users edit a metadata rule, the modified rule may capture a different set of streams.  Users can choose whether to keep or delete metadata previously assigned by the original metadata rule.

Metadata rules enable the bulk creation and maintenance of stream metadata, which can then be used across OSIsoft Cloud Services. Other services and applications, such as OCS data views, leverage stream metadata to simplify finding data and to provide context about stream data.

## Key-value pairs
Stream name parts designated as metadata are defined as key-value pairs. Each value occupying a part designated as metadata is categorized under a key defined for it. This typically takes the form of values recorded at different timestamp intervals for a particular object or device, or key. The fundamental key-value data structure facilitates analytical processing of stream data returned by a metadata rule. 
