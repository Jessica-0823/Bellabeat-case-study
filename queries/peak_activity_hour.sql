select hour,round(avg(step_total), 2) as avg_steps
 from affable-hydra-468812-d9.hourly_steps.hourlySteps
 group by hour
 order by hour;

