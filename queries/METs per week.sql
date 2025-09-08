SELECT Id, EXTRACT(WEEK FROM ActivityMinute) AS week_activity, 
SUM(METs) AS weekly_met_minutes,
SUM(METs) / (7*1440) AS mets_per_min_in_week FROM affable-hydra-468812-d9.minute_data.minute_activity
GROUP BY Id, week_activity
ORDER BY mets_per_min_in_week DESC;
