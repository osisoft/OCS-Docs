---
uid: AccountServiceBlog
---

# Service Blog

API's for reading entries posted on the Service Blog.

***

## `Get Service Blog Entries`

Returns blog entries ordered by time posted.

### Http

`GET api/v1/ServiceBlog/Entries`

### Parameters

```csharp
[Optional]
[Default = "0"]
[FromQuery]
int32 skip
```

Number of blogs to skip for paging purposes.
```csharp
[Optional]
[Default = "100"]
[FromQuery]
int32 count
```

Number of blogs to count after skip for paging purposes.

### Security

Any identity, including anonymous, can retrieve service blog entries.

### Returns

| Status Code | Return Type | Description |
| --- | --- | ---  |
| 200 | [SdsServiceBlogEntry] | Returns a list of blog entries. |


***

## `Get Service Blog Entry`

Returns a blog entry specified by ID.

### Http

`GET api/v1/ServiceBlog/Entries/{id}`

### Parameters

```csharp
[Required]
[FromRoute]
string id
```

Identifier of the blog entry to retrieve.


### Security

Any identity, including anonymous, can retrieve service blog entries.

### Returns

| Status Code | Return Type | Description |
| --- | --- | ---  |
| 200 | SdsServiceBlogEntry | Returns the specified blog entry. |


***

