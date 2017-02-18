
require_relative "../models/table.rb"

describe Table do

  subject(:table) do
    table = Table.new(6,5)
  end

  describe "attributes of a table" do
    it "has class of Table" do
      expect(table).to be_a(Table)
    end
    it "north is an integer" do
      expect(table.north).to be_a(Integer)
    end
    it "east is an integer" do
      expect(table.east).to be_a(Integer)
    end
  end

  describe "#size" do
    it "is a array" do
      expect(table.size).to be_a(Array)
    end
    it "first element in the array is north" do
      expect(table.size.first).to eq(table.north)
    end
    it "last element in the array is east" do
      expect(table.size.last).to eq(table.east)
    end

  end
end
