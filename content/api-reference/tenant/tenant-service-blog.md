---
uid: tenant-service-blog

---

# Service Blog
APIs for reading entries posted on the service blog.

## `List By Page`

<a id="opIdServiceBlog_List By Page"></a>

Returns blog entries ordered by time posted.

### Request
```text 
GET /api/v1/ServiceBlog/Entries
?skip={skip}&count={count}&includeDeleted={includeDeleted}
```

#### Parameters

`[optional] integer skip`
<br/>Number of blogs to skip for paging purposes.<br/><br/>`[optional] integer count`
<br/>Number of blogs to count after skip for paging purposes.<br/><br/>`[optional] boolean includeDeleted`
<br/>Whether deleted entries are included in return.<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ServiceBlogEntry](#schemaserviceblogentry)[]|An array of `ServiceBlogEntry` objects.|

#### Example response body
> 200 Response ([ServiceBlogEntry](#schemaserviceblogentry)[])

```json
[
  {
    "IsDeleted": true,
    "Id": 0,
    "TimePosted": "2019-08-24T14:15:22Z",
    "Title": "string",
    "Content": "string",
    "Author": "string"
  }
]
```

---

## `Get Entry By Id`

<a id="opIdServiceBlog_Get Entry By Id"></a>

Returns a blog entry specified by identifier.

### Request
```text 
GET /api/v1/ServiceBlog/Entries/{id}
```

#### Parameters

`string id`
<br/>Service blog identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ServiceBlogEntry](#schemaserviceblogentry)|The `ServiceBlogEntry` with Id `id`.|

#### Example response body
> 200 Response ([ServiceBlogEntry](#schemaserviceblogentry))

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
## Definitions

### ServiceBlogEntry

<a id="schemaserviceblogentry"></a>
<a id="schema_ServiceBlogEntry"></a>
<a id="tocSserviceblogentry"></a>
<a id="tocsserviceblogentry"></a>

Representation of a server-side database interpretation of a blog.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|IsDeleted|boolean|false|false|Value indicating whether boolean flag that represents the blog entry's soft delete status.|
|Id|int32|false|false|Identifier for the blog entry.|
|TimePosted|date-time|false|false|Recorded timestamp managed by the blog editor.|
|Title|string|false|true|Title of the blog entry.|
|Content|string|false|true|Content body of the blog entry. This is where the details of the blog entry are located.|
|Author|string|false|true|Author who created the blog entry.|

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

