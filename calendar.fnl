(local {: split-str} (require :utils))

(fn calendar [from-month to-month]
  (let [year  (tonumber (os.date "%Y"))
        dates {}]
    (for [i-month from-month to-month]
      (local last-day-of-month (os.time {:year year :month (+ i-month 1) :day 0}))
      (local year-month (os.date "%Y-%m" (os.time {:year year :month i-month :day 1})))
      (tset dates year-month [])
      (for [i-day 1 (tonumber (os.date "%d" last-day-of-month))]
        (local current-date (os.date "%Y-%m-%d" (os.time {:year year :month i-month :day i-day})))
        (table.insert (. dates year-month) {:date current-date :streak? false})))
    dates))

{: calendar}
