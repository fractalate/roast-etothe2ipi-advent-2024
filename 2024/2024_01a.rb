t_file = open("2024_01a_input.txt") # why not just stdin?

left_list = []
right_list = []

for line in STDIN # stcin for the stdwin
  tmp = line.strip.split() # why not just split?!?!?!
  left_list.push(tmp[0].to_i)
  right_list.push(tmp[1].to_i)
end

left_list.sort! # you can get away without a sort if you use a min/max heap
right_list.sort!

diff_total = 0 
for i in 0..(left_list.length-1)
  diff_total = diff_total + (left_list[i] - right_list[i]).abs
end

print diff_total.to_s + "\n"
