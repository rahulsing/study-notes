# Amazon SNS Message Attributes

## Introduction

Message attributes in Amazon Simple Notification Service (SNS) provide a powerful mechanism to add metadata to your messages. These attributes can be used for various purposes such as filtering, routing, and adding contextual information to messages. Understanding and effectively using message attributes can significantly enhance the functionality and efficiency of your messaging system.

## What are Message Attributes?

Message attributes are key-value pairs that you can add to an SNS message. They provide additional context or metadata about the message content. Unlike the message body, which contains the primary content, attributes offer supplementary information that can be used for processing decisions.

### Purpose of Message Attributes

1. **Filtering**: Subscribers can filter messages based on attribute values.
2. **Routing**: Messages can be routed to different endpoints based on attribute values.
3. **Metadata**: Attributes can store additional information that is not part of the message body.

## Types of Message Attributes

There are three types of message attributes in SNS:

1. **System Attributes**: These are predefined attributes that SNS uses internally. Examples include `AWS.SNS.MOBILE.APNS.TOKEN` for Apple Push Notification Service tokens.
2. **Custom Attributes**: These are user-defined attributes that you can create to suit your specific needs. For example, you might use a custom attribute to indicate the priority level of a message.
3. **Reserved Attributes**: These are attributes that are reserved for future use by AWS and should not be used by users.

## Examples of Using Message Attributes

### Filtering Messages

You can use message attributes to filter messages in a subscription. For example, if you have a topic for order notifications, you can add an attribute `orderType` with values like `new`, `updated`, or `cancelled`. Subscribers can then filter messages to receive only the types of orders they are interested in.

### Routing Messages

Message attributes can also be used for routing messages to different endpoints. For instance, you might have an attribute `region` with values like `us-east-1`, `eu-west-1`, etc. You can then route messages to specific endpoints based on the region attribute.

### Adding Metadata

Attributes can be used to add metadata to messages. For example, you might add an attribute `timestamp` to record when the message was sent, or an attribute `senderId` to identify the source of the message.

## Best Practices for Managing Message Attributes

1. **Use Descriptive Names**: Choose attribute names that clearly describe their purpose.
2. **Limit the Number of Attributes**: While SNS allows up to 10 attributes per message, using too many can make messages cumbersome to manage.
3. **Document Attributes**: Maintain documentation for all custom attributes to ensure consistency and understanding across your team.
4. **Use Attributes for Filtering and Routing**: Leverage attributes to filter and route messages effectively.
5. **Monitor Attribute Usage**: Regularly review the use of attributes to ensure they are serving their intended purpose.

## Limits and Constraints

- **Number of Attributes**: Each message can have up to 10 attributes.
- **Attribute Name Length**: Attribute names can be up to 256 characters long.
- **Attribute Value Size**: The total size of all attribute names and values cannot exceed 256 KB.
- **Data Types**: Attribute values can be strings, numbers, or binary data.

## Conclusion

Message attributes in Amazon SNS offer a versatile way to add metadata to your messages, enabling advanced filtering, routing, and contextual information. By understanding the different types of attributes and following best practices, you can enhance the functionality and efficiency of your messaging system.