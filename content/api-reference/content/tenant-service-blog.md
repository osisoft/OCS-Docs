---
uid: tenant-service-blog

---

# Service Blog
APIs for reading entries posted on the service blog.

## `List By Page`

<a id="opIdServiceBlog_List By Page"></a>

Returns blog entries ordered by time posted.

<h3>Request</h3>

```text 
GET /api/v1/ServiceBlog/Entries
?skip={skip}&count={count}&includeDeleted={includeDeleted}
```

<h4>Parameters</h4>

`[optional] integer skip`
<br/>Number of blogs to skip for paging purposes.<br/><br/>`[optional] integer count`
<br/>Number of blogs to count after skip for paging purposes.<br/><br/>`[optional] boolean includeDeleted`
<br/>Whether deleted entries are included in return.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ServiceBlogEntry](#schemaserviceblogentry)[]|An array of `ServiceBlogEntry` objects.|
|400|None|Could not return the service blog entry due to missing or invalid input.|
|422|None|Could not retrieve the specified `ServiceBlogEntry`s due to an inappropriate request (should not specify includeDeleted).|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "Id": 2147483586,
    "TimePosted": "2021-11-22T15:54:34.477Z",
    "Title": "Blog Entry for Example 1",
    "Content": "This entry is here to show the example.",
    "Author": "Joe Developer"
  },
  {
    "Id": 2147483587,
    "TimePosted": "2021-09-15T20:48:36.293Z",
    "Title": "Blog Entry for Example 2",
    "Content": "This entry is here to show another example.",
    "Author": "Joe Developer"
  }
]
```

---

## `Get Entry By Id`

<a id="opIdServiceBlog_Get Entry By Id"></a>

Returns a blog entry specified by identifier.

<h3>Request</h3>

```text 
GET /api/v1/ServiceBlog/Entries/{id}
```

<h4>Parameters</h4>

`string id`
<br/>Used to identify which blog entry to return.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ServiceBlogEntry](#schemaserviceblogentry)|The `ServiceBlogEntry` with Id `id`.|
|400|None|Could not return the service blog entry due to missing or invalid input.|
|403|None|Forbidden.|
|404|None|`ServiceBlogEntry` not found.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": 2147483587,
  "TimePosted": "2021-09-15T20:48:36.293Z",
  "Title": "Blog Entry for Example",
  "Content": "This entry is here to show another example.",
  "Author": "Joe Developer"
}
```

---
## Definitions

### ServiceBlogEntry

<a id="schemaserviceblogentry"></a>
<a id="schema_ServiceBlogEntry"></a>
<a id="tocSserviceblogentry"></a>
<a id="tocsserviceblogentry"></a>

Representation of a server-side database interpretation of a blog.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|IsDeleted|boolean|false|false|Gets or sets a value indicating whether this instance is deleted.|
|Id|int32|false|false|Gets or sets the identifier.|
|TimePosted|date-time|false|false|Gets or sets the time posted.|
|Title|string|false|true|Gets or sets the title.|
|Content|string|false|true|Gets or sets the content.|
|Author|string|false|true|Gets or sets the author.|

```json
{
  "IsDeleted": true,
  "Id": 0,
  "TimePosted": "2019-08-24T14:15:22Z",
  "Title": "string",
  "Content": "string",
  "Author": "string"
}

```

---

