---
uid: AccountServiceBlog
---

# Service Blog

APIs for CRUD operations on the Service Blog.

***

## `GetByPage()`

Returns blog entries ordered by time posted.

### Http

`GET api/ServiceBlog/Entries`

### Parameters

```csharp
[Required]
string skip
```

Number of blogs to skip for paging purposes.
```csharp
[Required]
string count
```

Number of blogs to count after skip for paging purposes.

### Security

Any identity, including anonymous, can retrieve service blog entries.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | ([QiServiceBlogEntry], int32) | Returns an response object including a list of blog entries and an int with the total number of entries. | 


***
