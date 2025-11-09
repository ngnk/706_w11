# Screenshot Capture Guide

## 📸 Required Screenshots for Week 11 Assignment

This guide shows exactly what screenshots you need to capture and where to find them.

---

## Screenshot 1: Execution Plan from .explain()

**Location**: Jupyter notebook or Python script output

**When**: After running the hourly_stats query

**What to capture**: Terminal/notebook output showing:
```
== Physical Plan ==
*(2) HashAggregate(keys=[pickup_hour#123], 
     functions=[count(1), avg(fare_amount#45)])
+- Exchange hashpartitioning(pickup_hour#123, 200)
   +- *(1) HashAggregate(keys=[pickup_hour#123], ...)
      +- *(1) Filter (...)
         +- *(1) FileScan parquet [...]
                  PushedFilters: [IsNotNull(passenger_count), ...]
```

**Key elements to show**:
- Exchange node (shuffle operation)
- PushedFilters (predicate pushdown proof)
- HashAggregate (aggregation strategy)
- FileScan with filters

**How to capture**:
1. Run the cell with `hourly_stats.explain(mode="formatted")`
2. Screenshot the output
3. Save as: `screenshots/execution_plan.png`

---

## Screenshot 2: Spark UI - Jobs Tab

**Location**: http://localhost:4040/jobs/

**When**: While pipeline is running or immediately after

**What to capture**: Jobs listing page showing:
- Job ID and Description
- Submission Time
- Duration
- Stages (number of stages per job)
- Status (all should be "Succeeded")

**How to capture**:
1. Open browser to http://localhost:4040
2. Click "Jobs" tab
3. Scroll to show multiple completed jobs
4. Screenshot the page
5. Save as: `screenshots/spark_ui_jobs.png`

**Should show**:
- Multiple jobs (10-20)
- Various durations
- All "Succeeded" status
- Different stage counts

---

## Screenshot 3: Spark UI - SQL Tab

**Location**: http://localhost:4040/SQL/

**When**: After running SQL queries

**What to capture**: SQL query list showing:
- Query descriptions
- Execution time
- Number of shuffle operations
- Query IDs

