RSpec.describe FetchCurrentOffer do
  let(:repository) { OfferRepository.new }

  before do
    raw_response_file = File.new("#{Hanami.root}/spec/fixtures/hotshot.txt")
    stub_request(:get, "https://www.x-kom.pl/").to_return(raw_response_file)
  end

  describe 'fetching and parsing data' do

    subject { described_class.new.call }

    it 'creates new offer' do
      expect{ subject }.to change{ repository.all.count }.from(0).to(1)
    end

    context 'within the created offer' do
      let(:offer) { repository.last }

      before :each { subject }

      it 'sets the correct name' do
        expect(offer.name).to eq 'ProductName'
      end

      it 'sets the correct old price' do
        expect(offer.old_price).to eq '299,00 zł'
      end

      it 'sets the correct new price' do
        expect(offer.new_price).to eq '219,00 zł'
      end

      it 'sets the correct discount' do
        expect(offer.discount).to eq '80 zł'
      end

      it 'sets the correct quantity' do
        expect(offer.quantity).to eq 199
      end

      it 'sets the correct image url' do
        expect(offer.image_url).to eq 'https://cdn.x-kom.pl/i/img/promotions/hot-shot,,xxx.png'
      end

      it 'sets the correct product code' do
        expect(offer.product_code).to eq 123
      end
    end
  end
end

