class Mailers::Notification
  include Hanami::Mailer

  to      'pawelcylo@gmail.com'
  from    ENV['SMTP_DEFAULT_SENDER']
  subject :mail_subject

  private

  def mail_subject
    offer = OfferRepository.new.last
    "GS: #{ offer.name }"
  end
end
