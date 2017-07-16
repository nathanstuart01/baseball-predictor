#Seed Initial Total War scores
i = 1
x = 31

while (i < x) do
Team.where(id: i).update(total_war:
  ((Team.find_by(id: i).batting_stat.batting_war) +
  (Team.find_by(id:i).pitching_stat.pitching_war)).round(10))
  i += 1
end

puts "War scores updated"
