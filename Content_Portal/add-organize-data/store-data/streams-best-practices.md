---
uid: bpStreams
---
# Streams best practices

<!-- David Moler: Id/name should be used to identify stream easily (pattern is still good). If user is creating, they should put the metadata in metadata, not expect rules to do it. We can add that as an aside. -->

OSIsoft recommends the following best practices when you create streams:

- Ensure that the default stream permissions are configured before you begin creating streams. <!--I suggest the rest is in an indented paragraph, under the bullet -->While you can later do a bulk update of stream permissions, it is easier to configure the default permissions before streams are created. Permissions that vary from the default, must be configured on the individual streams. 

- Use a meaningful pattern when naming your streams. <!--I suggest the rest is in an indented paragraph, under the bullet -->For example, a naming pattern might be "QuickStart.{Region}.{Site}.{Equipment}". This pattern enables OCS tools, such as metadata rules, to use this naming schema to find relevant data. Metadata such as this could also be stored as key-value pairs on the stream, but a well-defined naming pattern allows metadata to be generated automatically. However, if you create streams manually, OSIsoft recommends that you add the metadata directly rather than using rules.

  <!-- I removed the following  and added a note in step 5 below telling them to leave it blank. --> <!-- 3. Use the stream name to provide a more readable name for the string than the stream ID itself. -->

- Use the stream description field, metadata, and tags to capture any other relevant information about the stream. <!--Not essential, since this bullet has sub bullets, but if possible, I suggest the following paragraph is in an indented paragraph, under the bullet -->This information is useful for searching for specific streams in the system, especially as systems become large. If possible, use consistent patterns in the description, metadata, and tags.
   - <!--These 3 following are sub-bullets, right? -->Use metadata for information that follows a specific or consistent pattern, such as the location, manufacturer, and site. 
   - Use tags for simple information about the stream that does not adhere to any particular pattern.
   - Use the description field for longer descriptions of the stream and what it represents.

## Reading large volumes of data from streams by using API calls
<!--Laureen and I had a long discussion about whether the following content should be in a Best Practice topic or in a Developer Guide. I favor it being in this best practice topic, as it has recommendations. Unless you think only serious developers would ever be interested in it?? Here, I feel it could be useful for "other" users to see that there are things they can do with the API that might be really useful, and therefore worth taking on the API-->
<!--If the content stays here, I believe we need a title that clearly sections it off for what it is, so stray users don't spend unnecessary time on it - so I made a suggestion for the title, it might need rewording -->
For large volumes of data, you can use API methods to handle the data fast and efficiently, as described here. 

### Maximum limit for events in read data calls 

OSIsoft limits API calls that read data to retrieve less than 250,000 events, per request.
OCS returns error message 400, shown below, when that limit is reached.  
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

Increase the Request-Timeout in the header to 5 minutes for large-range calls that request 250,000 events in a read call. 
The gateway sends ``408 - Operation timed out error`` if the request requires more than 30 seconds. 

The range of values that are held in memory can be large (potentially between 1 GB and 2GB) so the system needs sufficinet time to read and return the data.

If multiple calls return ``408 - Operation timed out error`` even after you have increased the timeout limit to 5 minutes, take one of the following steps: 

- Reduce the range in the request calls 
- Retry with an exponential back-off policy

 

### Compression 

Include ``Accept-Encoding: gzip, deflate`` in the HTTP header. 
This enables compression. For more information, see [Compression](xref:sdsCompression#supported-compression-schemes). 

 
### Different read data APIs available
Depending on the scenario, there are different read data APIs available.
They return an overview of the values instead of reading all values at once.
These APIs provide a useful high-level view of the values without displaying them all at the same time: 
- [Get Values](xref:sdsReadingDataApi#get-values) with filters
- [Get Summaries](xref:sdsReadingDataApi#get-summaries) 
- [Get Sampled Values](xref:sdsReadingDataApi#get-sampled-values) 

 


