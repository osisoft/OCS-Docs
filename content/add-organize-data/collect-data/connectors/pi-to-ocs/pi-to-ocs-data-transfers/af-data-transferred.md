---
uid: af-data-transferred
---

# Transfer AF data

PI to Data Hub supports replication of AF elements to AVEVA™ Data Hub, the rebranded version of OCS on the AVEVA™ Connect cloud platform. Existing PI to OCS users will need to migrate to PI to Data Hub to take advantage of this new feature. Please contact your account manager to learn how to switch from OCS to AVEVA Data Hub.

You can transfer the following AF element data into AVEVA Data Hub:

* Simple PI point attributes
* Static attribute values

A simple PI point attribute consists of only a server and tag name. This data does not include any data retrieval qualifiers. The associated event data contains simple PI point attributes with the same historical and streaming transfer mechanism as points not associated with AF. 

The table below lists the AF objects that can be included in a PI to Data Hub data transfer and what those objects appear as in AVEVA Data Hub.

| AF Object                                                 | AVEVA Data Hub Object |
| --------------------------------------------------------- | --------------------- |
| Elements                                                  | Assets |
| PI point data reference attributes                        | Asset stream reference properties |
| Static ("None") data reference attributes<sup>1</sup> | Asset metadata properties |
| Excluded attributes                                       | Dependent on attribute type |

<sup>1</sup>Static AF attributes configured as type 'Boolean' are not supported and will not be transferred.

These AF objects are not included in a PI to Data Hub data transfer:

* Analysis data reference attributes

* Attributes that reference a non-registered data source/PI Data Archive

* AF categories

* AF enumeration sets

* AF models/layers/connections/ports

* AF tables

* Custom units of measure (UOMs)

* Event frames 

* Extended properties and annotations on assets not supporting AF versioning

* Formula data reference attributes 

* Hidden attributes

* Implicit PI points with attributes that reference other attributes

* Implicit PI points with multiple attributes on an AF element (only one attribute will be transferred)

* PI point arrays

* Table lookup attributes

* Weakly referenced elements, composition elements, and element templates

## Performance metrics: AF data transfer

The average data transfer rate is approximately 120-150 assets per second, and 1,000 assets per minute. Streams are created first, followed by AF element and asset data. If you use the same stream for various elements, the transfer time may be shorter.

**Note:** There may be some variance to these numbers.
