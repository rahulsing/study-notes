markdown
# 1.5 Service Limits and Quotas

## Overview

When working with Amazon Kinesis Data Firehose, it's important to be aware of the service limits and quotas to ensure smooth operation and avoid unexpected issues. This section outlines the key limits and quotas you should know, how to request increases, and best practices for monitoring usage.

## Default Quotas for Resources

### Delivery Streams

- **Number of Delivery Streams per Region**: The default quota is 50 delivery streams per AWS account per Region. This limit can be increased upon request.
- **Maximum Data Rate per Delivery Stream**: The default maximum data rate is 100 MB/s per delivery stream. This can be increased based on your use case.

### Record Size

- **Maximum Record Size**: The maximum size of a single record that can be sent to a delivery stream is 1 MB.

### PutRecord Rate

- **Maximum PutRecord Rate**: The default maximum rate for PutRecord operations is 1,000 records per second per delivery stream. This limit can be increased if necessary.

## Requesting Quota Increases

If your application requires higher quotas than the defaults, you can request a quota increase through the AWS Service Quotas console. Follow these steps:

1. Open the [Service Quotas console](https://console.aws.amazon.com/servicequotas/home).
2. Select Kinesis Data Firehose from the list of services.
3. Choose the quota you wish to increase.
4. Click on "Request quota increase" and fill out the required information.
5. Submit the request for review by AWS.

## Service Limits Related to Destinations

### S3 Buckets

- **Number of S3 Buckets**: There is no specific limit on the number of S3 buckets you can use as destinations, but standard S3 service limits apply.
- **Object Size**: The maximum object size for S3 is 5 TB.

### Redshift

- **Number of Redshift Clusters**: There is no specific limit on the number of Redshift clusters you can use as destinations, but standard Redshift service limits apply.
- **Copy Command**: The COPY command in Redshift has its own limitations, such as the maximum number of files that can be loaded in a single COPY command.

## Limits on Data Formats, Compression, and Transformations

### Data Formats

- Kinesis Data Firehose supports various data formats including JSON, Parquet, ORC, and more.

### Compression

- Supported compression formats include GZIP, Snappy, and ZSTD.

### Transformations

- Kinesis Data Firehose supports Lambda functions for data transformation. The Lambda function has its own execution time and memory limits.

## Monitoring Usage and Avoiding Throttling

To ensure you stay within the service limits and avoid throttling, consider the following best practices:

### CloudWatch Metrics

- Monitor Kinesis Data Firehose metrics in Amazon CloudWatch, such as `IncomingRecords`, `IncomingBytes`, `DeliveryToS3.Success`, and `DeliveryToS3.Failure`.

### Alarms

- Set up CloudWatch alarms to notify you when usage approaches the service limits.

### Throttling

- If you encounter throttling, consider scaling out by creating additional delivery streams or requesting quota increases.

By understanding and managing these limits and quotas, you can effectively utilize Kinesis Data Firehose for your data streaming needs.
