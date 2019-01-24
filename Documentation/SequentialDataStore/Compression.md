---
uid: sdsCompression
---

Compression
===========
To more efficiently utilize network bandwidth the OCS Sequential Data Store supports compression for [reading data](xref:sdsReadingDataApi) and
[writing data](xref:sdsWritingDataApi) through the REST API

Supported compression schemes
-----------------------------
- ``gzip``
- ``deflate``

Request compression (writing data)
----------------------------------
The body content of an HTTP request can be compressed using the [supported compression schemes](#supported-compression-schemes) allowing you to send stream values to the REST API more efficiently.

The ``Content-Encoding`` HTTP header must be used to specify the compression scheme of compressed-content requests. This header provides context to the API to properly decode the request content.

Response compression (reading data)
-----------------------------------
Compressed responses can be requested from the REST API by specifying one of the [supported compression schemes](#supported-compression-schemes) using the ``Accept-Encoding`` HTTP header.

Compressed responses from the REST API will include a ``Content-Encoding`` HTTP header indicating the compression scheme used to compress the response content.

*Note that specifying a compression scheme through the use of the* ``Accept-Encoding`` *HTTP header does not guarantee a compressed response. Always refer to presence and value of the* ``Content-Encoding`` *HTTP header of the response to properly decode the response content.* 
