Hanami::Model.migration do
  change do
    add_column :offers, :product_code, Integer
    add_index :offers, :product_code
  end
end
