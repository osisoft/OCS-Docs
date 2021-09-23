---
uid: sds
---

# Sequential Data Store
The Sequential Data Store (SDS) is a streaming database optimized for storing sequential data, typically time-series data. It can store any data that is indexed by an ordered sequence. 
For each namespace that is created, an SDS instance or SDS resources, is created. 
The services and storage are scoped to a particular region. 
Data is written into the SDS using REST APIs. You use SDS to store, retrieve, and analyze data. 
[Types](xref:sdsTypes) define the shape of a single measured event or object. A type gives structure to your data. 
For example, if you're measuring three things (longitude, latitude, speed) from a device at the same time, then you want those three properties to be included in your type.
[Streams](xref:sdsStreams) are a collection of ordered events, or a series of events, where each event is an instance of the type you have defined. 
You create and write data to streams using a simple REST (*Representational State Transfer*) API (*Application Programming Interface*). 
The streams you create can be used to store simple or complex data types to suit your application needs. 
You can define simple or complex [indexes](xref:sdsIndexes) to arrange and relate your data. 
An assortment of methods with customizable behaviors are available to read data and easily obtain needed information.

## Samples
The best way to get started with SDS is to run one or more of the code samples. Code samples are 
provided in a number of different programming languages to illustrate how to easily and effectively 
interact with SDS. The code samples can be found in the [OSI-Samples](https://github.com/osisoft/OSI-Samples) repository on GitHub. Obtain SDS 
REST API access keys from https://cloud.osisoft.com before running the sample code.

Each sample includes a README file which describes the steps required to run the sample and a brief description 
that highlights some of the sample's functionality. Be sure to read the README file to understand 
how the sample works.

After you have finished the introduction and worked with one of the samples, refer to 
the [Quick start](xref:sdsQuickStart) section, which describes the interaction of 
various SDS objects and helps you get started with your own application.

