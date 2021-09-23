---
uid: sdsFilterExpressions
---

# Filter expressions for SDS values
Filter expressions can be applied to read operations such as [List Values](xref:sds-stream-data#list-values) and [List Summaries](xref:sds-stream-data#list-summaries) that return Sequential Data Store (SDS) values.


## SdsTypeCodes
The table below lists supported and unsupported types within a filter expression:
| Supports  | Does not support        |
|------------|------------------------|
|``Boolean``    |   ``Array``       |
| ``Byte``    |     ``IEnumerable``       |
| ``Char``    |              ``IDictionary``     |
| ``DateTime``  |             ``IList``         |
|``DateTimeOffset``  |          |
| ``Decimal``   |         |
|  ``Double``| ``Nullable Types`` |
| ``Guid`` |                              |
| ``Int16``  |                             |
| ``Int32``   |                                |
| ``Int64``  |                             |
|  ``Sbyte`` |                                |
| ``String``   |                                 |
| ``Timespan`` |                                |
| ``UInt16``  |                                 |
| ``UInt32``   |                                 |
| ``UInt64``  |                                       |
The following types are supported for use within a filter expression:

## Logical operators
The following logical operators are supported for use within a filter
expression:

| Operator   | Description                                             |
|------------|-----------------------------------------------------|
| ``eq``     | Equal to                                            |
| ``ne``     | Not equal                                           |
| ``ge``     | Greater than or equal to                            |
| ``le``     | Less than or equal to                               |
| ``lt``     | Less than                                           |
| ``gt``     | Greater than                                        |
| ``( )``    | Parenthesis can be used to affect the order of the operation |
| ``or``     | Or logical operator                                 |
| ``and``    | And logical operator                                |
| ``not``    | Not logical operator                                |
| ``-``      | Negation                                            |

> [!NOTE]
> You use logical operators on ordered properties.
> When filtering on an ordered property, performance improves significantly if the property is a [secondary index](xref:sdsIndexes#secondary-indexes).   

### Examples of logical operators
The examples below assume that the SdsType event includes a field named ``Value`` of type *double*: 
- ``Value eq 1.0``
- ``Value ne 15.6``
- ``Value ge 5.0``
- ``Value le 8.0``
- ``Value gt 5.0``
- ``Value lt 4.0``
- ``Value gt 2.0 and Value lt 9.0``
- ``Value gt 6.0 or Value lt 2.0``
- ``not (Value eq 1.0)``

## Math functions
The following math functions are supported for use within a filter
expression:

| Function  | Description                 |
|-----------|-------------------------|
| ``add``   | Addition                |
| ``sub``   | Subtraction             |
| ``mul``   | Multiplication          |
| ``div``   | Division                |
| ``mod``   | Modulo                  |
| ``round`` | Rounds to the nearest numeric component without a decimal, with the midpoint rounded away from 0. For example, 0.5 rounds to 1; -0.5 rounds to -1) |
| ``floor`` | Rounds down to the nearest numeric component without a decimal |
|``ceiling``| Rounds up to the nearest numeric component without a decimal |

### Examples of math functions
The examples below assume that the SdsType event includes a field named ``Value`` of type *double*: 
- ``Value eq (6.0 add 3.0)``
- ``Value eq (6.0 sub 3.0)``
- ``Value eq (6.0 mul 3.0)``
- ``Value eq (6.0 div 3.0)``
- ``Value eq (7.0 mod 3.0)``
- ``round(Value) eq 16``
- ``floor(Value) eq 15``
- ``ceiling(Value) eq 16``

## String functions
String operations are case sensitive. The character index in a string is
zero-based. The following string functions are supported for use within a
filter expression:
| Function       | Description                                                         |
|----------------|-----------------------------------------------------------------|
| ``endswith``   | Compare the character at the end of the input string            |
| ``startswith`` | Compare the character at the start of the input string          |
| ``length``     | Examines the string length                                      |
| ``indexof``    | Examines the character starting at a given index                |
| ``substring``  | Examine characters within another string at a specific location |
| ``contains``	 | Search for characters anywhere in another string                |
| ``tolower``    | Convert characters to lowercase                                 |
| ``toupper``    | Convert characters to uppercase                                 |
| ``trim``       | Remove whitespace from front and end of a string                |
| ``concat``     | Concatenate strings together                                    |
| ``replace``    | Replace one set of characters with another                      |

### Examples of string functions
The examples below assume that the SdsType event includes a field named ``sValue`` of type *string*: 
|Example                                      |Result                                                           |
|---------------------------------------------|-----------------------------------------------------------------|
|``endswith(sValue, 'XYZ')``                  |True if ``sValue`` ends with the characters ‘XYZ’                |
|``startswith(sValue, 'Val'``                 |True if ``sValue`` starts with the characters ‘Val’              |
|``length(sValue) eq 11``                     |True if ``sValue`` is 11 characters                              |
|``indexof(sValue, 'ab') eq 4``               |True if the 5th and 6th characters are ‘ab’                      |
|``contains(sValue, 'ab')``                   |True if characters ‘ab’ are found anywhere in ``sValue``         |
|``substring(sValue, 10) eq 'a b'``           |True if ‘a b’ is found in ``sValue`` at index 10                 |
|``tolower(sValue) eq 'val5'``                |Change ``sValue`` to lowercase and compare to ‘val5’             |
|``toupper(sValue) eq 'ABC'``                 |Change ``sValue`` to uppercase and compare to ‘ABC’              |
|``trim(sValue) eq 'vall22'``                 |Trim whitespace from front and end of ``sValue`` and compare to ‘val22’|
|``concat(sValue,'xyz') eq 'dataValue_7xyz'`` |Add characters to ``sValue`` and compare to ‘dataValue_7xyz’     |
|``replace(sValue,'L','D') eq 'Dog1'``        |Replace any ‘L’ in ``sValue`` with ‘D’ and compare to ‘Dog1’     |

## DateTime functions
The following DateTime functions are supported for use within a filter
expression:
| Function   | Description                          |
|------------|----------------------------------|
| ``year``   | Get year value from DateTime     |
| ``month``  | Get month value from DateTime    |
| ``day``    | Get day value from DateTime      |
| ``hour``   | Get hour value from DateTime     |
| ``minute`` | Get minute value from DateTime   |
| ``second`` | Get second value from DateTime   |

### Examples of DateTime functions
The examples below assume that the SdsType event includes a field named
``TimeId`` of type *DateTime*:
-  ``year(TimeId) eq 2015``
-  ``month(TimeId) eq 11``
-  ``day(TimeId) eq 3``
-  ``hour(TimeId) eq 1``
-  ``minute(TimeId) eq 5``
-  ``second(TimeId) eq 3``

## TimeSpan functions
The following TimeSpan functions are supported for use within a filter
expression:
| Function   | Description                          |
|------------|----------------------------------|
| ``years``  | Get year value from TimeSpan     |
| ``days``   | Get day value from TimeSpan      |
| ``hours``  | Get hour value from TimeSpan     |
| ``minutes``| Get minute value from TimeSpan   |
| ``seconds``| Get second value from TimeSpan   |

### Examples of TimeSpan functions
The examples below assume that the SdsType event includes a field named
``TimeSpanValue`` of type *TimeSpan*:
-  ``years(TimeSpanValue) eq 1``
-  ``days(TimeSpanValue) eq 22``
-  ``hours(TimeSpanValue) eq 1``
-  ``minutes(TimeSpanValue) eq 1``
-  ``seconds(TimeSpanValue) eq 2``
