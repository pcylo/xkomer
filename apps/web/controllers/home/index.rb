module Web::Controllers::Home
  class Index
    include Web::Action
    expose :offers, :current_offer

    def call(params)
      @offers = OfferRepository.new.recent_ordered
      @current_offer = @offers.shift
    end
  end
end
