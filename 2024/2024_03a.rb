t_file = open("2024_03a_input.txt")
# t_file = open("2024_03a_input_test.txt")

lines = []

for line in t_file
  tmp = line.strip
  lines.push(tmp)
end

regexp = /mul\(\d+,\d+\)/

sum = 0

for i in 0..(lines.length - 1)
  res = lines[i].scan(regexp)
  for r in res
    toks = r[4..r.length-2].split(",")
    print toks.to_s + "\n"
    prod = toks[0].to_i * toks[1].to_i
    
    sum = sum + prod
  end
end

print sum.to_s + "\n"
