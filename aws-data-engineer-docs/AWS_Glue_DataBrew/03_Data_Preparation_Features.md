# Chapter 3: Data Preparation Features in AWS Glue DataBrew

## Introduction

AWS Glue DataBrew is a powerful data preparation service that simplifies the process of cleaning and normalizing data before analysis. This chapter delves into the advanced features of DataBrew, focusing on data profiling, cleaning, transformation, and validation. We will explore built-in functions, custom transformations, and best practices to ensure high-quality data preparation.

## Data Profiling Capabilities and Quality Rules

### Data Profiling

Data profiling in DataBrew involves analyzing the structure and content of your dataset to understand its quality and characteristics. This process helps identify issues such as missing values, outliers, and inconsistencies.

**Key Profiling Features:**
- **Statistics:** Generates summary statistics for each column, including mean, median, standard deviation, and percentiles.
- **Data Distribution:** Visualizes the distribution of data values using histograms and box plots.
- **Data Types:** Identifies and suggests appropriate data types for each column.
- **Value Frequencies:** Shows the frequency of unique values in a column.

### Quality Rules

Quality rules in DataBrew are predefined or custom rules that help ensure data meets specific criteria. These rules can be applied to detect and resolve data quality issues.

**Examples of Quality Rules:**
- **Completeness:** Ensures that a column has no missing values.
- **Validity:** Checks if values in a column conform to a specified format (e.g., email addresses).
- **Consistency:** Verifies that values across multiple columns are consistent (e.g., matching IDs).

## Data Cleaning and Standardization Features

### Deduplication

Deduplication is the process of identifying and removing duplicate records from a dataset. DataBrew provides built-in recipes to detect and eliminate duplicates based on specified columns.

**Example:**
python
# Recipe to remove duplicates based on 'customer_id'
recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "REMOVE_DUPLICATES",
                "parameters": {
                    "sourceColumn": "customer_id"
                }
            }
        }
    ]
)
```

### Null Handling

Handling null values is crucial for data quality. DataBrew offers several methods to manage nulls, including imputation, removal, and flagging.

**Example:**
```python
# Recipe to impute null values with the mean of the column
recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "IMPUTE",
                "parameters": {
                    "sourceColumn": "sales",
                    "imputeValue": "mean"
                }
            }
        }
    ]
)
```

### Pattern Matching

Pattern matching allows you to identify and transform data based on regular expressions. This is useful for standardizing formats and extracting specific patterns.

**Example:**
```python
# Recipe to extract phone numbers using a regex pattern
recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "EXTRACT_PATTERN",
                "parameters": {
                    "sourceColumn": "contact_info",
                    "pattern": r"\d{3}-\d{3}-\d{4}"
                }
            }
        }
    ]
)
```

## Data Transformation Operations

### Joins

DataBrew supports various join operations to combine datasets based on common columns.

**Example:**
```python
# Recipe to perform an inner join on 'customer_id'
recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "JOIN",
                "parameters": {
                    "joinType": "INNER",
                    "sourceDataset": "dataset1",
                    "targetDataset": "dataset2",
                    "joinKeys": ["customer_id"]
                }
            }
        }
    ]
)
```

### Filters

Filters allow you to subset your data based on specific conditions.

**Example:**
```python
# Recipe to filter rows where 'sales' > 1000
recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "FILTER",
                "parameters": {
                    "sourceColumn": "sales",
                    "condition": ">",
                    "value": "1000"
                }
            }
        }
    ]
)
```

### Aggregations

Aggregations help summarize data by calculating metrics such as sum, average, count, etc.

**Example:**
```python
# Recipe to calculate the sum of 'sales' grouped by 'region'
recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "AGGREGATE",
                "parameters": {
                    "sourceColumn": "sales",
                    "aggregationFunction": "SUM",
                    "groupBy": ["region"]
                }
            }
        }
    ]
)
```

## Built-in Functions and Transformations

DataBrew provides a rich set of built-in functions for common data transformations. These functions cover string manipulation, date operations, mathematical calculations, and more.

**Examples:**
- **String Functions:** `UPPER`, `LOWER`, `TRIM`
- **Date Functions:** `CURRENT_DATE`, `DATE_DIFF`
- **Math Functions:** `ADD`, `SUBTRACT`, `MULTIPLY`

## Creating Custom Transformations

DataBrew allows you to create custom transformations using SQL or Python. This flexibility enables you to perform complex data manipulations that go beyond built-in functions.

### Using SQL

**Example:**
```sql
-- Custom SQL transformation to calculate a new column 'total_revenue'
SELECT 
    customer_id, 
    sales, 
    (sales * 1.1) AS total_revenue
FROM 
    my_dataset
```

### Using Python

**Example:**
```python
# Custom Python transformation to calculate a new column 'total_revenue'
import awswrangler as wr

def calculate_total_revenue(df):
    df['total_revenue'] = df['sales'] * 1.1
    return df

recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "CUSTOM_CODE",
                "parameters": {
                    "code": calculate_total_revenue
                }
            }
        }
    ]
)
```

## Data Validation and Quality Checks

Data validation in DataBrew ensures that your transformed data meets predefined quality standards. You can create validation rules to check for errors and inconsistencies.

**Example:**
```python
# Recipe to validate that 'sales' values are positive
recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "VALIDATE",
                "parameters": {
                    "sourceColumn": "sales",
                    "condition": ">",
                    "value": "0"
                }
            }
        }
    ]
)
```

## Examples, Screenshots, and Code Snippets

### Example 1: Data Profiling
![Data Profiling Example](https://docs.aws.amazon.com/databrew/latest/dg/images/data-profiling.png)

### Example 2: Deduplication Recipe
```python
recipe = databrew.create_recipe(
    project_name="my_project",
    recipe_steps=[
        {
            "action": {
                "operation": "REMOVE_DUPLICATES",
                "parameters": {
                    "sourceColumn": "customer_id"
                }
            }
        }
    ]
)


## AWS Documentation and Best Practices

For more detailed information and best practices, refer to the [AWS Glue DataBrew Documentation](https://docs.aws.amazon.com/databrew/latest/dg/what-is.html).

## Sample Exam-Style Questions

### Question 1
**What is the purpose of data profiling in AWS Glue DataBrew?**

**Answer:**
Data profiling in DataBrew helps analyze the structure and content of your dataset to understand its quality and characteristics. It identifies issues such as missing values, outliers, and inconsistencies.

### Question 2
**How can you handle null values in DataBrew?**

**Answer:**
DataBrew offers several methods to manage null values, including imputation (replacing nulls with a specified value or statistical measure like mean), removal (dropping rows or columns with nulls), and flagging (marking null values for further review).

### Question 3
**Describe the process of creating a custom transformation using Python in DataBrew.**

**Answer:**
To create a custom transformation using Python in DataBrew, you define a function that performs the desired transformation and then incorporate this function into a recipe step using the `CUSTOM_CODE` operation. For example, you can create a function to calculate a new column and apply it to your dataset.

### Question 4
**What are quality rules in DataBrew, and how are they used?**

**Answer:**
Quality rules in DataBrew are predefined or custom rules that help ensure data meets specific criteria. They are used to detect and resolve data quality issues such as completeness (ensuring no missing values), validity (checking if values conform to a specified format), and consistency (verifying values across multiple columns).

### Question 5
**How do you perform an inner join in DataBrew?**

**Answer:**
To perform an inner join in DataBrew, you create a recipe step with the `JOIN` operation, specifying the join type as `INNER`, the source and target datasets, and the join keys (common columns). This combines datasets based on matching values in the specified columns.