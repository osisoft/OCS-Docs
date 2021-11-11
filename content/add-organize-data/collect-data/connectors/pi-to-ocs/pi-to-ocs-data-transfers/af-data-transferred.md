---
uid: af-data-transferred
---

# What AF data is transferred to OCS?

You can transfer the following AF element data into OCS:

* Simple PI point attributes
* Static attribute values

A simple PI point attribute consists of only a server and tag name. This data does not include any data retrieval qualifiers. The associated event data contains simple PI point attributes with the same historical and streaming transfer mechanism as points not associated with AF. 

This table lists what AF objects can and cannot be included in a PI to OCS data transfer.

| AF Object                                                    | Included in a PI to OCS transfer?      |
| ------------------------------------------------------------ | -------------------------------------- |
| Elements                                                     | Yes                                    |
| Attributes                                                   | Yes                                    |
| PI point references                                          | Yes                                    |
| Constant values/string                                       | Yes                                    |
| Excluded attributes                                          | Yes                                    |
| Hidden attributes                                            | No                                     |
| Custom unit of measurements (UOMs)                           | No                                     |
| Formulas                                                     | No                                     |
| Event frames                                                 | No                                     |
| PI point arrays                                              | No                                     |
| Implicit PI points with multiple attributes on an AF element | Only one attribute will be transferred |
| Implicit PI points with attributes that reference other attributes | No                               |
| Attributes that reference a non-registered data source/PI Data Archive | No                 |

## Performance metrics: AF data transfer

The average data transfer rate is approximately 120-150 assets per second, and 1,000 assets per minute. Streams are created first, followed by AF element and asset data. If you use the same stream for various elements, the transfer time may be shorter.

**Note:** There may be some variance to these numbers.
