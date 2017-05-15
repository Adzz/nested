RSpec.describe PriceInflator do
  subject { described_class.new('spec/fixture/test.csv') }

  describe '#calculate' do
    let(:date_error_message) { "We don't have data for the given date range. Check the dates" }

    it 'correctly calculates the price inflation rounded to 2 dps' do
      expect(subject.calculate(200_000, 'Aberdeenshire', '01/03/2004', '01/01/2006')).to eq 150020.46
    end

    it "tells you if from date is outside of the data's date range" do
      expect(subject.calculate(200_000, 'Aberdeenshire', '01/03/3012', '01/01/2006')).to eq date_error_message
    end

    it "tells you if the to date is outside the data's range" do
      expect(subject.calculate(200_000, 'Aberdeenshire', '1/03/2004', '01/03/3013')).to eq date_error_message
    end
  end

  describe '#validations' do
    it 'validates the data source' do
      expect { described_class.new('not/a/file') }.to raise_error ArgumentError, "please provide correct file"
    end
  end
end
