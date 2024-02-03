# ga4-anomaly-detection
Detecting anomalies in website traffic within your Google Analytics 4 data using BigQuery ML. 

#### Prerequisite:
You have connected GA4 with BigQuery and data for at least the past 60 days exists in BigQuery.

#### Problem Statment: 
We need to detect anomalies for "__first_visit__" time-series data across countries (adding a new dimension).

Event: __first_visit__

Granularity: Day


## 1. ARIMA+ Model
First, create ML model to detect anomalies: Check bigquery-anomaly-model.sql


## 2. Querying the Model
Next, query the model to detect anomalies: Check model_query.sql


_You can schedule these queries to detect anomalies on an ongoing basis._

The results will look something like this.

![Screenshot 2024-02-04 at 1 18 46 AM](https://github.com/moaazkhan/ga4-anomaly-detection/assets/7060902/0fbfa5b5-d3a8-475d-a776-b53578f24e04)
