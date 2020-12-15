---
uid: ocsStatusCodes
---

# HTTP status codes
The server issues HTTP response status codes when a client makes a request over HTTP.
In response to the requests made in OSIsoft Cloud Services, the system returns one of the codes listed in the table below.
To see what each code means in context, refer to the API documentation.   

## Status codes table
|   Status Code             |    Description                                                                    |
|--------------             |------------------------------------------                                         |
|``200 OK``                     |   The request was successful.                                                     |
|``201 Created``                |   A resource was created as a result of a successful request.                     |
|``202 Accepted``               |   The request was accepted and has been queued for processing.                    |
|``204 No content``             |   The request was successful and the server is not returning any content.         |
|``207 Multi-status``           |   The request was partially successful.                                           |
|``302 Found``                  |   The requested resource will be redirected.                                      |
|``400 Bad request``            |   Due to a client error, the server could not process the request.              |
|``401 Unauthorized``           |   Authentication has failed or has not been provided.                             |
|``403 Forbidden``              |   Unauthorized. Make sure the user has the right role to access the resource. |
|``404 Not found``              |   The server could not find the requested resource.                               |
|``405 Method not allowed``     |   The resource does not support the method in the request. For example, a ``PUT`` request on a ready-only resource will return this code.                         |
|``408 Operation timed out``    |   The server timed out while waiting for a client request.                        |
|``409 Conflict``               |   The request conflicts with the current state of the server.                     |
|``412 Precondition Failed``    |   A precondition within the header or body was not met, so the operation could not be completed.  |
|``500 Internal server error``  |   The server ran into an unexpected condition and failed to complete the request. |
|``503 Service unavailable``    |   The server cannot handle the request (due to maintenance, being overloaded, or for other reasons). As it is often a temporary state, try again later.                 |

