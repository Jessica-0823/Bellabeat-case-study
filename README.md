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





## 🗄️ SQL Queries
### 1. Daily Active Users Trend
```sql
SELECT COUNT(DISTINCT Id) AS daily_users, 
       activity_date 
FROM affable-hydra-468812-d9.daily_activity.dailyActivity
GROUP BY activity_date
ORDER BY activity_date;
```
➡ The result of this query shows that how many unique users were active each day. By grouping the data by activity_date ,and counting distinct users, we can measure daily user participation in the dataset. This helps identify user engagement trends over time by tracking daily active users.

### 2. Peak Activity Hours
```sql
SELECT hour, 
       ROUND(AVG(step_total), 2) AS avg_steps
FROM affable-hydra-468812-d9.hourly_steps.hourlySteps
GROUP BY hour
ORDER BY hour;
```
➡The result of this query shows the average number of steps taken during each hour of the day, helping to identify peak activity hours. This helps in understanding when users are most active during the day, useful for finding patterns in daily activity.

### 3. Average Sleep Duration
```sql
SELECT sleep_day, 
       ROUND(AVG(total_minutes_asleep / 60), 2) AS avg_sleep_hours
FROM affable-hydra-468812-d9.sleep_day.sleepDay
GROUP BY sleep_day
ORDER BY sleep_day;
```
➡The result of this query shows the average sleep duration in hours for each day, allowing us to track daily sleep patterns. This helps analyze how much users sleep on average each day, which is important for understanding overall health and rest trends.

### 4. Average Monthly Patterns
```sql
SELECT ROUND(AVG(total_minutes_asleep)) / 60 AS avg_sleep, 
       ROUND(AVG(total_time_in_bed)) / 60 AS avg_time_in_bed
FROM affable-hydra-468812-d9.sleep_day.sleepDay;
```
➡ The result of this query compares the average sleep duration in hours with the average time spent in bed in hours. This helps identify the difference between time spent in bed and actual sleep duration, which can reveal insights about sleep quality.

### 5. Average Steps By Day of Week
```sql
SELECT FORMAT_DATE('%A', DATE(activity_date)) AS weekday, 
       ROUND(AVG(total_steps)) AS avg_steps
FROM affable-hydra-468812-d9.daily_activity.dailyActivity
GROUP BY weekday
ORDER BY avg_steps DESC;
```
➡ The result of this query shows the average number of steps taken on each day of the week, ordered from the most active day to the least. This helps understand which weekdays users are most active and which days show lower activity, useful for identifying behavioral patterns.

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














