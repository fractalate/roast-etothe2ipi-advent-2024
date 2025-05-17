number_of_inc_dec_lines = 0

lines = []

for line in STDIN
  tmp = line.strip.split(" ")
  
  tmp_nums = []
  for j in 0..(tmp.length-1)
    tmp_nums.push(tmp[j].to_i)
  end
  
  lines.push(tmp_nums)
end

number_of_inc_dec_lines = 0

print lines.count.to_s + "\n"

for i in 0..(lines.count-1)
  breaks_rules = false
  
  diff = lines[i][1] - lines[i][0]
  
  if diff == 0 or diff.abs > 3
    breaks_rules = true
    next
  end
  
  first_difference = (diff < 0) ? "neg" : "pos"
  for j in 2..(lines[i].length-1)
    diff = lines[i][j] - lines[i][j-1]
    if ((diff < 0 or diff > 3) and first_difference == "pos") or ((diff > 0 or diff < -3) and first_difference == "neg") or diff == 0
      breaks_rules = true
      break
    end
  end
  
  if !breaks_rules
    number_of_inc_dec_lines = number_of_inc_dec_lines + 1
    print "inc/dec: " + lines[i].to_s + "\n"
  end
end

print number_of_inc_dec_lines.to_s + "\n"
