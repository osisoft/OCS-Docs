---
uid: WhatIsSDS
---

# What is the Sequential Data Store?

The Sequential Data Store (SDS) is a streaming database optimized for storing sequential data, typically time series data. The SDS can store any data that is indexed by an ordered sequence, usually a timestamp.

Typically, developers use the SDS as part of their customized applications. The SDS allows developers to store, retrieve, and analyze any type of streaming data. Data is written programmatically into the SDS using REST APIs.

For each namespace, OCS creates an instance of the SDS with its own dedicated services and data storage. Services and storage must be scoped to a particular region such as WestUS or West Europe. For regulatory reasons, services and storage cannot span regions.

Using _types_, you can shape the data stored in the SDS. Data shaping is the process of choosing and organizing the data you want to use for analytics and decision making. Types allow you to define what data is stored and to make that data extensible. See [What are types?](xref:WhatAreTypes) to learn more.

For each type, you can store a _stream_, which is a series of events with each event being an instance of the type. You can create and write data to streams using a REST API. See <link to streams> to learn more.
