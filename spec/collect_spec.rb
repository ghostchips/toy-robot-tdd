
require_relative "../models/collect.rb"

describe Collect do

  before(:each) do
    @collect = Collect.new
  end

  describe "attribures of Collect" do
    it "collect is a Collect object" do
      expect(@collect).to be_a(Collect)
    end
    it "collected commands to be an Array" do
      @collect.collect_commands
      expect(@collect.commands).to be_a(Array)
    end
  end
end
