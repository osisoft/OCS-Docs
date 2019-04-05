---
uid: IndexConfig
---

 
 # IndexConfig
The IndexConfig defines the index information for retrieving data, and lets the user specify start and end times with an interval time, and the data retrieval mode. Currently, only interpolation mode is supported. The index config can be defined or left null in the data view definition. If left null, it will be generated at the time of data retrieval with a start index of 24 hours ago and end index as the current time, using interval of 1 and interpolation mode. If configured in the data view definition, the config can always be overwritten when using the data APIs by indicating the parameters in the call. The start and end indices are to follow the ISO 8601 date and time format, and the interval should comply with the .Net TimeSpan struct.
### Properties

Property | Type | Requried | Descriptions
 --- | --- | --- | ---
StartIndex | string | True | The start index of data retrieval in ISO 8601 format
EndIndex | string | True | The end index of data retrieval in ISO 8601 format
Mode | string | True | The data retrieval mode
Interval | string | True | The data retrieval interval

## `Example` 
The following example shows an index config set for data to be indexed between the start and end index, and give interpolated data using an interval of 5 minutes.
```json
{
  "StartIndex": "2018-01-01T00:00:00Z",
  "EndIndex": "2018-01-02T00:00:00Z",
  "Mode": "Interpolated",
  "Interval": "00:05:00"
}
``` 