**How to capture**:
1. Stay in Spark UI (http://localhost:4040)
2. Click "SQL" tab
3. Screenshot showing list of SQL queries
4. Save as: `screenshots/spark_ui_sql.png`

**Should show**:
- Multiple SQL queries executed
- Duration for each query
- Scan metrics (rows read)
- Shuffle metrics

---

## Screenshot 4: Query Details with DAG

**Location**: http://localhost:4040/SQL/ → Click on a specific query

**When**: After clicking on a query from SQL tab

**What to capture**: Detailed query execution page showing:
- DAG (Directed Acyclic Graph) visualization
- Stage breakdown
- Task metrics
- Data size metrics

**How to capture**:
1. In SQL tab, click on a query description
2. Scroll to show the DAG visualization
3. Screenshot showing the complete DAG
4. Save as: `screenshots/query_details.png`

**Should show**:
- Visual DAG with nodes and edges
- Exchange nodes (shuffles)
- Scan nodes
- Aggregate nodes
- Metrics (input/output rows, shuffle read/write)

---

## Screenshot 5: Successful Pipeline Execution

**Location**: Jupyter notebook or terminal output

**When**: After pipeline completes

**What to capture**: Final output showing:
- "PIPELINE COMPLETED SUCCESSFULLY!"
- Output files confirmation
- Final statistics
- No error messages

**How to capture**:
1. Scroll to the end of notebook/script output
2. Screenshot the completion message
3. Should show all "✓" checkmarks
4. Save as: `screenshots/pipeline_success.png`

**Should show**:
```
[12/12] Cleaning up...
✓ Spark session stopped

======================================
PIPELINE COMPLETED SUCCESSFULLY!
======================================

Output files saved to: /home/claude/outputs/
```

---

## Screenshot 6: Caching Performance Comparison

**Location**: Notebook cell output showing caching demo

**When**: After running the caching optimization cell

**What to capture**: Timing comparison showing:
- "Test WITHOUT caching" times
- "Test WITH caching" times
- Performance improvement percentage
- Cache status information

**How to capture**:
1. Find the caching demonstration cell output
2. Screenshot showing both tests
3. Save as: `screenshots/caching_performance.png`

**Should show**:
```
Test WITHOUT caching:
  Action 1: 12.50s, Action 2: 11.80s, Action 3: 12.20s
  Total: 36.50s

Test WITH caching:
  Action 1: 13.20s, Action 2: 2.10s, Action 3: 0.80s
  Total: 16.10s

Performance improvement: 56% faster with caching
```

---

## 📋 Screenshot Checklist

Use this checklist to ensure you have all required screenshots:

- [ ] `execution_plan.png` - Physical plan with PushedFilters
- [ ] `spark_ui_jobs.png` - Jobs tab showing completed jobs
- [ ] `spark_ui_sql.png` - SQL tab with query list
- [ ] `query_details.png` - DAG visualization
- [ ] `pipeline_success.png` - Successful completion
- [ ] `caching_performance.png` - Caching comparison

---

## 💡 Tips for Better Screenshots

### General Tips
1. **Full window**: Capture complete window, not partial
2. **Clear text**: Ensure text is readable
3. **Context**: Include headers/tabs to show where you are
4. **Timing**: Take screenshots while Spark UI is still active
5. **Format**: PNG format preferred (better quality than JPG)

### Spark UI Specific
- Keep pipeline running while capturing UI screenshots
- If UI closes, run a cell with `time.sleep(300)` to keep it open
- Spark UI port is usually 4040, may be 4041 if 4040 is busy
- Click around to see different views before final screenshots

### Notebook Specific
- Use "Cell → All Output → Clear" before running if you want clean output
- Restart kernel and run all for clean execution before screenshots
- Export to HTML after taking screenshots for submission

---

## 🚨 Common Issues

### Issue: Spark UI not accessible
**Solution**: 
```python
# Check Spark UI URL
print(spark.sparkContext.uiWebUrl)

# If port is different
# Open the URL shown in output
```

### Issue: UI closed before screenshots
**Solution**:
```python
# Add at end of notebook to keep UI open
import time
print("Spark UI will stay open for 5 minutes")
print(f"Access at: {spark.sparkContext.uiWebUrl}")
time.sleep(300)  # Keep UI open for 5 minutes
spark.stop()
```

### Issue: Can't see execution plan
**Solution**:
```python
# Use different explain modes
hourly_stats.explain(extended=True)  # More detail
hourly_stats.explain(mode="formatted")  # Better formatting
```

---

## 📁 Organizing Screenshots

After capturing all screenshots:

```bash
pyspark-pipeline/
└── screenshots/
    ├── execution_plan.png
    ├── spark_ui_jobs.png
    ├── spark_ui_sql.png
    ├── query_details.png
    ├── pipeline_success.png
    └── caching_performance.png
```

Then add them to your README.md:

```markdown
## Screenshots

### Execution Plan
![Execution Plan](screenshots/execution_plan.png)

### Spark UI - Jobs
![Spark UI Jobs](screenshots/spark_ui_jobs.png)

[... and so on ...]
```

---

## ✅ Before Submission

1. Review all screenshots for clarity
2. Ensure no sensitive information visible
3. Verify all required screenshots present
4. Add screenshots to README.md
5. Push to GitHub repository

---

## 🎯 What Graders Look For

In your screenshots, graders will verify:
- **Predicate pushdown**: PushedFilters in execution plan
- **Optimization**: BroadcastHashJoin vs SortMergeJoin
- **Shuffle operations**: Exchange nodes in DAG
- **Successful execution**: No errors, all jobs completed
- **Caching benefit**: Clear performance improvement
- **Real execution**: Actual Spark UI captures, not just code

---

Good luck with your screenshots! 📸
