class FetchCurrentOffer
  include Interactor

  def initialize
    @page = Mechanize.new.get('https://www.x-kom.pl/') # TODO: to env
  end

  def call
    # puts get_by_selector '.hot-shot .product-name' # TODO: Selectors to env
    # puts get_by_selector '.hot-shot .old-price'
    # puts get_by_selector '.hot-shot .new-price'
    # puts get_by_selector '.hot-shot .discount-tip-value'
    # puts get_attribute_by_selector('.hot-shot .img-responsive', 'src')
    # puts get_attribute_by_selector('.hot-shot .progress-bar', 'aria-valuemax')

    # offer = Offer.new.tap do |o|
    #   o.name      = get_by_selector '.hot-shot .product-name' # TODO: Selectors to env
    #   o.old_price = get_by_selector '.hot-shot .old-price'
    #   o.new_price = get_by_selector '.hot-shot .new-price'
    #   o.discount  = get_by_selector '.hot-shot .discount-tip-value'
    #   o.image_url = get_attribute_by_selector('.hot-shot .img-responsive', 'src')
    #   o.quantity  = get_attribute_by_selector('.hot-shot .progress-bar', 'aria-valuemax')
    #   o.save!
    # end

    offer = Offer.new(
      name: get_by_selector('.hot-shot .product-name'),
      old_price: get_by_selector('.hot-shot .old-price'),
      new_price: get_by_selector('.hot-shot .new-price'),
      discount: get_by_selector('.hot-shot .discount-tip-value'),
      image_url: get_attribute_by_selector('.hot-shot .img-responsive', 'src'),
      quantity: get_attribute_by_selector('.hot-shot .progress-bar', 'aria-valuemax').to_s.to_i
    )

    puts offer
  end

  private

  attr_reader :page

  def get_by_selector(selector)
    page.at(selector)&.text&.strip
  end

  def get_attribute_by_selector(selector, attribute)
    page.at(selector)&.attributes[attribute]
  end
end
