# Data Engineering Project Architecture — Decision Framework

A concise framework to choose architecture and tools for a data engineering project.

## 1. Requirements gathering
Answer key business questions before choosing tools:

- What are the data sources (APIs, databases, files, streams)?
- What is the data volume (GB/day, TB/day, PB/day)?
- What are the latency requirements (real-time, near real-time, batch)?
- Who are the consumers (analysts, ML models, dashboards)?
- What is the budget and team expertise?

## 2. Architecture decision tree (high level)

- Batch only → scheduled/periodic pipelines (daily/hourly)
- Streaming → low-latency/event-driven processing (sub-minute)
- Both batch + streaming → Lambda or Kappa style (hybrid)

## 3. Layer-by-layer tool selection

### Ingestion

- Batch: Fivetran, Airbyte, Stitch, custom scripts
- Streaming: Kafka, Kinesis, Pub/Sub
- API/custom: Mage, Dagster, Airflow with custom operators

### Storage

- Data lake: S3, GCS, ADLS (raw / bronze zone)
- Data warehouse: Snowflake, BigQuery, Redshift, Databricks
- Lakehouse: Delta Lake, Apache Iceberg, Apache Hudi

### Transformation

- SQL-first: dbt (industry standard)
- Large-scale batch/stream: Apache Spark, Databricks
- Streaming transforms: Apache Flink, Spark Structured Streaming

### Orchestration

- Airflow / MWAA / Cloud Composer
- Prefect, Dagster (modern alternatives)
- Mage (notebook-style pipelines)

### Serving

- BI: Tableau, Power BI, Looker, Metabase
- Reverse ETL: Census, Hightouch
- Feature store: Feast, Tecton

## 4. Key decision factors

### Data volume guidance

- < 100 GB/day → Warehouse-first (Snowflake/BigQuery + dbt)
- 100 GB–10 TB/day → Lakehouse (S3 + Iceberg + Spark + dbt)
- > 10 TB/day → Full lakehouse or custom distributed setup

### Team & skills

- Small team → Managed services (Fivetran + Snowflake + dbt Cloud)
- Large team → Open-source stack (Airflow + Spark + Delta Lake)

### Cloud alignment

- AWS: Glue, Kinesis, Redshift, MWAA
- GCP: Dataflow, Pub/Sub, BigQuery, Cloud Composer
- Azure: ADF, Event Hubs, Synapse, Azure Databricks

## 5. Modern reference architecture (2024–2025)

Sources → Airbyte/Fivetran → S3/GCS (Raw)
    ↓
Spark / dbt (Transform)
    ↓
Snowflake / BigQuery (Warehouse)
    ↓
dbt (Semantic layer / marts)
    ↓
BI / ML / Reverse ETL

Orchestration: Airflow / Dagster
Catalog: DataHub / OpenMetadata
Quality: Great Expectations / Soda

## 6. Cross-cutting concerns

| Concern | Tools |
|---|---|
| Data quality | Great Expectations, Soda, dbt tests |
| Catalog | DataHub, OpenMetadata, Amundsen |
| Monitoring | Grafana, Monte Carlo, Bigeye |
| Secrets management | HashiCorp Vault, AWS Secrets Manager |
| CI/CD | GitHub Actions, dbt Cloud CI |
| IaC | Terraform, Pulumi |

## 7. Decision checklist

Before finalizing your architecture, validate:

- SLAs (latency, freshness, uptime) are met
- Cost model (storage, compute, licensing) is acceptable
- Team can operate and maintain the stack
- Vendor lock-in level is acceptable
- Compliance & security requirements satisfied (GDPR, HIPAA)
- Scalability plan exists for 10× growth

**Golden rule:** Start simple. A well-run Airflow + dbt + Snowflake stack often outperforms an overly complex custom architecture.

## Modern Data Stack (MDS) — core components

1. Data sources — databases, SaaS apps, event streams, files, APIs
2. Ingestion connectors — Fivetran, Airbyte, Stitch
3. Cloud data store — Snowflake, BigQuery, Redshift, Databricks
4. BI / visualization — Looker, Tableau, Power BI, Metabase

Additional layers: transformation (dbt), orchestration (Airflow/Dagster), quality (Great Expectations), catalog (DataHub).

## Why "modern"?

- Cloud-native, modular, and scalable
- ELT-first: load raw data, transform in-platform
- Faster to deploy using managed services

## Quick next steps

1. Document sources & SLAs
2. Choose target platform (warehouse or lakehouse)
3. Prototype ingestion + one transform
4. Add monitoring, tests, and catalog

