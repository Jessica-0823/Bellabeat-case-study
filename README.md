# 📊 Bellabeat Case Study- FitBit Smart Device Data Analysis

## Table of Contents
- Overview
- Dataset
- Tools Used
- Key Insights
- SQL Queries
- Visuals
- Recommendations
- Conclusion
- Limitations
- Credits and Acknowledgement

## 📌 Overview
Bellabeat, a health-focused company, aims to better understand how users engage with their products. This case study analyzes Fitbit smart device data to uncover activity and sleep patterns, providing insights to enhance customer experience and promote healthier habits.

## 📁 Dataset
- Contains daily activity and health data from 30 eligible FitBit users who consented to share their information.
- The dataset spans **March–May 2016** and includes three tables:  
- **Daily Activity**  
- **Hourly Activity** 
- **Minute Activity**  

These were cleaned and merged to analyze consumer smart device usage trends, which can inform Bellabeat’s product and marketing strategy.  
Source: https://www.kaggle.com/datasets/arashnic/fitbit from Kaggle.

## 🛠️ Tools Used
- Excel (for Exploration)
- SQL (for Data Cleaning and Transformation)
- Tableau (for Visualization and Dashboards)

## 📊 Key Insights
**Comparison of average daily steps** : Calculates average daily steps for each user. It helps to identify general activity level of each person. 
**Step Goal** : in bar chart that visualizes the average daily steps for various users whether they are reaching the goal of 10000 steps.
**Active vs Sedentary Minutes**: This scatterplot shows the relationship between average sedentary minutes per day and average active minutes per day. The trend line added indicates the overall direction of the relationship.
**Sleep and Sedentary Thresholds** : This scatterplot compares average sleep duration with sedentary time. 
**Sleep Patterns** : It shows whether more time in bed leads to more actual sleep or not.
**Weekend vs Weekday Activity** : Shows the chart where the users have reached the goal are also reaching their goal in weekends or weekdays.
**Peak Activity Per User** : Peak activity hours shows the times of day when engagement, traffic or workload is at highest.
**Calories Burned Per Day** : Calories burned per day is the total amount of energy your body uses in 24 hours. This includes the energy needed to keep your body alive and functioning.
**METs Per Week** : METs per week measure the total energy spent on physical activity over seven days. They are calculated by multiplying the MET value of an activity by the time spent and summing across the week. 
**Weekly Activity minutes by intensity zone** :  shows how much time a person spends in light, moderate and vigorous activity levels. 
**Correlation of steps, calories and distance** :A bar chart of correlation coefficients shows the strength and direction of relationships between steps, calories burned, and distance.




## 🗄️ SQL Queries
### 1. Average Daily Steps
```sql
SELECT Id, AVG(TotalSteps) AS avg_daily_steps FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id
ORDER BY avg_daily_steps DESC; 
```
➡ TShows the average steps per user as a baseline activity level. Most users fall short of the 10,000-step goal, suggesting room for increased daily movement.
### 2. Step Goals
```sql
SELECT Id, COUNTIF(TotalSteps >= 10000) * 100.0 / COUNT(*) AS daily_goal FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id
ORDER BY daily_goal DESC;
```
➡ Compares users’ average steps with a 10k reference line. Many users don’t meet this benchmark, indicating potential for step challenges or motivational features.

### 3. Correlation Between Steps, Calories, and Distance
```sql
SELECT Id, 'steps_vs_calories' AS correlation_type, CORR(TotalSteps, Calories) AS corr_value FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id

UNION ALL

SELECT Id, 'steps_vs_distance' AS correlation_type, CORR(TotalSteps, TotalDistance) AS corr_value FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id 

UNION ALL

SELECT Id, 'calories_vs_distance' AS correlation_type, CORR(Calories, TotalDistance) AS corr_value FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id;
```
➡ Displays correlation values between steps, calories, and distance. Strong positive correlations confirm that higher steps also lead to more calories burned and longer distances

### 4. Active vs. Sedentary Time
```sql
SELECT AVG(SedentaryMinutes) AS avg_sedentary, AVG(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes) as avg_active FROM affable-hydra-468812-d9.daily_data.dailyactivity;
```
➡ Scatterplot of active vs. sedentary minutes. Users with long sedentary times show lower activity, highlighting the need for movement breaks during the day.

### 5. Sleep and Sedentary Thresholds
```sql
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
```
➡ Compares sleep hours with sedentary time. Balanced sleep (7–9 hrs) aligns with healthier activity, while excessive sitting links to higher health risks.

### 6. Sleep Patterns
```sql
SELECT Id,
ROUND(AVG(TotalMinutesAsleep) / 60, 2) AS avg_sleep,
ROUND(AVG(TotalTimeInBed) / 60, 2) AS avg_time_in_bed FROM affable-hydra-468812-d9.daily_data.dailyactivity
GROUP BY Id;
```
➡ Dual-axis chart of time in bed vs. sleep duration. Some users show inefficiency (time in bed but less sleep), pointing to poor sleep quality.

