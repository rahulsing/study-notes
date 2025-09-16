# Part 1, Learnig : DBT Tutorial and Steps for Athena 

## Learning DBT

For a comprehensive tutorial on DBT concepts, setup, and best practices, see:
📖 **[Complete DBT Tutorial Guide](dbt-tutorial-guide.md)**

This guide covers:
- DBT fundamentals and core concepts
- Project structure and best practices
- Advanced features and patterns
- Testing and documentation
- Deployment and CI/CD
- Monitoring and troubleshooting

## Athena Integration

For detailed information on using DBT with Amazon Athena, including real-world use cases and implementation examples, see:
🚀 **[DBT with Athena - Demo Implementation Guide](dbt-athena-demo-implementation.md)**

This guide covers:
- Athena-specific configurations
- Advanced features (Iceberg tables, partitioning)
- Real-world use cases (e-commerce, marketing attribution, IoT)
- Performance optimization
- Troubleshooting common issues

---

# Part 2, Demo: TPC-DS Customer Address Demo

This is the **simplest possible DBT implementation** designed to demonstrate a few key DBT capabilities with Amazon Athena. It uses publicly available TPC-DS customer address data to showcase:

- **External table creation** from S3 data
- **Staging models** (views) for data cleaning
- **Mart models** (tables) for analytics
- **DBT documentation** generation
- **Basic testing** and data quality checks

Perfect for getting started with DBT and Athena without complex setup requirements.

## Quick Start

### 1. Create Virtual Environment
```bash
# Create and activate virtual environment
cd .\my-setup\  
python -m venv dbt-env
dbt-env\Scripts\activate

# Install DBT with Athena adapter
pip install dbt-core dbt-athena-community
```

### 2. (Optional) Setup AWS & S3 Bucket 
```bash
# Create S3 bucket for Athena results
aws s3 mb s3://your-athena-results-bucket-unique-name

# Ensure AWS credentials are configured
aws configure
```

### 3. Configure DBT (Local)
- Update profiles.yml (Line 6) with your S3 Bucket.

```bash
mkdir .dbt
copy profiles.yml .dbt\profiles.yml
export DBT_PROFILES_DIR="$PWD/.dbt"
# Update S3 bucket and region in .dbt/profiles.yml
```

(Optional) Only for Powershell on Windows: 
```powershell
$env:DBT_PROFILES_DIR = "$PWD\.dbt"
```

### 4. Run DBT Models
```bash
cd dbt-project

# Test connection
dbt debug

# Run all models
dbt run --log-level debug

# Generate documentation
dbt docs generate

# Serve docs on localhost:8080
dbt docs serve
```

### 5. Cleanup (Optional)
```bash
# Remove all DBT objects from Athena
dbt run-operation cleanup_all

# Clean local artifacts
dbt clean
```

## Project Structure
```
dbt-project/
├── dbt_project.yml              # Project config
├── macros/
│   ├── cleanup.sql              # Cleanup macro
│   └── create_external_table.sql # External table creation
└── models/
    ├── staging/
    │   └── stg_customer_address.sql # Staging model
    └── marts/
        └── address_summary.sql      # Analysis model
profiles.yml                     # Connection settings
```

## Demo Models

- **stg_customer_address**: Staging view of TPC-DS customer address data
- **address_summary**: Address analysis by state and country

## Public Data Source
TPC-DS customer address data: `s3://redshift-downloads/TPC-DS/2.13/10GB/customer_address/`
