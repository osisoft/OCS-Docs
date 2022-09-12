---
uid: viewProfile
---

# View and edit your user profile

The `My Profile` window displays your user information and assigned roles.
Depending on the identity provider your organization uses, you may be able to update your contact information.

## Update contact information

To update your contact information:

1. To open your user profile, select the **User Profile** icon ![User Profile icon](../../_icons/custom/account-circle.svg) and select your name.

1. Select **Edit**.

    **Note:** The **Edit** button is disabled if your organization's identity provider does not allow you to update your contact information.

1. Update your contact information.

1. Select **Save**.

## Show user-friendly property names

The **Show user friendly property names** option controls the appearance of property names for streams that originate through PI to OCS agents on the `Trend` and `Asset Explorer` pages. When this option is turned on, those stream property names mimic PI tag naming and certain stream properties are hidden. For example, say you have the following streams and properties:

 - SL-Tank01|Pressure|Value

 - SL-Tank01|Pressure|SystemStateCode

 - SL-Tank01|Temperature|Value
 
 - SL-Tank01|Temperature|SystemStateCode

With this option turned on, you would see the following on the `Trend` and `Asset Explorer` pages:

 - SL-Tank01|Pressure

 - SL-Tank01|Temperature

The properties that contain values are easier to find and the properties that contain system information are hidden. This setting is specific to your login.

To change your user preferences:

1. To open your user profile, select the **User profile** icon ![User Profile icon](../../_icons/custom/account-circle.svg) and select your name.

1. To use friendly property names, turn on the the **Show user friendly property names** toggle under **User Preferences**. The setting saves automatically.