### 7. Weekend vs. Weekday Activity of Users Who Reached The Goal Or Not
```sql
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
```
➡ Groups steps by day of the week. Shows whether the people who are reaching the goal daily are also active in weekends or weekdays Activity tends to increase on weekends, suggesting that leisure time boosts movement.

### 8. Peak Activity per User
```sql
SELECT  EXTRACT(HOUR FROM ActivityHour) AS activity_hour
ROUND(AVG(StepTotal), 2) AS avg_steps FROM affable-hydra-468812-d9.hour_data.hourly_activity
GROUP BY activity_hour
ORDER BY activity_hour;
```
➡Shows peak engagement hours, with the highest activity around 6 PM. This suggests evenings are key times for targeted reminders or app engagement.

### 9. Calories Burned per Day
```sql
SELECT EXTRACT(HOUR FROM ActivityHour) AS hour,
ROUND(AVG(Calories), 2) AS avg_calories FROM affable-hydra-468812-d9.hour_data.hourly_activity
GROUP BY hour
ORDER BY hour
```
➡ Displays total daily calories burned. Variations reflect differences in user activity and can help tailor personalized activity goals.

### 10. METs per Week
```sql
SELECT Id, EXTRACT(WEEK FROM ActivityMinute) AS week_activity, 
SUM(METs) AS weekly_met_minutes,
SUM(METs) / (7*1440) AS mets_per_min_in_week FROM affable-hydra-468812-d9.minute_data.minute_activity
GROUP BY Id, week_activity
ORDER BY mets_per_min_in_week DESC;

```
➡ Summarizes weekly energy expenditure (METs). Most users stay below the 500–1000 MET-minutes recommended for good health, signaling underactivity.

### 11. Weekly Activity Minutes by Intensity Zone
```sql
SELECT Id, DATE(ActivityMinute) AS activity_date,
 1440 - COUNT(*) + SUM(CASE WHEN METs < 3 THEN 1 ELSE 0 END) AS light_minutes,
SUM(CASE WHEN METs BETWEEN 3 AND 6 THEN 1 ELSE 0 END) AS moderate_minutes,
SUM(CASE WHEN METs > 6 THEN 1 ELSE 0 END) AS vigorous_minutes FROM affable-hydra-468812-d9.minute_data.minute_activity
GROUP BY Id, activity_date
ORDER BY activity_date;
```
➡ Breaks activity into light, moderate, and vigorous zones. Many users spend more time in light activity, falling short of moderate-to-vigorous levels recommended by health guidelines.















## 📊 Visuals
Below are some charts created in Tableau:

### Daily Active Users
![Daily Active Users](daily-active-users-trend.png)
This chart shows the overall trend of active users as a line chart. We can see fluctuations from up to down in activity. Tracking this helps to identify  whether the user engagements is increasing over time and highlights day with high or low activity.

### Peak Activity Hours
![Peak Activity Users](peak-activity-hours.png)
This chart shows the average number of steps from hour of day as a line chart. The peaks indicate when most users are active (for example, late morning and early evening). These insights can guide Bellabeat to schedule reminders or challenges during the most active hours.  


### Average Sleep Duration
![Average Sleep Hours](average-sleep-duration.png)
This chart explains the average sleep hours of users from day to day as a line chart. Many users sleep less than the average sleep hours. Short sleep duration can affect health and wellness, indicating that Bellabeat could focus on features that improve sleep quality.  


### Average Monthly Sleep Patterns
![Average Monthly Sleep Patterns](avg-sleep-vs-time-in-bed.png)
This chart highlights sleep patterns across different months as a bar chart and line chart. The line chart represents time in bed and bar chart represents avg sleep hours. Understanding these trends can help Bellabeat design seasonal wellness campaigns.

### Average Daily Steps by Day of Week
![Average Daily Steps by Day of week](avg-steps-by-week.png)
This chart shows the average number of steps taken on each day of the week as Bar chart. It reveals which days users are more active (e.g., weekdays vs weekends). Bellabeat can use this insight to encourage users to stay active on days with lower step counts.  

## 💡 Recommendations
Based on the visualizations. here are some recommendations for Bellabeat :
- Encourage users to reach 10,000+ steps daily using app notifications and small rewards.
- Introduce sleep improvement programs, since users sleep below recommended levels.
- Launch challenges during peak activity hours (late morning, evening) to maximize engagement.
- Provide personalized recommendations based on each user’s activity and sleep trends.

## 📍Conclusion
These findings help Bellabeat identify where users struggle with insufficient sleep and activity and highlight opportunities to improve engagement through personalized programs, challenges, and habit-forming nudges.

## ⚠️ Limitations
- This dataset represents small set of Bellabeat users, so findings may not apply to all the users.
- Some activity has missing values, which may affect overall accuracy.
- The analysis focused on descriptive insights and did not include advanced predictive modeling.

## 🙏 Credits and Acknowledgement
- Data source : https://www.kaggle.com/datasets/arashnic/fitbit from Kaggle.
- Project inspired by the Google Data Analytics Capstone Case Study.














