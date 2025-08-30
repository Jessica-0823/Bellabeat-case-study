select count(distinct Id) as daily_users, activity_date from affable-hydra-468812-d9.daily_activity.dailyActivity
group by activity_date
order by activity_date;
