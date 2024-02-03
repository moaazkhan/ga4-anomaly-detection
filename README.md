# ga4-anomaly-detection
Anomaly-detection on Google Analytics 4 Data in BigQuery

#### Prerequisite:
You have connected GA4 with BigQuery.
Event: first_visit

#### Problem Statment: 
We need to detect anomalies for first_visit time-series data across countries (adding a new dimension).


## 1. ARIMA+ Model
First, create an ML model to detect anomalies: Check bigquery-anomaly-model.sql


## 2. Query Model
Next, query the model to detect anomalies: Check model_query.sql


_You can schedule these queries to detect anomalies on an ongoing basis._
