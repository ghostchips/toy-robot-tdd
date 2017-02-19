
require_relative "../models/execute.rb"

describe Execute do
  before(:each) do
    @table = Table.new(5,5)
    @robot = Robot.new(@table)
    @collect = Collect.new
    @execute = Execute.new(@collect, @robot)
  end

  describe "attributes of execute" do
    it "has a class of Execute" do
      expect(@execute).to be_a(Execute)
    end
  end

end
