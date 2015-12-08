require './auto'

class AutoSeeker

  def initialize data
    @data = data
  end

  def filter key, match
    @autos = autos.select do |auto|
      auto.send(key) == match
    end
  end

  def filter_price min, max
    @autos = autos.select do |auto|
      auto.price.between?(min, max)
    end
  end

  def autos
    @autos ||= @data.map do |row|
      Auto.new(row)
    end
  end

  def self.median_mileage autos
    mileages = autos.collect(&:mileage).compact.sort
    (mileages[(mileages.length - 1) / 2].to_f + mileages[mileages.length / 2].to_f) / 2.0
  end
end
