class FetchCurrentOffer
  def initialize
    @page = load_page
    @repository = OfferRepository.new

    @current_name       = get_by_selector(ENV['NAME_SELECTOR'])
    @current_old_price  = get_by_selector(ENV['OLD_PRICE_SELECTOR'])
    @current_new_price  = get_by_selector(ENV['NEW_PRICE_SELECTOR'])
    @current_discount   = get_by_selector(ENV['DISCOUNT_SELECTOR'])
    @current_image_url  = get_attr_by_selector(ENV['IMAGE_URL_SELECTOR'], 'src').to_s.
                            gsub('-small', '').gsub('?filters=grayscale', '')
    @current_quantity   = get_int_attr_by_selector(ENV['QUANTITY_SELECTOR'], 'aria-valuemax', 0).
                            to_s.to_i
    @current_code       = get_attr_by_selector(ENV['CODE_SELECTOR'], 'data-product-id').
                            to_s.to_i
    @current_left_count = get_int_attr_by_selector(ENV['SOLD_COUNT_SELECTOR'], 'aria-valuenow', 0).
                            to_s.to_i
  end

  def call
    offer_exists? ? update_existing_offer : create_new_offer
  end

  private

  attr_reader :page, :repository, :current_name, :current_old_price, :current_new_price,
              :current_discount, :current_image_url, :current_quantity, :current_code, :existing_id,
              :current_left_count

  def offer_exists?
    @existing_id = OfferRepository.new.find_recent(current_code)
    !!existing_id
  end

  def update_existing_offer
    repository.update(existing_id, left_count: current_left_count)
  end

  def create_new_offer
    repository.create(
      name:         current_name,
      old_price:    current_old_price,
      new_price:    current_new_price,
      discount:     current_discount,
      image_url:    current_image_url,
      quantity:     current_quantity,
      product_code: current_code,
      left_count:   current_left_count
    )
    Mailers::Notification.deliver
  end

  def load_page
    Mechanize.new.get(ENV['BASE_PARSING_URL'])
  end

  def get_by_selector(selector)
    page.at(selector)&.text&.strip
  end

  def get_attr_by_selector(selector, attribute)
    page.at(selector)&.attributes[attribute]
  end

  def get_int_attr_by_selector(selector, attribute, default)
    page.at(selector) ? page.at(selector).attributes[attribute] : default
  end
end
