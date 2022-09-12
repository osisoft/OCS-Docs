---
uid: omfEditor
---

# OMF editor

The Open Message Format (OMF) defines a set of message headers and message bodies. You write messages in JSON format that generate compliant messages for data ingress. The OMF specification is generic in that it does not specify a particular back-end system. You can use OMF to create types, create streams, and populate streams with data. There are three message formats you can use to accomplish these tasks: type messages, container messages, and data messages. 

Use the OMF Editor to build and validate OMF messages to send to the Sequential Data Store.

To build a message using the OMF Editor:

1. Select **Developer Tools** > **OMF Editor** from the left pane. 

1. Choose the message type from the **OMF Type** selector: **Type**, **Container** or **Data**.

1. Select the OMF version from the **OMF Version** selector.

1. Edit your message and use the following options:

   - Select **Copy OMF** to copy the message content to the clipboard. 

   - Select **More Options** ![More Options](../../_icons/default/dots-vertical.svg "More Options") > **Format OMF** to reset template content alignment after making changes. 

   - Select **More Options** ![More Options](../../_icons/default/dots-vertical.svg "More Options") > **Download OMF** to download the message content to your local drive. 

   - Select **More Options** ![More Options](../../_icons/default/dots-vertical.svg "More Options") > **Reset Template** to delete any changes you have made to the message content. 

   As you edit a message, the editor indicates whether it is valid in the upper right and displays any errors in the `Errors` pane.
