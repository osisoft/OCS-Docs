---
uid: sds
---

# Sequential Data Store
Test
The Sequential Data Store (SDS) is a cloud-based streaming data storage that is optimized for storing sequential data, usually time-series, but anything that is indexed by an ordered sequence. You use SDS to store, retrieve, and analyze data. An [SdsType](xref:sdsTypes) (used interchangeably with *type* throughout documentation) defines the shape of a single measured event or object. A type gives structure to your data. For example, if you're measuring three things (longitute, latitude, speed) from a device at the same time, then you want those three properties to be included in your type. An [SdsStream](xref:sdsStreams) (used interchangeably with *stream* throughout documentation) is a collection of ordered events, or a series of events, where each event is an instance of the type you have defined. You 
create and write data to streams using a simple REST (*REpresentational State Transfer*) API (*Application 
Programming Interface*). The streams you create can be used to store simple or complex data types to suit 
your application needs. You can define simple or complex [indexes](xref:sdsIndexes) to arrange and relate your data. An assortment 
of methods with customizable behaviors are available to read data and easily obtain needed information.

### Timestamps in SDS
Use the ISO 8601 representation of dates and times in SDS, `2020-02-20T08:00:00.000Z` for February 20, 2020, for example.
SDS returns timestamps in UTC if the timestamp is of property `DateTime` and in a local time zone if it is of `DateTimeOffset`.

## Samples
The best way to get started with SDS is to run one or more of the code samples. Code samples are 
provided in a number of different programming languages to illustrate how to easily and effectively 
interact with SDS. The code samples can be found in the [OSI-Samples](https://github.com/osisoft/OSI-Samples) repository on GitHub. Obtain SDS 
REST API access keys from https://cloud.osisoft.com before running the sample code.

Each sample includes a README file which describes the steps required to run the sample and a brief description 
that highlights some of the sample's functionality. Be sure to read the README file to understand 
how the sample works.

After you have finished the introduction and worked with one of the samples, refer to 
the [Quick start](xref:sdsQuickStart#quick-start) section, which describes the interaction of 
various SDS objects and helps you get started with your own application.

