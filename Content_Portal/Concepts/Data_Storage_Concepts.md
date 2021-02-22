---
uid: DataStorageConcepts
---

# Introduction to data storage


## Introduction to Sequential Data Store

Sequential Data Store (SDS) is a streaming database optimized for storing sequential data, typically time-series data.
It can store any data that is indexed by an ordered sequence. For each namespace that is created, an SDS instance or SDS resources, is created.
The services and storage are scoped to a particular region. Data is written into the SDS using REST APIs. 

## Types define your data
Types define the data stored by OCS, comparable to types (classes) in programming languages or a table definition in a database.

Types contain a list of named properties which specifies their type and optional unit of measure. 
Each property may be of a primitive type, another type, or an array of types.
A property may be designated as an index to the sequential data.

The term "stream type" is used when additional context is needed. Within the API itself, this type is frequently referred to as `SdsType`.

## Streams contain your sequential data
Streams are containers for sequential data of some **type**.
Streams are either a collection of ordered events stored in SDS or a series of events (instances of the defined type) indexed by one or more properties.
Streams are defined to organize incoming data from a device into OSIsoft Cloud Services (OCS).
Metadata is a key-value pair that allows you to add context to your data.
Tags are string values that can be used to group streams by category.
Streams are scoped within a namespace. 


## Introduction to stream views
Different persona in the customer's organization may be interested in different data contained in the stream.
A process engineer and maintenance person rely on different data in the stream to do their job.
Types are immutable, that is, once created, you cannot alter the data captured by them.
However, stream views provide greater flexibility and allow different persona to view only the subset of the stream they are interested in.
Stream views are a custom view or logical overlay over your stream data. 
They allow you to scope down the data that is viewed, to change non-intuitive labels to more user-friendly names, and create arbitrary mappings of data within a stream. Stream views can be used to expose stream data as a different type.

