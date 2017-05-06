RSpec.describe OfferRepository do
  describe '#find_recent_count' do
    subject { described_class.new }

    let(:code) { 99999 }
    let!(:offer_one) { create :offer, product_code: code }
    let!(:offer_with_different_code) { create :offer }

    context 'with single offer matching' do
      let!(:offer_two) { create :offer, product_code: code, created_at: Date.today - 2 }

      it 'returns valid number of matching offers' do
        expect(subject.find_recent_count(code)).to eq 1
      end
    end

    context 'with two offers matching' do
      let!(:offer_two) { create :offer, product_code: code }

      it 'returns valid number of matching offers' do
        expect(subject.find_recent_count(code)).to eq 2
      end
    end

    context 'with no offers matching' do
      let!(:offer_one) { create :offer, product_code: code, created_at: Date.today - 3  }

      it 'returns valid number of matching offers' do
        expect(subject.find_recent_count(code)).to eq 0
      end
    end
  end
end
