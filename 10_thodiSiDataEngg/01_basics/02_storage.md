### What Storage Means in Data Engineering

Storage is not the step that “works on” data.  
It is the place that holds data safely and durably before, during, and after processing.

---

#### Common Storage Categories

##### 1. File Storage

Stores data as files in folders/directories.

**Examples**
- Local disk
- Network File System (NFS)
- Shared file servers

**Best for**
- Documents
- Logs
- Media files
- Simple shared access

**Limitation**
- Not ideal for massive scale or distributed analytics by itself

---

##### 2. Object Storage

Stores data as objects with metadata in a flat namespace.

**Examples**
- Amazon S3
- Azure Blob Storage
- Google Cloud Storage

**Best for**
- Data lakes
- Raw and historical data
- Unstructured and semi-structured data

**Strength**
- Very scalable and low cost

---

##### 3. Block Storage

Stores data in fixed-size blocks, like a virtual disk.

**Examples**
- EBS
- Persistent Disks
- SAN storage

**Best for**
- Databases
- Virtual machines
- High-performance transactional workloads

**Strength***
- Fast random read/write access


---

##### 4. Relational Storage
Stores structured data in tables with a defined schema.

**Examples**
- PostgreSQL
- MySQL
- SQL Server

**Best for**
- Transactional systems
- Strongly structured datasets
- Applications needing consistency

---

##### 5. Data Warehouses
Optimized for analytics and querying.

**Examples**
- Snowflake
- Google BigQuery
- Amazon Redshift

**Best for**
- Reporting
- Dashboards
- SQL analytics
- Curated business data

---

##### 6. Data Lakes
Store raw and diverse data types at large scale.

**Best for**
- Structured, semi-structured, and unstructured data
- Low-cost storage
- Machine learning and exploration

**Example**
- Amazon S3
- Google Cloud Storage

---

##### 7. Lakehouse Storage
Combines lake flexibility with warehouse-like structure and performance.

**Best for**
- Analytics and data science on the same platform
- ACID tables on object storage
- Unified architecture

**Example**
- Delta Lake
- Apache Iceberg
- Apache Hudi

---

#### Storage Layers in a Modern Pipeline

A common pattern is to organize storage into layers:

##### Raw / Bronze
- Original ingested data
- Minimal changes
- Useful for recovery and audit

##### Cleaned / Silver
- Standardized and validated data
- Duplicates removed
- Schema aligned

##### Business / Gold
- Curated data for reporting and decision-making
- KPI tables, marts, feature-ready datasets

This layering helps teams move from messy source data to trusted business data.


### Serialization, Compression, and Caching in Storage

These are three important concepts that improve how storage systems **save, move, and retrieve data**.

---

#### 1. Serialization
Serialization is the process of **converting data from an in-memory structure into a storable format**.
When an application works with data, that data is usually in a format like:
- objects
- dictionaries
- lists
- records
- nested structures

Storage systems usually cannot keep those live structures directly.  
So the data is serialized into something like:
- JSON
- CSV
- Avro
- Parquet
- Protocol Buffers
- binary formats

##### Why it is used
Serialization makes data:
- **persistable** — it can be written to disk or object storage
- **portable** — it can be transferred across systems
- **reconstructable** — it can be read back and restored
- **standardized** — systems can agree on a shared format

#### 2. Compression
Compression reduces the size of stored data by encoding it more efficiently.  
It removes redundancy or uses smarter encoding so the same data takes up fewer bytes.

##### Why it is used
Compression helps storage systems:
- reduce storage cost
- move data faster over networks
- improve IO efficiency
- store more history in the same space

##### Types of compression

###### Lossless compression
- No data is lost
- Original data can be fully restored
- Used in most storage systems

**Examples**
- GZIP
- Snappy
- Zstandard
- Brotli

###### Lossy compression
- Some detail is removed
- Common in media like images, audio, and video
- Not usually used for business data storage

---

#### 3. Caching
Caching is the process of keeping frequently accessed data in a faster location so it can be retrieved quickly.
Instead of reading data from slower storage every time, the system stores a copy in memory or a nearby fast layer.

##### Why it is used
Caching improves:
- query speed
- user experience
- system responsiveness
- cost efficiency
- reduced load on primary storage

##### How it works
If data is requested often, the system:
- checks the cache first
- if found, returns it quickly
- if not found, reads from storage
- then places a copy into the cache for next time

##### Common cache locations
- application memory
- distributed cache systems
- database buffer cache
- query engine cache
- file system cache

---

### How the three concepts work together

These concepts usually appear in sequence:

1. Serialization - Converts data into a storable format

2. Compression - Reduces the size of that stored format

3. Caching - Keeps hot data close to consumers for faster reuse

#### Example flow
A processed customer dataset may be:
- serialized into Parquet
- compressed with Snappy
- stored in a warehouse or lakehouse
- cached by the query engine for repeated dashboards

---

#### How they differ

| Concept | Main goal | Where it acts | Benefit |
|---|---|---|---|
| Serialization | Make data storable | Before writing to storage | Converts data into a valid format |
| Compression | Reduce data size | During write/read operations | Saves space and speeds transfer |
| Caching | Speed up access | Near compute or consumers | Improves performance |

