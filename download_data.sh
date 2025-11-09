#!/bin/bash

# Data Download Script for NYC Taxi Pipeline
# Downloads NYC TLC Trip Record Data

echo "=========================================="
echo "NYC Taxi Data Download Script"
echo "=========================================="
echo ""

# Create data directory
mkdir -p data
cd data

echo "Downloading NYC Taxi Trip Data..."
echo ""

# Yellow Taxi Data - 2023 (Multiple months for 1GB+ dataset)
echo "[1/3] Downloading January 2023 data (~700MB)..."
wget -c https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-01.parquet

echo ""
echo "[2/3] Downloading February 2023 data (~700MB)..."
wget -c https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-02.parquet

echo ""
echo "[3/3] Downloading March 2023 data (~700MB)..."
wget -c https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-03.parquet

echo ""
echo "=========================================="
echo "Download Complete!"
echo "=========================================="
echo ""
echo "Total size: ~2.1GB"
echo "Files downloaded to: $(pwd)"
echo ""
echo "File list:"
ls -lh *.parquet
echo ""
echo "To use this data, update the data_path in the notebook:"
echo "  data_path = 'data/yellow_tripdata_2023-*.parquet'"
echo ""
echo "Note: If downloads fail, you can:"
echo "1. Use the synthetic data generator in the notebook"
echo "2. Download manually from: https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page"
echo "=========================================="
