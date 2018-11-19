---
uid: AccountServiceBlog
---

# ServiceBlog

API's for CRUD operations on the Service Blog.

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

Number of blogs to skip for paging purposes
```csharp
[Required]
string count
```

Blogs to count after skip for paging purposes


### Security

Any identity, including anonymous can retrieve blog entries.

### Returns

Returns an response object including an array of blog entries and an int with the total number of entries.

***
