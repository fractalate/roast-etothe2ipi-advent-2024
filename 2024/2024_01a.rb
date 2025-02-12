t_file = open("2024_01a_input.txt")

left_list = []
right_list = []

for line in t_file
  tmp = line.strip.split("   ")
  left_list.push(tmp[0].to_i)
  right_list.push(tmp[1].to_i)
end

left_list.sort!
right_list.sort!

diff_total = 0 
for i in 0..(left_list.length-1)
  diff_total = diff_total + (left_list[i] - right_list[i]).abs
end

print diff_total.to_s + "\n"
