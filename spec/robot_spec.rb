
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
    it "compass is an array" do
      expect(@robot.compass).to be_a(Array)
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
    it "compass cointains all cardinal directions" do
      expect(@robot.compass).to eq(['NORTH', 'EAST', 'SOUTH', 'WEST'])
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

  describe "#turn_left" do
    before(:each) do
      @x = 1
      @y = 1
    end

    context "when robot turns left" do
      it "facing direction should rotate left by one cardinal direction" do
        @facing = @robot.compass[rand(1..2)]
        @robot.place(@x,@y,@facing)
        @robot.turn_left
        @new_direction = @robot.compass[@robot.compass.index(@facing) - 1]
        expect(@robot.facing).to eq(@new_direction)
      end
      context "when robot turns left when facing West" do
        it "direction should change to face North" do
          @facing = @robot.compass.first
          @robot.place(@x,@y,@facing)
          @robot.turn_left
          expect(@robot.facing).to eq(@robot.compass.last)
        end
      end
    end
  end

  describe "#turn_rigt" do
    before(:each) do
      @x = 1
      @y = 1
    end

    context "when robot turns right" do
      it "facing direction should rotate right by one cardinal direction" do
        @facing = @robot.compass[rand(1..2)]
        @robot.place(@x,@y,@facing)
        @robot.turn_right
        @new_direction = @robot.compass[@robot.compass.index(@facing) + 1]
        expect(@robot.facing).to eq(@new_direction)
      end
      context "when robot turns right when facing North" do
        it "direction should change to face West" do
          @facing = @robot.compass.last
          @robot.place(@x,@y,@facing)
          @robot.turn_right
          expect(@robot.facing).to eq(@robot.compass.first)
        end
      end
    end
  end


end
