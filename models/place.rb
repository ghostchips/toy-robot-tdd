
class Coordinates
  attr_accessor :command, :x, :y, :facing

  def initialize(command)
    @command = command
  end

  def coordinates
    # split command into facing direction and x y coordinates
    placement_coordinates = @command.split(' ')[1].split(',')
    @x = placement_coordinates[0].to_i
    @y = placement_coordinates[1].to_i
    @facing = placement_coordinates[2]
  end

end
