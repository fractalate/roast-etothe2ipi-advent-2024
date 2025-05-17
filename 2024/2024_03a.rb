lines = []

for line in STDIN
  tmp = line.strip
  lines.push(tmp)
end

regexp = /mul\(\d+,\d+\)/

sum = 0

for i in 0..(lines.length - 1)
  res = lines[i].scan(regexp) # regex captures maybe?!?!?!
  for r in res
    toks = r[4..r.length-2].split(",")
    print toks.to_s + "\n"
    prod = toks[0].to_i * toks[1].to_i
    
    sum = sum + prod
  end
end

print sum.to_s + "\n"
