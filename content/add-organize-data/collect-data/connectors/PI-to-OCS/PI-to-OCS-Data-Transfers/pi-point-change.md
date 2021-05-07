---
uid: pi-point-change
---

# Point type change

When the source PI Data Archive tag changes point type, PI to OCS Services will detect this change and present the transfer status as “PI Point Type Change Detected”.
The user must manually decide what to do with the destination SDS stream as well as data that has already been transferred.  The SDS stream in question will appear in the log files. The PI to OCS service cannot make an informed decision of why this point change occurred for the following reasons:

* The source tag had an incorrect configuration of data and type. The data and tag must be deleted and recreated.
* The source tag was misconfigured initially. The tag changed from a Float32 to a Float64. The data is still relevant and should be kept.
* Other reasons

Once an SDS stream is created, its underlying SdsType cannot change. As a result, new data from the tag that is assigned a different type cannot be stored in the same stream and the user must decide what to do with the existing SDS stream and data. Correctional actions would be:

* If you care about the data, and also care about having streaming data for that particular tag, create a new SDS stream and copy the data to that new stream. Once you have done this, delete the SDS stream in question and restart the transfer.
* If you care about the data, but do not care about streaming data for that particular tag, create a new transfer without the tag in question and start the transfer. 
* If you do not care about the streaming data that was previously transferred, delete the SDS stream in question and restart the transfer. The transfer will resume streaming data.

To see what types of point coercions are supported in PI Data Archive, please refer to the Live Library topic [Allowable point type coercions](https://livelibrary.osisoft.com/LiveLibrary/content/en/server-v14/GUID-FA9A99C2-0E4A-4BCE-90E7-18D45EF15EF6).
