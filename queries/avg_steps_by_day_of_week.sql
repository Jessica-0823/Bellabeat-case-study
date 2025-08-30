select format_date('%A', date(activity_date)) as weekday, round(avg(total_steps)) as avg_steps from affable-hydra-468812-d9.daily_activity.dailyActivity
group by weekday
order by avg_steps desc;
