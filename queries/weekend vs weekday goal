SELECT CASE WHEN EXTRACT(DAYOFWEEK FROM ActivityDate) IN(1,7) THEN 'Weekend'
ELSE 'Weekday'
END AS Day_Type,
COUNT(*) AS Days_Count,
ROUND(AVG(TotalSteps), 2) AS Avg_Steps,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM affable-hydra-468812-d9.daily_data.dailyactivity
WHERE TotalSteps >= 10000), 2) AS Percent_of_Goal_Days FROM affable-hydra-468812-d9.daily_data.dailyactivity
WHERE TotalSteps >= 10000
GROUP BY Day_Type
ORDER BY 
CASE Day_Type
WHEN 'Weekday' THEN 1
WHEN 'Weekend' THEN 2
END;
