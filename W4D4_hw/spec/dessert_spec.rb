require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Carlo") }
  let (:cannoli) { Dessert.new("cannoli", 25, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cannoli.type).to eq("cannoli")
    end

    it "sets a quantity" do
      expect(cannoli.quantity).to eq(25)
    end

    it "starts ingredients as an empty array" do
      expect(cannoli.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("zebra_cake", "red", chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cannoli.add_ingredient("pistachio")
      expect(cannoli.ingredients).to include("pistachio")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["cream", "choco_chip", "pods", "sugar"]

      ingredients.each do |ingredient|
        cannoli.add_ingredient(ingredient)
      end

      expect(cannoli.ingredients).to eq(ingredients)
      cannoli.mix!
      expect(cannoli.ingredients).not_to eq(ingredients)
      expect(cannoli.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cannoli.eat(5)
      expect(cannoli.quantity).to eq(20)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cannoli.eat(400) }.to raise_error('not enough left!') 
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Carlo the Great Baker")
      expect(cannoli.serve).to eq("Chef Carlo the Great Baker has made 25 cannolis!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cannoli)
      cannoli.make_more
    end
  end
end
