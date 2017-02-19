
require_relative "./models/collect.rb"
require_relative "./models/execute.rb"

def collect_and_execute_commands(robot)

  collect = Collect.new
  collect.message
  collect.collect_commands

  execute = Execute.new(collect, robot)
  execute.execute_commands

end
