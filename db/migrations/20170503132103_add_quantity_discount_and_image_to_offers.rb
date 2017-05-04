Hanami::Model.migration do
  change do
    add_column :offers, :quantity, Integer
    add_column :offers, :discount, Integer
    add_column :offers, :image_url, String
  end
end
