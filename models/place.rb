
class Place

  attr_accessor :position

  def place_robot

    placement_coordinates = command.split(' ')[1].split(',')
    x = placement_coordinates[0].to_i
    y = placement_coordinates[1].to_i
    facing = placement_coordinates[2]
    #  if the robot was placed succesfully, changed the status of robot_placed. This is so that when the method is called again 'PLACE' does not have to be the first command.
    @position = [x, y, facing]
  end

end
