SELECT  EXTRACT(HOUR FROM ActivityHour) AS activity_hour
ROUND(AVG(StepTotal), 2) AS avg_steps FROM affable-hydra-468812-d9.hour_data.hourly_activity
GROUP BY activity_hour
ORDER BY activity_hour;
