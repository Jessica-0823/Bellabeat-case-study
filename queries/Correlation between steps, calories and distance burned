SELECT Id, 'steps_vs_calories' AS correlation_type, CORR(TotalSteps, Calories) AS corr_value FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id

UNION ALL

SELECT Id, 'steps_vs_distance' AS correlation_type, CORR(TotalSteps, TotalDistance) AS corr_value FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id 

UNION ALL

SELECT Id, 'calories_vs_distance' AS correlation_type, CORR(Calories, TotalDistance) AS corr_value FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id;
