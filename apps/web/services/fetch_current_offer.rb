class FetchCurrentOffer
  def initialize
    @page = load_content
    @repository = OfferRepository.new

    @current_name      = get_by_selector(ENV['NAME_SELECTOR'])
    @current_old_price = get_by_selector(ENV['OLD_PRICE_SELECTOR'])
    @current_new_price = get_by_selector(ENV['NEW_PRICE_SELECTOR'])
    @current_discount  = get_by_selector(ENV['DISCOUNT_SELECTOR'])
    @current_image_url = get_attr_by_selector(ENV['IMAGE_URL_SELECTOR'], 'src').to_s.gsub('-small', '')
    @current_quantity  = get_attr_by_selector(ENV['QUANTITY_SELECTOR'], 'aria-valuemax').to_s.to_i
    @current_code      = get_attr_by_selector(ENV['CODE_SELECTOR'], 'data-product-id').to_s.to_i
  end

  def call
    offer_exists? ? update_existing_offer : create_new_offer
  end

  private

  attr_reader :page, :repository, :current_name, :current_old_price, :current_new_price,
              :current_discount, :current_image_url, :current_quantity, :current_code

  def offer_exists?
    false # TODO
  end

  def update_existing_offer
    true
  end

  def create_new_offer
    repository.create(
      name:         current_name,
      old_price:    current_old_price,
      new_price:    current_new_price,
      discount:     current_discount,
      image_url:    current_image_url,
      quantity:     current_quantity,
      product_code: current_code
    )
  end

  def load_content
    Mechanize.new.get(ENV['BASE_PARSING_URL'])
  end

  def get_by_selector(selector)
    page.at(selector)&.text&.strip
  end

  def get_attr_by_selector(selector, attribute)
    page.at(selector)&.attributes[attribute]
  end
end
