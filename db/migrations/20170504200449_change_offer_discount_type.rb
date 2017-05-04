Hanami::Model.migration do
  up do
    set_column_type :offers, :discount, String
  end

  down do
    set_column_type :offers, :discount, Integer
  end
end
