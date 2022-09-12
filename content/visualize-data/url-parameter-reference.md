---
uid: URLparameters
---

# Trend URL parameters

When you use the Share function to copy the URL for a trend, the function constructs a URL using parameters to specify the data in the trend. This URL allows you to access the same trend again and to share it with colleagues. You can construct a parameterized URL manually by adding parameters to the base URL for your OCS environment. This allows you to open an OCS trend programmatically from other applications or to create a trend populated with specified data items. 

You must have access to the data to access a trend using a parameterized URL. When you access a trend using a parameterized URL, the URL in the active browser is reset to the base URL. 

To manually create a trend URL, add query string parameters to the base URL paths by following these basic syntax rules:

- Separate query string parameters from preceding base URL with a question mark (?).

- Separate each query string parameter with an ampersand (&).

**Note:** A URL must include URL-encoded characters where needed. For example, the plus sign (+) indicates `Space` in HTML. To enter an actual plus sign as part of a URL, it must be encoded as `%2B`. For the URL syntax: `&EndTime=+8h` you need to use: `&EndTime=%2B8h`. For more information about URL encoding, see the w3schools.com article [HTML URL Encoding Reference](https://www.w3schools.com/tags/ref_urlencode.asp).

## Trend URL example

The following example trend URL includes multiple streams and cursors: 

```
https://{server}/tenant/{tenant id}/trend?origin={Sample}&trace=Tank%3B123;Temp%3B456&trace=Tank%3B234;Temp%3B789&starttime=2019-10-30T07:06:46.939Z&endtime=2019-10-30T07:06:46.939Z&mode=multiple&cursor=2019-10-30T08:06:46.939Z&cursor=2019-10-30T08:06:46.939Z
```

## Parameter reference 

The following table describes the available URL parameters.

| Parameter         | Description                                |Syntax            |
|-------------------|--------------------------------------------|------------------|
| **origin**     | Source of data that contains the stream properties. Required.  | `origin={namespace_Id}`   |
| **trace**         | The stream properties to be plotted. Consists of `streamId` and `propertyId`. The properties are separated by a semi-colon (;) and are URL encoded, which encodes the delimiter character, also a semi-colon, as `%3B`. You can add multiple stream properties.  | `trace=Tank%3B123;Temp%3B456`<br>In this example, the decoded `streamId` is `Tank;123` and the decoded `propertyId` is `Temp;456`.   | 
| **starttime**     | Start time expressed as an ISO 8601 formatted timestamp.   | `starttime=2021-09-22T07:06:46.939Z`   |
| **endtime**       | End time expressed as an ISO 8601 formatted timestamp. If either the **starttime** or **endtime** parameter is not specified, the default time range is displayed.    | `endtime=2021-09-22T15:06:46.942Z`   |
| **mode**          | Trend display mode. Valid values are `stacked`, `single`, or `multiple`. If no mode is specified, the trend is displayed in stacked mode.     | `mode=stacked`   |
| **cursor**        | Trend cursor expressed as an ISO 8601 formatted timestamp. You can add multiple cursors.  | `cursor=2021-09-22T15:06:46.940Z`   |
