input = File.new('./input/Day1.txt', 'r').readlines()

@max = [0, 0, 0]
@current = 0

def compare_and_set x
    @max[0] = x if x > @max[0] and x < @max[1]
    (@max[0] = @max[1]; @max[1] = x) if x >= @max[1] and @max[2] >= x
    (@max[0] = @max[1]; @max[1] = @max[2]; @max[2] = x) if x >= @max[2]
end

input.each do |line|
    if line.to_i == 0
        compare_and_set @current
        @current = 0
    else
        @current += line.to_i
    end
end

puts @max[0] + @max[1] + @max[2]