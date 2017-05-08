RSpec.describe Web::Controllers::Home::Index do
  let(:action) { described_class.new }
  let!(:offer_one) { create :offer }
  let!(:offer_two) { create :offer }
  let!(:offer_three) { create :offer }

  it 'returns success response code' do
    expect(subject.call({})[0]).to eq 200
  end
end
