---
uid: OsiSoftMessageFormat
---

# OSIsoft Message Format

You use OSIsoft Message Format ([OMF](http://omf-docs.osisoft.com/)) to achieve high-throughput asynchronous data collection
into the Sequential Data Store. The following terms are useful for understanding the information
in this and subsequent sections. 

- A producer of OMF messages needs a *client* identity to authenticate and send messages.
- *OMF topics* aggregate OMF messages received from one or more *clients* and makes them available for consumption by a *subscription*.
- An *OMF subscription*  consumes OMF messages from a *topic* and forwards them to a data store. Multiple *subscriptions* can retrieve OMF messages from a single *topic*.
