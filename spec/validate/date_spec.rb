RSpec.describe Validate::Date do
  subject(:validator) { described_class.new }
  let(:error)         { PriceInflatorError::InvalidDate }
  let(:message)       { "We don't have data for the given date range. Check the dates" }
  let(:earliest_date) { "01/01/2004" }
  let(:latest_date)   { "01/01/2006" }

  it 'validates day exists within the month' do
    expect{ validator.call('32/12/12', earliest_date, latest_date) }.to raise_error error, message
  end

  it 'validates we have data on the date queried' do
    expect { validator.call('12/12/2017', earliest_date, latest_date) }.to raise_error error, message
  end
end
