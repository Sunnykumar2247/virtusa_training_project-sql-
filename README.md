# 📦 E-Commerce Logistics Tracker (SQL Project)

## 📌 Project Overview

The **E-Commerce Logistics Tracker** is an SQL-based project designed to analyze shipment data for a logistics company. It helps identify delayed and lost-in-transit shipments, evaluate delivery partner performance, and optimize delivery operations.

---

## 🏢 Business Problem

SwiftShip, a third-party logistics provider, handles thousands of shipments daily. The key challenges are:

* Identifying delayed shipments
* Detecting lost-in-transit orders
* Evaluating underperforming delivery partners

---

## 🎯 Objectives

* Track shipment delivery status
* Identify delays based on promised vs actual delivery dates
* Rank delivery partners based on performance
* Analyze popular delivery zones

---

## 🗂️ Database Schema

### 1. Partners

Stores delivery partner details

* partner_id (PK)
* partner_name
* region

### 2. Shipments

Stores shipment information

* shipment_id (PK)
* partner_id (FK)
* origin_city
* destination_city
* promised_date
* actual_delivery_date
* status

### 3. DeliveryLogs

Tracks shipment updates

* log_id (PK)
* shipment_id (FK)
* update_time
* location
* status

---

## ⚙️ Key Features

### 🔹 Delayed Shipment Detection

Find shipments where delivery exceeded promised date.

### 🔹 Performance Ranking

Evaluate partners based on:

* Total deliveries
* Successful deliveries
* Returned deliveries
* Success rate (%)

### 🔹 Partner Scorecard

Ranks partners based on:

* Least delays
* Highest success rate

### 🔹 Zone Analysis

Identifies most popular destination city in the last 30 days.

### 🔹 Lost in Transit Detection

Detect shipments with no updates for a long duration.

---

## 🛠️ Technologies Used

* SQL (MySQL / PostgreSQL)
* Relational Database Concepts
* Joins, Aggregations, Group By
* Case Statements & Subqueries

---

## 📊 Sample Insights

* Identify top-performing delivery partners
* Detect logistics bottlenecks
* Optimize delivery routes
* Improve customer satisfaction

---

## 🚀 How to Run

1. Create database
2. Run CREATE TABLE scripts
3. Insert sample data
4. Execute SQL queries

---

## 📚 Learning Outcomes

* Database design and normalization
* Writing complex SQL queries
* Data analysis using SQL
* Real-world problem solving

---

## 👩‍💻 Author

**Sunny kumar**
B.Tech CSE Student

---

## 📌 Future Enhancements

* Dashboard integration (Power BI / Tableau)
* Real-time tracking system
* Predictive delay analysis using ML

---
