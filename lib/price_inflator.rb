require 'csv'
require_relative './validate/date.rb'

class PriceInflator
  def initialize(csv_path)
    validate_csv_path(csv_path)
  end

  def calculate(price, borough, from_date, to_date)
    begin
      (price * (index_for(borough, from_date) / index_for(borough, to_date))).to_f.round(2)
    rescue StandardError => e
      e.message
    end
  end

  private

  attr_reader :csv_path

  def index_for(borough, date)
    Validate::Date.new.(date, earliest_date, latest_date)
    CSV.new(File.open(csv_path, 'r'), headers: true, converters: :all).lazy.select do |row|
      row['Date'] == date && row['RegionName'] == borough
    end.map do |row|
      row['Index']
    end.first
  end

  def earliest_date
    CSV.new(File.open(csv_path, 'r'), headers: true, converters: :all).lazy.first['Date']
  end

  def latest_date
    # *nix only, but avoids
    # loading the whole thing into memory
    (`tail -n 1 #{csv_path}`).split(',').first
  end

  def validate_csv_path(csv_path)
    raise ArgumentError, "please provide correct file" if csv_path.nil? || !File.exist?(csv_path)
    @csv_path = csv_path
  end
end
