---
uid: known-issues
---

# PI to OCS known issues

The following are known issues in PI to OCS:

1. If there is no default PI Server associated and listed for your AF server, you will not be able to transfer data to OCS.
2. PI to OCS Configuration Utility: Detected Data Archives fail to load if the user doesn't have permissions to one or more of the referenced Data Archives. The workaround is to add the Data Archive by clicking the green plus icon in the utility and then manually type the name of the Data Archive.
3. Query search results that contain a very large number of PI points (> 1 million) will generate an exception error and not be processed.  