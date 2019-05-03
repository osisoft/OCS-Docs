---
uid: AccountServiceBlog
---

# Service Blog

API's for retrieving service blog entries from OSIsoft Cloud Services.

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
| 200 | ([SdsServiceBlogEntry], int32) | Returns a response object including a list of blog entries and an int with the total number of entries. | 


***

## `Get Service Blog Entry`

Returns a blog entry specified by ID.

### Http

`GET api/v1-preview/ServiceBlog/Entries/{id}`


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
| 200 | SdsServiceBlogEntry | Returns a response object including the specified blog entry. | 


***

