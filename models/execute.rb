
require_relative "place.rb"

class Execute
  attr_accessor :collected, :placed, :robot

  def initialize(collected, robot)
    @collected = collected.commands
    @robot = robot
    @placed = false
  end

  def execute_commands
    # loop through each collected command, execute each based on the respective robot method.

    @collected.each do |command|
      is_place_command = command.include? 'PLACE'

      # check to see if the robot has already been placed and the first command is the 'PLACE' command.
       if !@placed && !is_place_command
         puts '- - - - - - - - - - - - - - - -'
         puts 'PLACE must be the first command'
         puts '- - - - - - - - - - - - - - - -'
         break

       elsif is_place_command

         # pull out the x y coordinates and facing direction for the robot.place method arguments.

         coordinates = Coordinates.new(command)
         coordinates.coordinates

         @robot.place(coordinates.x, coordinates.y, coordinates.facing)

         # if the robot was placed succesfully, changed the status of robot_placed. This is so that when the method is called again 'PLACE' does not have to be the first command.

         if @robot.place(coordinates.x, coordinates.y, coordinates.facing)
           @placed = true
         else
           puts ''
           puts "Robot placed outside of table"
           puts ''
           break
         end

        # for the rest of the commands, the respective robot method is called
       elsif command == 'MOVE'
         @robot.move
       elsif command == 'LEFT'
         @robot.turn_left
       elsif command == 'RIGHT'
         @robot.turn_right
       elsif command == 'REPORT'
        # display robot position
         puts ''
         puts @robot.report.join(',')
         puts ''
       end
    end

  end


end
