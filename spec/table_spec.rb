
require_relative "../models/table.rb"

describe Table do

  subject(:table) do
    table = Table.new(5,5)
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

end
