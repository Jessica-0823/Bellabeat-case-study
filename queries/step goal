SELECT Id, COUNTIF(TotalSteps >= 10000) * 100.0 / COUNT(*) AS daily_goal FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id
ORDER BY daily_goal DESC;
