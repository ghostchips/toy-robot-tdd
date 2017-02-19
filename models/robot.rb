
# robot class that is used to set and move the robot.

class Robot

  attr_accessor :north, :south, :east, :west, :x, :y, :facing, :compass

  # when creating the robot, pass in the current table that has been created.
  def initialize(table)
    # north defined by the northern most point in the created table
    @north = table.north
    @south = 0
    # east defined by the eastern most point in the created table
    @east = table.east
    @west = 0
    # This array will be used to change the facing direction when rotating left and right
    @compass = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  end

  def place(x, y, facing)
    # check to see if given x and y coordinates are inside the existing table before placing the robot.
    if x >= @south && x <= @north &&
       y >= @west && y <= @east
      @x = x
      @y = y
      @facing = facing.upcase
      return [@x, @y, @facing]
    else
      return false
    end

  end

  def move
    # Check which way the robot is facing to determine movement
    if @facing == 'NORTH' && @x < @north
      @x = @x + 1
      return [@x, @y, @facing]
    end
    if @facing == 'SOUTH' && @x > 0
      @x = @x - 1
      return [@x, @y, @facing]
    end
    if @facing == 'EAST' && @y < @east
      @y = @y + 1
      return [@x, @y, @facing]
    end
    if @facing == 'WEST' && @y > 0
      @y = @y - 1
      return [@x, @y, @facing]
    end
    # if any of the above movements cause the robot to go off the board:
    return false
  end

  def turn_left
    # moving left on 'WEST' will face you 'NORTH'
    if @facing == @compass.first
      @facing = @compass.last
    else
      # Change what direction robot is facing by moving left in the compass array based on current facing direction
    @facing = @compass[@compass.index(@facing) - 1]
    end
  end

  def turn_right
    # moving left on 'WEST' will face you 'NORTH'
    if @facing == 'WEST'
      @facing = 'NORTH'
    else
      # Change what direction robot is facing by moving right in the compass array based on current facing direction
    @facing = compass[compass.index(@facing) + 1]
    end
  end

  def report
    # display current location in array format
    return [@x, @y, @facing]
  end

end
