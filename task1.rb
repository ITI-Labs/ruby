print "Enter number of scores: "
num = gets.chomp.to_i

scores = [] 
for i in 1..num do 
    print "Enter score #{i}: "
    score = gets.chomp.to_i
    scores.push(score)
end

avg=scores.sum / num.to_f


if avg>=90 and avg<=100
    Grade="A"
elif avg>=80 and avg<=89
    Grade="B"
elif avg>=70 and avg<=79
    Grade="C"
elif avg>=60 and avg<=69
    Grade="D"
else
    Grade="F"
end

high=scores.max
low=scores.min

puts "Average: #{avg}"
puts "Grade: #{Grade}"
puts "Highest: #{high}"
puts "Lowest: #{low}"

    