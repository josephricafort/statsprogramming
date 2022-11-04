# dplyr
library(dplyr)
library(nycflights13)

# filter() picks cases based on their values.
filter(flights, month == 1 && day == 1)

# Select flights flying to “IAH” or “HOU”
filter(flights, dest == "IAH" | dest == "HOU")

#Departed in summer (July, August and September)
filter(flights, month %in% 7:9)

# arrange() changes the ordering of the rows.
slice_tail(arrange(flights, year, month, day))

# How could you use arrange() to sort all missing values to the start?
arrange(flights, desc(is.na(dep_delay)))

# Sort flights to find the fastest (highest speed) flights.
arrange(flights, desc(distance/air_time))

# Which flights travelled the farthest? Which travelled the shortest?
arrange(flights, distance)
arrange(flights, desc(distance))

# select() picks variables based on their names.
select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, matches(c("dep_time", "dep_delay", "arr_time", "arr_delay")))
select(flights, starts_with("dep"), starts_with("arr"))
select(flights, contains("TIME", ignore.case = TRUE))

# mutate() adds new variables that are functions of existing variables.
mutate(flights,
       distance_km = distance * 1.60934,
       air_time_h = air_time * 60,
       speed_km_h = distance_km / air_time_h)

select(flights, dep_time, sched_dep_time, dep_delay)

# summarise() reduces multiple values down to a single summary.
summarise(flights,
          average_dep_delay = mean(dep_delay, na.rm=TRUE),
          average_arr_delay = mean(arr_delay, na.rm=TRUE))

# group_by() allows performing any operation “by group”.
flights_gr <- group_by(flights, year, month, day)
summarise(flights_by_day, 
          average_dep_delay = mean(dep_delay, na.rm=TRUE),
          average_arr_delay = mean(arr_delay, na.rm=TRUE))


pcanceled <- select(flights, year, month, day, dep_delay, arr_delay) %>%
  filter(is.na(dep_delay), is.na(arr_delay)) %>%
  group_by(year, month, day) %>%
  summarize(
    count_dep_delay = n(dep_delay),
    count_arr_delay = n(arr_delay)
  )
