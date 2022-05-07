---
uid: regional-endpoints-ocs
---

# Regional endpoints

A regional endpoint is the URL host address referenced by API requests. The region represents the cluster where resources and data are stored. 

The following table lists the current OCS region labels and corresponding endpoints.

| OCS region labels | OCS regional endpoints |
| ------------- | ----------------- |
| US-West (westus) | https://dat-b.osisoft.com/ |
| EU-West (westeurope) | https://dat-d.osisoft.com/ | 

**Note:** US-West is the primary region. If a region other than the primary region has been selected, calls may still be made to the US-West region.

## Endpoint usage guidelines

Reference the regional endpoint in GET, POST, PUT, PATCH, and DELETE requests. To retrieve a region's host URL for an object that belongs to a namespace, such as a stream, use the `Self` property within the context of the namespace.

In general, most API routes allow these actions:
 
* GET

* PATCH

* POST

* PUT

* DELETE

## List of objects and actions (US-West region only)

This following table lists the actions you can use on OCS objects in the US-West (primary) region. 

| OCS Object |   GET |   POST |  PUT | PATCH |   DELETE |
| ------ | ------ | ------ | ------ | ------ | ------ |
| Automation Identities |    | ✔ | ✔ |  ✔ | ✔ |
|Blogs| ✔|  **N/A**|    **N/A**|    **N/A**|    **N/A**|
|Clients (all types)    |   |✔| ✔|  ✔|  ✔|
|Identity Providers   |   |✔| ✔|  ✔|  ✔|
|Invitations | | ✔ | ✔ | ✔ | ✔ |
|Namespace ACL  |   |✔  |✔| ✔|  ✔|
|Namespace Owner |  | ✔ | ✔ | ✔ | ✔ |
|Namespaces    |   |✔| ✔|  ✔|  ✔|
|Persisted Grants| | **N/A** | **N/A** | **N/A** | ✔ |
|Roles  | | ✔ | ✔ | ✔ | ✔ |
|Root Access Control |  | **N/A** | ✔ | ✔ | **N/A** |
|Secrets (all types) |  | ✔ | ✔| ✔ | ✔ |
|Users |    | ✔ | ✔| ✔ | ✔ |
