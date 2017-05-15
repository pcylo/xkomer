class Offer < Hanami::Entity
  def items_left_percentage
    self.left_count * 100 / self.quantity
  end
end
