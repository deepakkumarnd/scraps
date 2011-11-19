# Date and time samples


require 'time'

t = Time.now   # current time
t.sunday?      # any weekday

def next_day today
  today+(24*60*60)
end

def prev_day today
  today-(24*60*60)
end



require 'date'
