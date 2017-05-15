RSpec.describe PriceInflator do
  subject { described_class.new('spec/fixture/test.csv') }

  describe '#index_for' do
    it 'selects the row for a given date' do
      expect(subject.index_for('Aberdeenshire', '01/03/2004')).to eq 41.7803169
    end
  end

  describe '#calculate' do
    it 'correctly calculates the price inflation' do
      expect(subject.calculate(200_000, 'Aberdeenshire', '01/03/2004', '01/02/2006')).to eq 152490.27
    end
  end
end
