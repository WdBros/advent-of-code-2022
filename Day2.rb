ESHAPES = ["A", "B", "C"]
PSHAPES = ["X", "Y", "Z"]

# part 1

def match_result shape1, shape2
    if ESHAPES.index(shape1) == PSHAPES.index(shape2)
        return 3
    elsif ((ESHAPES.index(shape1) + 1) % 3 == PSHAPES.index(shape2))
        return 6
    else
        return 0
    end
end

input = File.new('./input/Day2.txt', 'r').readlines()

count = 0

input.each do |line|
    count += match_result(line[0], line[2]) + PSHAPES.index(line[2]) + 1
end

puts "part 1: " + count.to_s

# part 2
SHAPES = {
    "X" => [0, -1],
    "Y" => [3, 0],
    "Z" => [6, 1]
}

count = 0

input.each do |line|
    count += SHAPES[line[2]][0] + (((ESHAPES.index(line[0]) + SHAPES[line[2]][1]) % 3) + 1)
end

puts "part 2: " + count.to_s