# Quick Start Guide - PySpark Pipeline

*Ensure Java is UTD (v17 and above)
*Donwload dataset from link and keep in local directory within repository.

### Step 1: Install Dependencies

```bash
# Clone or navigate to project directory
cd pyspark-pipeline

# Create virtual environment
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install requirements
pip install -r requirements.txt
```

### Step 2: Run the Pipeline

**Option A: Jupyter Notebook (Recommended)**
```bash
jupyter notebook pyspark_pipeline.ipynb
```
Then run all cells (Cell → Run All)

**Option B: Python Script**
```bash
python pyspark_pipeline_script.py
```

### Step 3: Capture Screenshots

While the pipeline is running:

1. **Open Spark UI**: http://localhost:4040
2. **Navigate to these tabs**:
   - Jobs: Overview of all executed jobs
   - Stages: Detailed stage breakdown
   - SQL: Query execution details
   - Storage: Cached DataFrames

3. **Take screenshots of**:
   - SQL tab → Click on a query → DAG visualization
   - Jobs tab → Completed jobs list
   - Any query → "Details" → Execution plan

### Step 4: Results

Check the `outputs/` directory for:
- Parquet files with aggregated results
- Dashboard visualization PNG
- Performance metrics

---
