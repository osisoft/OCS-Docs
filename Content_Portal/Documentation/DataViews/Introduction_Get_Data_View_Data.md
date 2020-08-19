---
uid: DataViewsIntroductionGetData
---

# Introduction - Get Data View Data

Getting data from a data view is straightforward. If you want to understand more about the source behind each data field, that information is available too.

This is an introduction to the recommended workflow for getting data. The [Quick Start - Get Data View Data](xref:DataViewsQuickStartGetData) shows these concepts in action. For detailed information, see [Getting Data](xref:DataViewsGettingData) and [Data API](xref:DataViewsDataAPI).

## Specify first page parameters
Complete the following to specify first page parameters:

1. Specify the index range (start index and end index) and granularity of data to be retrieved (interval).
2. Specify the desired response format as csv, table-style json, or object-style json. The default is object-style json.  Csv and table-style json are available with or without a header row.
3. Specify the page size.

## Request any remaining pages
Complete the following if data spans into additional page(s). The current page response will include an HTTP `Link` header with a hyperlink to the next page of data.
1. Follow the hyperlinks to retrieve the full requested dataset page by page, if the current page includes a next hyperlink in the `Link` header.
2. Follow the first page hyperlink in the `Link` header in the event that it is necessary to restart the paging operation from the first page.

## [Optional] Investigate the source of the data
For precise information about the source of each field's data, see the data view's resolved field mappings.
