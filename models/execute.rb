
class Execute
  attr_accessor :commands

  def initialize(collected_commands)
    @commands = collected_commands
  end

  def execute_commands

    # loop through each collected command, execute each based on the respective robot method.
    commands.each do |command|
      is_place_command = command.include? 'PLACE'

      # check to see if the robot has already been placed and the first command is the 'PLACE' command. If not, cancel the loop and start again.
       if !robot_placed && !is_place_command
         puts '- - - - - - - - - - - - - - - -'
         puts 'PLACE must be the first command'
         puts '- - - - - - - - - - - - - - - -'
         break

       elsif is_place_command

         # if the command is the place command, pull out the placement coordinates and facing direction for the robot.place method arguments.

         place_robot


        # for the rest of the commands, the respective robot method is called
       elsif command == 'MOVE'
         robot.move
       elsif command == 'LEFT'
         robot.left
       elsif command == 'RIGHT'
         robot.right
       elsif command == 'REPORT'
         puts ''
         puts robot.report.join(',')
         puts ''
       end
    end

  end


end
