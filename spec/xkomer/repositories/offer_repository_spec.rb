RSpec.describe OfferRepository do
  describe '#find_recent' do
    subject { described_class.new }

    let(:code) { 99999 }
    let!(:offer_one) { create :offer, product_code: code }
    let!(:offer_with_different_code) { create :offer }

    context 'with single offer matching' do
      let!(:offer_two) { create :offer, product_code: code, created_at: Date.today - 2 }

      it 'returns valid ID of matching offer' do
        returned = subject.find(subject.find_recent(code))
        expect(returned.product_code).to eq code
      end
    end

    context 'with two offers matching' do
      let!(:offer_two) { create :offer, product_code: code }

      it 'raises exception' do
        expect { subject.find_recent(code) }.
          to raise_error(OfferRepository::DuplicatedOffersError)
      end
    end

    context 'with no offers matching' do
      let!(:offer_one) { create :offer, product_code: code, created_at: Date.today - 3  }

      it 'returns nil' do
        expect(subject.find_recent(code)).to be nil
      end
    end
  end
end
