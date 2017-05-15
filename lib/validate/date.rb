require_relative '../errors/invalid_date.rb'

module Validate
  class Date
    DAYS_PER_MONTH = {
      1 => [*1..31],
      2 => [*1..28],
      3 => [*1..31],
      4 => [*1..30],
      5 => [*1..31],
      6 => [*1..30],
      7 => [*1..31],
      8 => [*1..31],
      9 => [*1..30],
      10 => [*1..31],
      11 => [*1..30],
      12 => [*1..31],
    }

    def call(date, earliest_date, latest_date)
      day, month, year, *rest = date.split('/')
      raise PriceInflatorError::InvalidDate.new unless DAYS_PER_MONTH[month.to_i].include?(day.to_i)
      raise PriceInflatorError::InvalidDate.new unless DateTime.parse(date).between?(DateTime.parse(earliest_date), DateTime.parse(latest_date))
    end
  end
end
