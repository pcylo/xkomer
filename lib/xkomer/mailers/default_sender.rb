module Mailers::DefaultSender
  def self.included(mailer)
    mailer.class_eval do
      from ENV['SMTP_DEFAULT_SENDER']
    end
  end
end
