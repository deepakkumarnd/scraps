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

# convert time different zones 

time = Time.now
time = time.in_time_zone("Pacific Time (US & Canada)")   # time in PST

# formating time usign strftime

#time.strftime('<fommat string>') : eg
time.strftime('%d/%m/%Y %I:%M %p PST')



require 'date'
