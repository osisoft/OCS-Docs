---
uid: AccountServiceBlog
---

# Service Blog

API's for CRUD operations on the Service Blog.

***

## `Get Service Blog Entries`

Returns blog entries ordered by time posted.

### Http

`GET api/v1-preview/ServiceBlog/Entries`


### Parameters

```csharp
[Required]
[FromRoute]
string skip
```

Number of blogs to skip for paging purposes.
```csharp
[Required]
[FromRoute]
string count
```

Number of blogs to count after skip for paging purposes.

### Security

Any identity, including anonymous, can retrieve service blog entries.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | ([SdsServiceBlogEntry], int32) | Returns an response object including a list of blog entries and an int with the total number of entries. | 


***

