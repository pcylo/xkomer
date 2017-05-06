class OfferRepository < Hanami::Repository
  class DuplicatedOffersError < StandardError; end

  def find_recent(code)
    matching = offers.where("created_at > (NOW() - 1 * interval '1 day')").
      where(product_code: code)

    raise OfferRepository::DuplicatedOffersError if matching.count > 1
    matching.last && matching.last[:id]
  end
end
