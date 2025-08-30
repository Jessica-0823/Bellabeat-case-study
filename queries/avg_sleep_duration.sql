select sleep_day, round(avg((total_minutes_asleep) / 60), 2) as avg_sleep_hours from affable-hydra-468812-d9.sleep_day.sleepDay
group by sleep_day
order by sleep_day;
