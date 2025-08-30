# 📊 Bellabeat Case Study- FitBit Smart Device Data Analysis

## 📌 Overview
Bellabeat, a health focused company wants to focus on one product and analyze to gain insight into how customers are using their app. This Analysis helps to find the activity and sleep patterns and to identify opportunities for improvement of customner experience and to promote healthier habits among users.

## 📁 Dataset
- Used from FitBit fitness Tracker Data available from Kaggle. It contains daily activity and health data from 30 eligible fitbit users who have consented to share their information.
- The dataset spans from March 2016 to May 2016

## ⚒️ Tools Used
- Excel(for Exploration)
- SQL(for Data Cleaning)
- Tableau(for Visualization)

## 📊Key Insights
**Daily Activity Trend**: Users have engaged more rise in mid-April, showing a clear rise in active during that period.

**Peak Activity Hours**: Shows activity throughout the day, where users are low during morning hours and reaches high point in the evening.

**Average Sleep Hours**: Shows average sleep hours changes from day to day where users are averaged with 6-7 hours of sleep which is slightly low for adults.

**Monthly Sleep patterns**: On average, users spend more time in bed than the actual hours they sleep. This shows that users may not be sleeping efficiently and could experience restless or interuppted sleep.

**Average Daily Steps by Day of Week**: This shows that users have taken average of low steps during sundays and highest on saturdays. suggesting some challenges that motivates daily activity.

## SQl Queries
### 1. Daily Active Users Trend
```sql
select count(distinct Id) as daily_users, activity_date from affable-hydra-468812-d9.daily_activity.dailyActivity
group by activity_date
order by activity_date;
```
The result of this query shows that how many unique users were active each day.
By grouping the data by activity_date ,and counting distinct users, we can measure daily user participation in the dataset. This helps identify user engagement trends over time by tracking daily active users.

### 2. Peak Activity Hours
```sql
select hour,round(avg(step_total), 2) as avg_steps
 from affable-hydra-468812-d9.hourly_steps.hourlySteps
 group by hour
 order by hour;
```
The result of this query shows the average number of steps taken during each hour of the day, helping to identify peak activity hours.
This helps in understanding when users are most active during the day, useful for finding patterns in daily activity.

### 3. Average Sleep Duration
```sql
select sleep_day, round(avg((total_minutes_asleep) / 60), 2) as avg_sleep_hours from affable-hydra-468812-d9.sleep_day.sleepDay
group by sleep_day
order by sleep_day;
```
The result of this query shows the average sleep duration in hours for each day, allowing us to track daily sleep patterns.
This helps analyze how much users sleep on average each day, which is important for understanding overall health and rest trends.

### 4. Average Monthly Patterns
```sql
select round(avg(total_minutes_asleep)) / 60 as avg_sleep, round(avg(total_time_in_bed)) / 60 as avg_time_in_bed from affable-hydra-468812-d9.sleep_day.sleepDay;
```
The result of this query compares the average sleep duration in hours with the average time spent in bed in hours.
This helps identify the difference between time spent in bed and actual sleep duration, which can reveal insights about sleep quality.

### 5. Average Steps By Day of Week
```sql
select format_date('%A', date(activity_date)) as weekday, round(avg(total_steps)) as avg_steps from affable-hydra-468812-d9.daily_activity.dailyActivity
group by weekday
order by avg_steps desc;
```
The result of this query shows the average number of steps taken on each day of the week, ordered from the most active day to the least.
This helps understand which weekdays users are most active and which days show lower activity, useful for identifying behavioral patterns.

## 📊 Visuals
Below are some charts created in Tableau:

### Daily Active Users
![Daily Active Users](daily-active-users-trend.png)
This chart shows the overall trend of active users in line chart. We can see fluctuations from up to down in activity. Tracking this helps to identify  whether the user engagements is increasing over time and highlights day with high or low activity.

### Peak Activity Hours
![Peak Activity Users](peak-activity-hours.png)
This chart shows the average number of steps from hour of day in line chart. The peaks indicate when most users are active (for example, late morning and early evening). These insights can guide Bellabeat to schedule reminders or challenges during the most active hours.  


### Average Sleep Duration
![Average Sleep Hours](average-sleep-duration.png)
This chart explains the average sleep hours of users from day to day in line chart. Many users sleep less than the average sleep hours.Short sleep duration can affect health and wellness, indicating that Bellabeat could focus on features that improve sleep quality.  


### Average Monthly Sleep Patterns
![Average Monthly Sleep Patterns](avg-sleep-vs-time-in-bed.png)
This chart highlights sleep patterns across different months in bar chart and line chart.The line chart represents time in bed and bar chart represents avg sleep hours. Understanding these trends can help Bellabeat design seasonal wellness campaigns (e.g., sleep improvement tips during stressful months).

### Average Daily Steps by Day of Week
![Average Daily Steps by Day of week](avg-steps-by-week.png)
This chart shows the average number of steps taken on each day of the week in Bar chart. It reveals which days users are more active (e.g., weekdays vs weekends). Bellabeat can use this insight to encourage users to stay active on days with lower step counts.  

## ✅ recommendations
Based on the visualizations. here are some recommendations for Bellabeat :
- Encourage users to reach at least 10,000 steps daily by providing app notifications and small rewards.
- Introduce sleep improvement programs since many users show low average sleep duration.  
- Launch challenges or campaigns during peak activity hours to increase engagement.  
- Personalize recommendations in the app based on individual sleep and activity patterns.  

## 💡Conclusion
This case study highlights how Bellabeat users engage with their daily activities, sleep and step counts. The analysis shows patterns in activity hours, average sleep duration, and diffrence in activities across weekends and weekdays. These insights suggest oppurtunities for bellabeat to improve user engagement and wellness offering personalized recommendations and targeted challenges. Overall, the findings can help guide Bellabeat in enhancing its products and creating a healthier lifestyle experience for its users.

## ⚠️ Limitations
- This dataset represents small set of Bellabeat users, so findings may not related to all the users.
- Some activity has missing values, which may effect overall accuracy.
- The analysis focused on descriptive insights and did not include advanced predictive modeling.

## 🙏 Credits
Data source is from Bellabeat case study dataset from Kaggle / google capstone project.














