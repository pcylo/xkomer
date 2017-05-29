module Xkomer
  Hanami::Mailer.configure do
    prepare do
      include Mailers::DefaultSender
    end
  end.load!
end
