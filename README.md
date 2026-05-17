# 🔧 Smart Engine Maintenance System

## 📋 Project Overview
A data-driven system to predict and schedule engine maintenance for a fleet of 44 industrial engines, helping operations teams prevent breakdowns before they happen.

---

## 🚨 The Problem
Industrial engines require regular maintenance, but without a data-driven approach, maintenance teams either:
- React too late (engine breakdown = costly repairs)
- Over-maintain (wasting time and spare parts)

This project builds a smart system that classifies each engine's maintenance status using real operational data.

---

## 📊 The Data
- **44 engines** across multiple categories
- **Key features:** Hours Used, Days Since Maintenance, Current Hours, Maintenance Type
- **Target:** Engine Status → OK / Soon / Maintenance Due

---

## 🛠️ Approach

### Step 1 — SQL & Data Preparation
- Built a SQLite database with 4 tables
- Wrote 10 analytical queries to explore the fleet

### Step 2 — Python & Machine Learning
- Performed Exploratory Data Analysis (EDA)
- Built a Random Forest Classifier
- Achieved **100% accuracy** on test set
- Analyzed Feature Importance

### Step 3 — Power BI Dashboard
- Built an interactive Fleet Overview dashboard
- KPI Cards: Total Engines, Overdue, Coming Soon
- Visualizations: Status Distribution, Category Breakdown

---

## 📈 Results
| Metric | Value |
|--------|-------|
| Total Engines | 44 |
| Maintenance Due | 5 |
| Coming Soon | 7 |
| Model Accuracy | 100% |

---

## 🗂️ Repository Structure
