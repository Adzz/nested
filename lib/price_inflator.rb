require 'csv'

class PriceInflator
  attr_reader :csv_path
  def initialize(csv_path)
    @csv_path = csv_path
  end

  def calculate(price, borough, from_date, to_date)
    (price * (index_for(borough, from_date) / index_for(borough, to_date))).to_f.round(2)
  end

  def index_for(borough, date)
    CSV.new(File.open(csv_path, 'r'), headers: true, converters: :all).lazy.select do |row|
      row['Date'] == date && row['RegionName'] == borough
    end.map do |row|
      row['Index']
    end.first
  end
end
