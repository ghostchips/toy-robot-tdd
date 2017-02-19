

def collect_and_execute_commands(robot)

  puts 'Input toy robot commands, each followed by a new line:'

  collect = Collect.new
  execute = Execute.new(collect)

end
