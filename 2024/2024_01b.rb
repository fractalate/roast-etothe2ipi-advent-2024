left_list = []
right_list = []

for line in STDIN
  tmp = line.strip.split()
  left_list.push(tmp[0].to_i)
  right_list.push(tmp[1].to_i)
end

left_list.sort!
right_list.sort!

count_total = 0 
for i in 0..(left_list.length-1)
  count_total = count_total + (right_list.count(left_list[i]) * left_list[i]) # ooooof, O(n^2) could do it in O(n log n) with HEEEPS
end

print count_total.to_s + "\n"
