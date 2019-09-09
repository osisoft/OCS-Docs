---
uid: DataOutputFormats
---

# Data Output Formats

Data View Data can be viewed in the following formats: [default](#default), [table](#table) and [csv](#csv). Table and csv also have the option of including headers. Provide the output format using the form parameter in Data call parameter list.

## <a name="default">`Default Format` </a>

The following is a request to retrieve Data using the default output
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataView/Simple/Data/Interpolated
 ```
      Content-Type: application/json

    [
        {
            "Time": "2018-01-01T00:00:00Z",
            "Temperature": 24,
            "Flowrate": 44,
            "Volume": 245
        },
        {
            "Time": "2018-01-01T00:00:01Z",
            "Temperature": 24,
            "Flowrate": 44,
            "Volume": 245
        },
        {
            "Time": "2018-01-01T00:00:02Z",
            "Temperature": 24,
            "Flowrate": 44,
            "Volume": 245
        }
    ]

## <a name="table">`Table Output Format` </a>


The following is a request to retrieve Data in a Table format without headers
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataView/Simple/Data/Interpolated
      /form=table
 ```
The following response would be returned from the above code:

      Content-Type: application/json

      {
         "Columns": [
            {
                "Name": "Time",
                "Type": "Object"
            },
            {
                "Name": "Temperature",
                "Type": "Object"
            },
            {
                "Name": "Flowrate",
                "Type": "Object"
            },
            {
                "Name": "Volume",
                "Type": "Object"
            }
        ],
        "Rows": [
        [
            "2018-01-01T00:00:00Z",
            24,
            44,
            245
        ],
        [
            "2018-01-01T00:00:01Z",
            24,
            44,
            245
        ],
        [
            "2018-01-01T00:00:02Z",
            24,
            44,
            245
        ]
      }

The following is a request to retrieve Data in a Table format with headers
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataView/Simple/Data?Interpolated
      /form=tableh
 ```
The following response would be returned from the above code:

      Content-Type: application/json

      {
        "Columns": [
            {
                "Name": "Time",
                "Type": "Object"
            },
            {
                "Name": "Temperature",
                "Type": "Object"
            },
            {
                "Name": "Flowrate",
                "Type": "Object"
            },
            {
                "Name": "Volume",
                "Type": "Object"
            }
        ],
        "Rows": [
            [
                "Time",
                "Temperature",
                "Flowrate",
                "Volume"
            ],
            [
                "2018-01-01T00:00:00Z",
                24,
                44,
                245
            ],
            [
                "2018-01-01T00:00:01Z",
                24,
                44,
                245
            ],
            [
                "2018-01-01T00:00:02Z",
                24,
                44,
                245
            ]
    ]
}

## <a name="csv">`CSV Output Format` </a>

The following is a request to retrieve Data in a csv format without headers
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataView/Simple/Data?Interpolated
      ?form=csv
```
The following response would be returned from the above code:

      Content-Type: text/csv

      2018-01-01T00:00:00Z,24,44,245
      2018-01-01T00:00:01Z,24,44,245
      2018-01-01T00:00:02Z,24,44,245

The following is a request to retrieve Data in a csv format with headers (csvh)
 ```text
      GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataView/Simple/Data?Interpolated
      ?form=csvh
```
The following response would be returned from the above code:

      Content-Type: text/csv

      Time,Temperature,Flowrate,Volume
      2018-01-01T00:00:00Z,24,44,245
      2018-01-01T00:00:01Z,24,44,245
      2018-01-01T00:00:02Z,24,44,245