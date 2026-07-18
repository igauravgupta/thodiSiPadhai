# Serving (Delivery) in Data Pipelines

The serving step delivers curated data to downstream consumers and systems. It exposes data for reporting, applications, ML, and operational syncs.

---

## 1. BI & reporting

- Purpose: provide dashboards, reports, and self-service analytics for business stakeholders.
- Tools: Tableau, Power BI, Looker, Metabase, Superset
- Consumers: analysts, product managers, executives

## 2. API serving

- Purpose: expose curated data to applications and microservices via APIs.
- Patterns: REST, GraphQL, streaming endpoints
- Tools/frameworks: FastAPI, Graphene, Hasura, gRPC

## 3. Data science & ML

- Purpose: serve curated datasets and features for training and inference.
- Feature stores: Feast, Tecton, SageMaker Feature Store
- Deliverables: training datasets, online feature endpoints, model inputs

## 4. Self-service analytics

- Purpose: enable business users to explore and query data directly.
- Tools: Looker (Explores), Mode, ThoughtSpot, Sigma

## 5. Reverse ETL (operational activation)

- Purpose: push transformed data back to SaaS/operational systems (CRM, marketing, support).
- Tools: Census, Hightouch, RudderStack
- Examples: sync segments to Salesforce, update user profiles in HubSpot

---

## Non-functional concerns

- Latency: real-time vs near-real-time vs batch
- Security & access control: RBAC, masking, row-level security
- Monitoring: SLA, freshness (data latency), error detection
- Cost: query cost (warehouse), API serving infrastructure

---

## Quick checklist for serving

- Identify consumer groups and SLAs (freshness, latency)
- Choose serving mechanism (dashboard, API, feature store, reverse ETL)
- Add access controls and lineage for auditability
- Monitor freshness, errors, and costs
