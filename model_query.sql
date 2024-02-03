SELECT * 
FROM ML.DETECT_ANOMALIES(
    MODEL {schema_name}.{model_name},
    STRUCT (0.95 AS anomaly_prob_threshold))
ORDER BY anomaly_probability DESC
LIMIT 10