# Quick Start Guide - PySpark Pipeline

## ⚡ Fast Setup (5 minutes)

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

## 📊 Expected Execution Time

| Dataset Size | Local (4 cores) | Cluster (10 nodes) |
|--------------|-----------------|-------------------|
| 1M records   | ~2 minutes      | ~30 seconds       |
| 10M records  | ~8 minutes      | ~1-2 minutes      |
| 100M records | ~45 minutes     | ~5-8 minutes      |

---

## 🔍 Troubleshooting

**Issue**: `java.lang.OutOfMemoryError`
```python
# Increase memory in script
.config("spark.executor.memory", "8g")
.config("spark.driver.memory", "8g")
```

**Issue**: Spark UI not accessible
```python
# Try different port
.config("spark.ui.port", "4041")
```

**Issue**: Data file not found
```python
# The script will automatically use synthetic data
# Or download real data:
wget https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-01.parquet
```

---

## 📸 Screenshot Checklist

- [ ] Spark UI - Jobs tab showing completed jobs
- [ ] Spark UI - SQL tab with query list
- [ ] Query Details page with DAG visualization
- [ ] Execution plan from `.explain()` output
- [ ] Successful pipeline completion message
- [ ] Caching performance comparison output
- [ ] Output files created confirmation

---

## 🎯 Assignment Checklist

- [x] Load 1GB+ dataset
- [x] Apply 2+ filter operations
- [x] Perform 1+ join operation
- [x] Execute 1+ groupBy with aggregations
- [x] Use withColumn transformations
- [x] Write 2+ SQL queries
- [x] Optimize with early filters
- [x] Use appropriate partitioning
- [x] Write results to Parquet
- [x] Use .explain() for execution plan
- [x] Document performance analysis
- [x] Demonstrate lazy vs eager evaluation
- [x] Show caching optimization (bonus)
- [x] Include screenshots

---

## 💡 Tips for Best Results

1. **Run on a machine with 8GB+ RAM** for best performance
2. **Keep Spark UI open** while running for screenshots
3. **Use synthetic data** if you can't download 1GB+ dataset
4. **Take screenshots immediately** after execution
5. **Read the README.md** for detailed analysis

---

## 🚀 Running on Databricks (Optional)

1. Upload notebook to Databricks workspace
2. Attach to cluster (Runtime 11.3 LTS or higher)
3. Run all cells
4. Screenshots available in Cluster → Spark UI

---

## 📝 Next Steps After Running

1. Review all screenshots
2. Read performance analysis in README
3. Understand execution plans
4. Document your findings
5. Push to GitHub repository

---

## 🆘 Need Help?

- Check Spark logs: `./spark-logs/`
- Review Spark documentation
- Check common issues in README.md

Good luck with your assignment! 🎓
