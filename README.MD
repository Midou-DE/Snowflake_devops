

### Overview of Snowflake Feature for Schema-Agnostic DDL Deployment

This repository introduces a new feature in Snowflake that simplifies the deployment of DDL (Data Definition Language) objects, without requiring concern for schema changes. Specifically, the **CREATE OR ALTER** functionality (currently limited to **tables** and **tasks** in Snowflake) allows us to modify database objects without losing existing data, all within a single script.

### Structure of the Repository

Each folder in the repository contains two types of SQL scripts for each object:

- **deploy_{name}.sql**: Script to deploy or modify the database object (e.g., creating a table).
- **verify_{name}.sql**: Script to verify that the object has been successfully deployed (e.g., checking that the table exists).

### Deployment and Verification Pipelines

In the root of the project, you will find:

- **deploy_pipeline**: Script to run all deploy_{name}.sql files across all folders.
- **verify_pipeline**: Script to execute all verify_{name}.sql files, ensuring each object has been correctly deployed.

### Deployment Using CI/CD

To integrate Snowflake with CI/CD pipelines, follow these steps:

1. **Create API Integration**: Set up a connection between your Git repository and Snowflake by configuring API integration.
2. **Connect to Snowflake**: Establish a connection to your Snowflake instance.
3. **Install Snowflake CLI**: Use Snowflake's CLI (SnowSQL or GitLab Snowflake CLI) to enable executing SQL commands such as `snow git execute` and `execute immediate`.
4. Additional steps and configurations are well-documented in the accompanying YAML file, guiding through the CI/CD setup process.
