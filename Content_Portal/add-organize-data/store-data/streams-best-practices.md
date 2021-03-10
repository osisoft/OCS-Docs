---
uid: bpStreams
---
# Streams best practices

<!-- David Moler: Id/name should be used to identify stream easily (pattern is still good). If user is creating, they should put the metadata in metadata, not expect rules to do it. We can add that as an aside. -->

OSIsoft recommends the following are best practices when creating streams:

- Ensure that the default stream permissions are configured before you begin creating streams. While you can later do a bulk update of stream permissions, it is easier to configure the default permissions before the streams are created. Permissions that vary from the default are configured on the individual streams. 

- OSIsoft recommends you use a meaningful pattern when naming your streams. For example, a naming pattern might be "QuickStart.{Region}.{Site}.{Equipment}". This makes it possible for OCS tools, such as metadata rules, to use this naming schema to find relevant data. Metadata like this can also be stored as key-value pairs on the stream, but a well-defined naming pattern allows metadata to be generated automatically. 

  <!-- I removed the following  and added a note in step 5 below telling them to leave it blank. --> <!-- 3. Use the stream name to provide a more readable name for the string than the stream ID itself. -->

- Use the stream description field, metadata, and tags to capture any other relevant information about the stream. This information is useful for searching for specific streams in the system, especially as systems become large. If possible, use consistent patterns in description, metadata, and tags.
   - Use metadata for information that follows a specific or consistent pattern, such as the location, manufacturer, and site. 
   - Use tags for simple information about the stream that doesn't adhere to any particular pattern.
   - Use the description field for longer descriptions of the stream and what it represents.

## Reading data from streams
While SDS is a robust data storage, it performs best if you follow certain guidelines: 

### Maximum limit for events in read data calls 

OSIsoft limits read data API to retrieve less than 250,000 events per request.
OCS returns an error message when the maximum limit is reached.  
This maximum limit applies to [Get Values](xref:sdsReadingDataApi#get-values), [Get Summaries](xref:sdsReadingDataApi#get-summaries), [Get Sampled Values](xref:sdsReadingDataApi#get-sampled-values).
 

```text
400 bad request error

{ 

               “Error”: “The request is not valid.”, 

               “Reason”: “Exceeded the maximum return count of 250000 events.” 

               “Resolution”: “Reduce query size and resubmit the request.” 

} 
```

### Increase the Request-Timeout in the header 

Increase the Request-Timeout in the header to 5 minutes for large range calls that are requesting 250,000 events in a read call. 
The gateway will send ``408 - Operation timed out error`` if the request needs more than 30 seconds. 

The range of values that are held in memory can be large and be anywhere between 1 GB and 2GB, so the system needs enough time to read and return the data.

If multiple calls return ``408 - Operation timed out error`` even after increasing the timeout limit to 5 minutes, do one of the following: 

- Reduce the range in the request calls of this type 
- Retry with an exponential back-off policy

 

### Compression 

Include ``Accept-Encoding: gzip, deflate`` in the HTTP header. 
This enables compression. For more information, see [Compression](xref:sdsCompression#supported-compression-schemes). 

 
### Different read data APIs available
Depending on the scenario, there are different read data APIs available.
They return an overview of the values instead of reading all values at once.
These APIs provide a good high-level view of the values without displaying them all at the same time: 
- [Get Values](xref:sdsReadingDataApi#get-values) with filters
- [Get Summaries](xref:sdsReadingDataApi#get-summaries) 
- [Get Sampled Values](xref:sdsReadingDataApi#get-sampled-values) 

 


