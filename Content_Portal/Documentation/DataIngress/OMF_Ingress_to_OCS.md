---
uid: omfIngressToOCS
---

# Data Ingress to Cloud Services using OMF

You can use OSIsoft Message Format ([OMF](http://omf-docs.osisoft.com/)) to achieve high-throughput asynchronous data ingress into the Sequential Data Store. The following terms are useful for understanding the information in this and subsequent sections:

* A producer of OMF messages needs a *Client* identity to authenticate and send messages.
* Messages are sent to a queue called a *Topic*. 
* A *Subscription* receives messages from a *Topic* and writes them to the Sequential Data Store.
