class Mailers::Notification
  include Hanami::Mailer

  to      'pawelcylo@gmail.com'
  from    ENV['SMTP_DEFAULT_SENDER']
  subject :mail_subject

  private

  def mail_subject
    offer = Offer.new
    offer.name = 'Lorem ipsum'
    "GS: #{ offer.name }"
  end
end
