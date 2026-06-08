# 🏅 BigQuery Medallion Data Lakehouse

[![BigQuery](https://img.shields.io/badge/BigQuery-Enterprise-blue?logo=google-cloud)](https://cloud.google.com/bigquery)
[![dbt](https://img.shields.io/badge/dbt-1.8-orange)](https://getdbt.com)
[![Apache Beam](https://img.shields.io/badge/Apache%20Beam-2.56-yellow)](https://beam.apache.org)
[![Data Quality](https://img.shields.io/badge/Data%20Quality-99.97%25-green)](.)

> Modernized data lakehouse replacing legacy Hadoop infrastructure. **500M+ records/month**, 14 data sources, 99.97% data quality SLA.

## 📈 Impact
- Migrated 8TB legacy Hadoop → BigQuery in **47 days** (zero downtime)
- Reduced query time from **4.2 hours → 3.8 seconds** (99.97% faster)
- **$1.2M annual savings** vs on-premise infrastructure
- **500M+ records/month** processed across 14 integrated systems

## 🏗️ Architecture

```
RAW SOURCES          BRONZE (Landing)      SILVER (Cleansed)     GOLD (Business)
─────────────        ────────────────      ─────────────────     ───────────────
ERP System    ──▶   Raw ingestion    ──▶  Dedup + Validate  ──▶ KPIs & Metrics
CRM Platform  ──▶   Schema-on-read   ──▶  Type casting      ──▶ ML Features
IoT Sensors   ──▶   Partitioned      ──▶  SCD Type 2        ──▶ Aggregations
Web Events    ──▶   Clustered        ──▶  Data lineage       ──▶ BI-ready views
14 APIs       ──▶   DLT CDC          ──▶  Quality scores     ──▶ Semantic layer
```

## 🛠️ Stack
`BigQuery` `dbt 1.8` `Apache Beam` `Dataform` `Cloud Composer` `Data Catalog` `Dataplex` `Terraform`

## 📊 SLAs
| Layer | Records/Month | Quality Score | Latency |
|-------|--------------|---------------|---------|
| Bronze | 500M+ | 98.2% | < 5 min |
| Silver | 485M | 99.7% | < 15 min |
| Gold | 421M | 99.97% | < 30 min |
