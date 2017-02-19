
require_relative "./models/table.rb"
require_relative "./models/robot.rb"
require_relative "commands.rb"

# create 5x5 table and toy robot
table = Table.new(5,5)
robot = Robot.new(table)

# run the user input method in a loop
loop do
  collect_and_execute_commands(robot)
end
