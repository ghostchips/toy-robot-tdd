
# A talble class that determines the size of the table where the robot can roam in.

class Table
  attr_accessor :north, :east

  # Because the coordinates for South and West are 0 and 0, North and East will be the opposite corner and set the maximum boundry for the board.

  def initialize(north, east)
    @north = north
    @east = east
  end

end
