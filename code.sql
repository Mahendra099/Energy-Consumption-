-- Calculate daily energy consumption:

SELECT DATE(timestamp) AS date,
       SUM(energy_usage) AS total_energy_consumed
FROM energy_consumption
GROUP BY DATE(timestamp)
ORDER BY DATE(timestamp);

--Calculate monthly energy consumption:

SELECT TO_CHAR(timestamp, 'YYYY-MM') AS year_month,
       SUM(energy_usage) AS total_energy_consumed
FROM energy_consumption
GROUP BY TO_CHAR(timestamp, 'YYYY-MM')
ORDER BY TO_CHAR(timestamp, 'YYYY-MM');

--Identify outliers or anomalies:

SELECT timestamp, energy_usage
FROM energy_consumption
WHERE energy_usage > (SELECT AVG(energy_usage) + 2 * STDDEV(energy_usage)
                      FROM energy_consumption);
					  
-- Calculate average energy consumption per meter:

SELECT meter_id, AVG(energy_usage) AS average_energy_consumed
FROM energy_consumption
GROUP BY meter_id
ORDER BY meter_id;