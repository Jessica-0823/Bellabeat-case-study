SELECT Id, DATE(ActivityMinute) AS activity_date,
 1440 - COUNT(*) + SUM(CASE WHEN METs < 3 THEN 1 ELSE 0 END) AS light_minutes,
SUM(CASE WHEN METs BETWEEN 3 AND 6 THEN 1 ELSE 0 END) AS moderate_minutes,
SUM(CASE WHEN METs > 6 THEN 1 ELSE 0 END) AS vigorous_minutes FROM affable-hydra-468812-d9.minute_data.minute_activity
GROUP BY Id, activity_date
ORDER BY activity_date;
