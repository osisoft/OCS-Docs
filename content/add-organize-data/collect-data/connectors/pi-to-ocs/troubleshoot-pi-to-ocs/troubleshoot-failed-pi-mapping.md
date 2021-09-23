---
uid: troubleshoot-failed-mapping
---

# Troubleshoot a failed PI mapping

If you encounter an error message and the PI to OCS Configuration Utility crashes after an attempt to create or edit a PI mapping, follow these steps to troubleshoot and correct the issue:

1. Take one of the following steps:
 
    a) Reinstall the PI to OCS Agent with a service account that has access to the configured Data Archive.

    b) Add a different Data Archive that the service account has permission to access.

1. Relaunch the PI to OCS Configuration Utility: Click the Windows start button, then **OSIsoft** > **PI to OCS Configuration Utility**.
1. Succesfully connect and authenticate to OCS.
1. In the PI to OCS Configuration utility, click the pencil icon to the right of the **PI Mapping** field.
1. Follow the steps in [Create a PI mapping section](#pi-to-ocs-utility) to add a PI mapping.
1. After adding the PI mapping, save your changes. 
