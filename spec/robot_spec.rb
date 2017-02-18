
require_relative "../models/robot.rb"
require_relative "../models/table.rb"

describe Robot do

  before(:each) do
    @table = Table.new(5,5)
    @robot = Robot.new(@table)
  end

  describe "attributes of robot" do
    it "has a class of Robot" do
      expect(@robot).to be_a(Robot)
    end
    it "north is an Integer" do
      expect(@robot.north).to be_a(Integer)
    end
    it "east is an Integer" do
      expect(@robot.east).to be_a(Integer)
    end
    it "south is an Integer" do
      expect(@robot.south).to be_a(Integer)
    end
    it "west is an Integer" do
      expect(@robot.west).to be_a(Integer)
    end
  end

  describe "@robot initiation values" do
    it "north is same as @table north" do
      expect(@robot.north).to eq(@table.north)
    end
    it "east is same as table east" do
      expect(@robot.east).to eq(@table.east)
    end
    it "south is 0" do
      expect(@robot.south).to eq(0)
    end
    it "west is 0" do
      expect(@robot.west).to eq(0)
    end

  end

  describe "#place" do
    before(:each) do
      @x = 1
      @y = 1
      @facing = "North"
      @robot.place(@x,@y,@facing)
    end

    context "when placing robot" do
      context "when x coordinate is >= to south and <= north, and when y coordinate is >= to west and <= to east" do
        it "x is equal to the input argument" do
          expect(@robot.x).to eq(@x)
          expect(@robot.y).to eq(@y)
          expect(@robot.facing).to eq("NORTH")
        end
      end
    end

  end

  describe "#move" do

    context "when facing north" do
      before(:each) do
        @facing = "North"
      end

      context "moving will not cause the robot to fall" do
        it "robot will move north one" do
          @x = 1
          @y = 1
          @robot.place(@x,@y,@facing)
          @robot.move
          expect(@robot.x).to eq(@x+1)
        end
      end
      context "when moving causes the robot to fall" do
        it "the robot will not move" do
          @x = @robot.north
          @y = 1
          @robot.place(@x,@y,@facing)
          @robot.move
          expect(@robot.move).to eq(false)
        end
      end
    end

    context "when facing south" do
      before(:each) do
        @facing = "South"
      end

      context "moving will not cause the robot to fall" do
        it "robot will move south one" do
          @x = 1
          @y = 1
          @robot.place(@x,@y,@facing)
          @robot.move
          expect(@robot.x).to eq(@x-1)
        end
      end
      context "when moving causes the robot to fall" do
        it "the robot will not move" do
          @x = @robot.south
          @y = 1
          @robot.place(@x,@y,@facing)
          @robot.move
          expect(@robot.move).to eq(false)
        end
      end
    end

    context "when facing east" do
      before(:each) do
        @facing = "East"
      end

      context "moving will not cause the robot to fall" do
        it "robot will move east one" do
          @x = 1
          @y = 1
          @robot.place(@x,@y,@facing)
          @robot.move
          expect(@robot.y).to eq(@y+1)
        end
      end
      context "when moving causes the robot to fall" do
        it "the robot will not move" do
          @x = 1
          @y = @robot.east
          @robot.place(@x,@y,@facing)
          @robot.move
          expect(@robot.move).to eq(false)
        end
      end
    end

    context "when facing east" do
      before(:each) do
        @facing = "West"
      end

      context "moving will not cause the robot to fall" do
        it "robot will move west one" do
          @x = 1
          @y = 1
          @robot.place(@x,@y,@facing)
          @robot.move
          expect(@robot.y).to eq(@y-1)
        end
      end
      context "when moving causes the robot to fall" do
        it "the robot will not move" do
          @x = 1
          @y = @robot.west
          @robot.place(@x,@y,@facing)
          @robot.move
          expect(@robot.move).to eq(false)
        end
      end
    end

  end

end
