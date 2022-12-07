input = File.new('./input/Day5.txt', 'r').readlines()

@containers = input[0...8]
@commands = input[10...input.length()]

@cursor = 0

@stacks = [[], [], [], [], [], [], [], [], []] # look im tired ;-;

def set_stacks
	i = 0
	f = 1
	while i < @containers.length()
		f = 1
		while f < @containers[i].length()
			if (@containers[i][f] != ' ')
				@stacks[((f-1)/4).to_i()] = @stacks[((f-1)/4).to_i()].unshift(@containers[i][f])
			end
			f += 4
		end
		i += 1
	end
end

def process_command command
	command = command.split(' ')
	repeat = command[1].to_i()
	from = command[3].to_i() - 1
	to = command[5].to_i() - 1

	for i in 0...repeat
		obj = @stacks[from].pop
		@stacks[to].push(obj)
	end
end

set_stacks

for command in @commands
	process_command command
end

out = ""
for stack in @stacks
	out += stack[stack.length() - 1]
end
puts out