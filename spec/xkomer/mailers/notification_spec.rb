RSpec.describe Mailers::Notification do
  it 'delivers email' do
    mail = Mailers::Notification.deliver
  end
end
