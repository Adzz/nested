module PriceInflatorError
  class InvalidDate < StandardError
    def initialize(msg="We don't have data for the given date range. Check the dates")
      super
    end
  end
end
