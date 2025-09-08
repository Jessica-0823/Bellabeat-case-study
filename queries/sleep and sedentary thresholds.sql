SELECT Id, ROUND(AVG(TotalSteps), 2) AS avg_steps,
ROUND(AVG(Calories), 2) AS avg_calories,
ROUND(AVG(TotalMinutesAsleep), 2) AS avg_sleep_minutes,
ROUND(AVG(SedentaryMinutes), 2) AS avg_sedentary_minutes,
CASE WHEN AVG(TotalSteps) >= 10000 THEN 'Highly Active'
     WHEN AVG(Totalsteps) BETWEEN 5000 AND 9999 THEN 'Moderately Active'
     else 'Sedentary'
     END AS activity_level,
CASE WHEN AVG(TotalMinutesAsleep) BETWEEN 420 AND 480 THEN 'Good Sleep'
     WHEN AVG(TotalMinutesAsleep) < 420 THEN 'Sleep Deprived'
     ELSE 'Long Sleeper'
     END AS sleep_quality,
CASE WHEN AVG(SedentaryMinutes) > 720 THEN 'High Risk'
    WHEN AVG(SedentaryMinutes) BETWEEN 480 AND 720 THEN 'Moderate Risk'
    ELSE 'Low Risk'
    END AS sedentary_risk
 FROM  affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY ID;
