class Mailers::Notification
  include Hanami::Mailer

  to      'pawel@firma.xin.pl'
  subject :mail_subject

  private

  def mail_subject
    offer = Offer.new
    offer.name = 'Lorem ipsum'
    "GS: #{ offer.name }"
  end
end
