require "minitest/autorun"
require "./auto_seeker"

describe AutoSeeker do
  before do
    data = [
      [1,'Red',12999,20.0,'gas'],
      [2,'Blue',13999,25.0,'gas'],
      [3,'Teal',19000,27.0,'gas'],
      [4,'Red',14999,40.0,'diesel'],
    ]
    @seeker = AutoSeeker.new data
  end

  describe "#filter " do
    it "can filter by color " do
      @seeker.filter 'color', 'Red'
      @seeker.autos.collect(&:color).uniq.must_equal ['Red']
    end

    it "can filter by fuel type" do
      @seeker.filter 'fuel', 'gas'
      @seeker.autos.collect(&:color).must_equal ['Red', 'Blue', 'Teal']
    end
  end

  describe "#filter_price" do
    it "can filter by price range" do
      @seeker.filter_price 13000, 15000 
      @seeker.autos.collect(&:price).must_equal [13999, 14999]
    end
  end

  describe ".median_mileage " do
    it "calculates median mileage for all autos" do
      AutoSeeker.median_mileage(@seeker.autos).must_equal 26.0
    end

    it "can handle nil milage" do
      data = [
        [1,'Red',12999,nil,'gas'],
        [1,'Red',12999,25.0,'gas'],
      ]
      seeker = AutoSeeker.new data
      AutoSeeker.median_mileage(seeker.autos).must_equal 25
    end
  end  
end
