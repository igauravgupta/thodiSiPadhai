# dbt, Data Platforms, and Transformation Patterns

This note explains what dbt is, what it requires, how it relates to data platforms and cloud providers, and how dbt and Databricks DLT fit into Bronze/Silver/Gold pipelines.

---

## What is dbt?

- dbt (data build tool) is a transformation framework that compiles SQL models and manages dependencies, testing, documentation, and deployment.
- dbt does NOT execute SQL itself — it sends compiled SQL to a connected data platform which runs the queries.

### Required to use dbt

- A supported data platform that can execute SQL and store results (compute + storage).
- Examples: Databricks, Snowflake, BigQuery, Redshift, PostgreSQL, DuckDB (local development).

> Short answer: dbt is a transformation tool that always needs a data platform to provide compute and storage.

---

## Data platforms & cloud providers

Cloud providers supply the underlying infrastructure (storage, VMs, networking, security). Common providers:

- Amazon Web Services (AWS)
- Microsoft Azure
- Google Cloud Platform (GCP)

Data platforms run on top of that infrastructure. Typical mapping:

| Data platform | Type | AWS | Azure | GCP | Typical transform tool |
|---|---|---:|---:|---:|---|
| Databricks | Lakehouse | ✅ | ✅ | ✅ | dbt, DLT, Spark |
| Snowflake | Data warehouse | ✅ | ✅ | ✅ | dbt, Snowflake SQL |
| BigQuery | Data warehouse | ❌ | ❌ | ✅ | dbt, BigQuery SQL |
| Redshift | Data warehouse | ✅ | ❌ | ❌ | dbt, Redshift SQL |
| Synapse | Data warehouse | ❌ | ✅ | ❌ | dbt, Synapse SQL |
| PostgreSQL | DB | Any | Any | Any | dbt, SQL |
| DuckDB | Local analytics | Local | Local | Local | dbt (dev) |
| ClickHouse | OLAP DB | Self/Cloud | Self/Cloud | Self/Cloud | SQL |

---

## Examples

### Databricks on AWS

- AWS provides S3 (storage), EC2 (compute).
- Databricks provides clusters, SQL warehouses, and Delta Lake.
- dbt compiles models and submits SQL to Databricks for execution.

### Snowflake on Azure

- Azure provides infrastructure.
- Snowflake provides virtual warehouses and storage abstraction.
- dbt runs SQL on Snowflake's engine.

---

## dbt vs compute engines (Spark / Snowflake)

- Snowflake has its own proprietary SQL execution engine; it does not use Apache Spark.
- Databricks uses Apache Spark as its execution engine; SQL/pySpark run on Spark clusters.
- Spark can read from and write to Snowflake via connectors, but Spark runs on its own cluster separate from Snowflake.

---

## dbt and DLT (Delta Live Tables)

- dbt: focused on declarative SQL models, testing, docs, and CI/CD for transformations.
- DLT (Databricks Delta Live Tables): Databricks-native pipeline framework for streaming and batch pipelines, with built-in pipeline management and quality controls.

Common organization:

Bronze → Silver → Gold

- Bronze: raw ingested data (usually the output of ingestion).
- Silver & Gold: transformed and enriched layers produced by transformation frameworks (dbt, DLT, Spark).

Note: DLT can orchestrate end-to-end pipelines including Bronze creation; dbt typically manages downstream business transformations.

---

## Typical architecture & orchestration

- Ingestion pipelines land raw data into Bronze.
- Transformation pipelines (dbt, DLT, Spark, etc.) convert Bronze → Silver → Gold.
- Orchestrators (Airflow, Prefect, Databricks Workflows, GitHub Actions) schedule and manage pipeline order and retries.

---

## Interview-ready summaries

- dbt: "dbt compiles SQL models and relies on a connected data platform to execute them; it manages dependencies, tests, and docs."
- dbt requirement: "A supported data platform that provides SQL execution (compute) and storage."
- Bronze: "Typically part of ingestion; transformations usually start from Bronze to produce Silver/Gold, though some frameworks manage all layers."
- Spark vs Snowflake: "Databricks uses Spark; Snowflake has its own engine. Spark can interact with Snowflake but runs externally."

---

## Practical next steps / checklist

- Choose the target data platform for dbt (Snowflake, BigQuery, Databricks, Redshift, etc.).
- Decide whether to use DLT for streaming-first pipelines (Databricks) or dbt for SQL-first transformations.
- Design Bronze/Silver/Gold boundaries and ownership.
- Prototype a simple dbt model and pipeline; validate compute cost, runtime, and testing.

---

## One-line takeaways

- dbt is a transformation orchestration tool — not a compute engine.
- You always need a data platform to run dbt-compiled SQL.
- Bronze = ingestion output; Silver/Gold = transformation output.
- Databricks uses Spark; Snowflake has its own engine.
