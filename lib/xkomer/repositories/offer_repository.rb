class OfferRepository < Hanami::Repository
  def find_recent_count(code)
    offers.where("created_at > (NOW() - 1 * interval '1 day')").
      where(product_code: code).count
  end
end
