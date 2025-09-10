# Setting Up and Configuring MWAA

This guide provides a step-by-step process for setting up and configuring an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account.
- AWS CLI installed and configured with appropriate permissions.
- Basic understanding of Apache Airflow and its components.
- Necessary IAM roles and policies for MWAA.

## Creating an MWAA Environment

1. **Navigate to the MWAA Console:**
   - Open the [AWS Management Console](https://aws.amazon.com/console/).
   - Search for and select **MWAA**.

2. **Create Environment:**
   - Click on **Create environment**.
   - Enter a name for your environment.

3. **Configure Environment:**
   - **Dag code in S3:** Provide the S3 bucket and prefix where your DAGs are stored.
   - **Python version:** Choose the Python version compatible with your DAGs.
   - **Web server access:** Choose between **Public** or **Private** access.
   - **Execution role:** Select or create an IAM role with necessary permissions.

4. **Review and Create:**
   - Review your settings.
   - Click **Create environment**.

## Configuration Options

MWAA offers several configuration options to tailor the environment to your needs.

### Airflow Configuration Options

You can customize Airflow settings using a JSON file. Common settings include:

json
{
  "core": {
    "dags_are_paused_at_creation": true
  },
  "scheduler": {
    "dag_dir_list_interval": 300
  }
}
```

Upload this JSON file to an S3 bucket and reference it in the MWAA environment settings.

### Environment Class

Choose the appropriate environment class based on your workload:

- `mw1.small`
- `mw1.medium`
- `mw1.large`

## Network and Security Settings

### VPC and Subnets

- **VPC:** Select the VPC where your MWAA environment will reside.
- **Subnets:** Choose at least two subnets in different availability zones for high availability.
- **Security groups:** Assign security groups to control inbound and outbound traffic.

### Private vs. Public

- **Public:** The Airflow web server is accessible over the internet.
- **Private:** The Airflow web server is only accessible within your VPC. Use AWS PrivateLink to access it securely.

## Environment Variables

You can pass environment variables to your MWAA environment to configure Airflow behavior or provide secrets.

1. **Create a file** with environment variables:
   
   ```plaintext
   AIRFLOW__CORE__LOAD_EXAMPLES=False
   MY_SECRET_KEY=supersecretvalue
   

2. **Upload the file** to an S3 bucket.
3. **Reference the file** in your MWAA environment settings under **Environment variables**.

## Scaling Configuration

MWAA automatically scales the workers based on the queued tasks. However, you can configure the minimum and maximum workers.

- **Minimum workers:** The minimum number of workers to keep running.
- **Maximum workers:** The maximum number of workers that can be scaled up.

Set these values in the MWAA environment settings under **Worker type** and **Autoscaling**.

---

By following these steps, you can successfully set up and configure an MWAA environment tailored to your specific needs.