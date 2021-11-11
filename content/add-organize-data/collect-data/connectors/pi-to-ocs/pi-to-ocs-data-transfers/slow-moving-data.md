---
uid: slow-moving-data
---

## Support for slow moving data

If you have PI points that do not update often, you might want the data in OCS before it is archived on the source Data Archive. To accomplish this task, turn off compression for these PI points to ensure snapshot data is collected.  

Turn off compression only for PI points that do not update often. In general, this practice is not required for most tags and can cause unnecessary overhead and data collection.
